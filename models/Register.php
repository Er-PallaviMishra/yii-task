<?php

namespace app\models;

use Yii;
use app\models\Register;
use yii\web\IdentityInterface;

/**
 * This is the model class for table "register".
 *
 * @property int $id
 * @property string|null $username
 * @property string|null $email
 * @property string|null $password
 * @property string|null $authKey
 * @property string|null $accessToken
 */
class Register extends \yii\db\ActiveRecord implements \yii\web\IdentityInterface
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'register';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['username', 'email'], 'string', 'max' => 80],
            [['password','authKey', 'accessToken'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'username' => 'Username',
            'email' => 'Email',
            'password' => 'Password',

        ];
    }

    public static function findIdentity($id)
    {
        return self::findOne($id);
    }
    public static function findIdentityByAccessToken($token, $type = null)
    {
        return self::findOne(['accessToken'=>$token]);
    }
    public static function findByUsername($username)
    {
        return self::findOne(['username'=>$username]);
    }
    public function getId(){
        return $this->id;
    }
    public function getAuthKey()
    {
        return $this->authKey;
    }
    public function validateAuthKey($authKey)
    {
        return $this->authKey === $authKey;
    }
    public function validatePassword($password){
        return password_verify($password,$this->password);
    }
}
