<?php
namespace backstage\controllers;

use yii\web\Controller;
use backstage\models\Admin;
use Yii;

class PublicController extends Controller
{
    public function actionLogin()
    {
//        $this->layout = false;
        $model = new Admin;
        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            if ($model->login($post)) {
                $this->redirect(['site/index']);
                Yii::$app->end();
            }
        }
        return $this->render("login", ['model' => $model]);
    }

    public function actionLogout()
    {
        Yii::$app->admin->logout(false);
        return $this->goback();
    }

    public function actionSeekpassword()
    {
        $this->layout = false;
        $model = new Admin;
        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            if ($model->seekPass($post)) {
                Yii::$app->session->setFlash('info', '电子邮件已经发送成功，请查收');
            }
        }
        return $this->render("seekpassword", ['model' => $model]);
    }

}
