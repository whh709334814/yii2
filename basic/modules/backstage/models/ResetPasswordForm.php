<?php
/**
 * Created by PhpStorm.
 * User: xuguoliang
 * Date: 2016/4/4
 * Time: 17:32
 */
namespace backstage\models;

use yii\base\Model;
use Yii;

/**
 * Password reset form
 */
class ResetPasswordForm extends Model
{
    public $adminpass;
    public $repassword;


    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['adminpass','repassword'], 'required'],
            [['adminpass','repassword'], 'string', 'min' => 6],
            ['repassword', 'compare', 'compareAttribute' => 'adminpass','message'=>'两次输入的密码不一致！'],
        ];
    }

    /**
     * Resets password.
     *
     * @return boolean if password was reset.
     */
    public function resetPassword()
    {
        $user = $this->_user;
        $user->setPassword($this->adminpass);

        return $user->save();
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'adminpass' => '新密码',
            'repassword' => '确认密码'
        ];
    }
}
