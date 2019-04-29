<?php

namespace backstage\controllers;
use backstage\components\BaseController;
use backstage\models\ResetPasswordForm;
use Yii;
use backstage\models\Admin;
class PersonalController extends BaseController
{
    protected $mustlogin = ['reset-password'];
    public function actionResetPassword()
    {
        $model = new ResetPasswordForm();
        if($model->load(Yii::$app->request->post()) && $model->validate()) {
            $user = Admin::findOne(Yii::$app->admin->id);
            $user->setPassword($model->adminpass);
            if($user->save()) {
                Yii::$app ->session->setFlash('success','修改密码成功');
                Yii::$app->admin->logout(false);
                return $this->goback();
            }
        }
            return $this->render('reset-password', [
                'model' => $model,
            ]);
    }

}
