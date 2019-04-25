<?php

namespace backstage\controllers;
use backstage\components\BaseController;
use backstage\models\ResetPasswordForm;
use Yii;
use backstage\models\Admin;
class PersonalController extends BaseController
{
    public function actionResetPassword()
    {
        $model = new ResetPasswordForm();
        if($model->load(Yii::$app->request->post()) && $model->validate()) {
            $user = Admin::findOne(Yii::$app->user->id);
            $user->setPassword($model->password);
            if($user->save()) {
                Yii::$app ->session->setFlash('success','修改密码成功');
                return $this->goHome();
            }
        }
        return $this->render('reset-password', [
            'model' => $model,
        ]);
    }

}
