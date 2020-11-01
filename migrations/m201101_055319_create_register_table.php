<?php

use yii\db\Migration;

/**
 * Handles the creation of table `{{%register}}`.
 */
class m201101_055319_create_register_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('{{%register}}', [
            'id' => $this->primaryKey(),
            'username' => $this->string(),
            'email' => $this->string(),
            'password' => $this->string(),
            'authKey' => $this->string(),
            'accessToken' => $this->string(),
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('{{%register}}');
    }
}
