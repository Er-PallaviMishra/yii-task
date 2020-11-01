<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "pets".
 *
 * @property int $id
 * @property string $name
 * @property string $description
 * @property float $cost
 * @property string $picture
 * @property string $dateposted
 * @property int $category_id
 *
 * @property Categories $category
 */
class Pets extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'pets';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'description', 'cost', 'picture', 'dateposted', 'category_id'], 'required'],
            [['description'], 'string'],
            [['cost'], 'number'],
            [['dateposted'], 'safe'],
            [['category_id'], 'integer'],
            [['name', 'picture'], 'string', 'max' => 255],
            [['category_id'], 'exist', 'skipOnError' => true, 'targetClass' => Categories::className(), 'targetAttribute' => ['category_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'description' => 'Description',
            'cost' => 'Cost',
            'picture' => 'Picture',
            'dateposted' => 'Dateposted',
            'category_id' => 'Category ID',
        ];
    }

    /**
     * Gets query for [[Category]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasOne(Categories::className(), ['id' => 'category_id']);
    }
}
