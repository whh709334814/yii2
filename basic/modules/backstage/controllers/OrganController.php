<?php

namespace backstage\controllers;
use backstage\models\permission\search\OrganSearch;
use backstage\components\BaseController;
use backstage\models\Organ;
use Yii;

class OrganController extends BaseController
{

    public function actionSite()
    {
        $model = new OrganSearch();
        $dataProvider = $model->search(Yii::$app->request->get());
        return $this->render('site',[
            'dataProvider'=>$dataProvider,
            'model'=>$model
        ]);
    }
    public function actionAdd(){
        $model = new Organ();
        if(Yii::$app->request->isPost){
            $res = $model->add(Yii::$app->request->post());
            if ($res) {
                Yii::$app->session->setFlash('info', '添加成功');
            } else {
                Yii::$app->session->setFlash('info', '添加失败');
            }
        }
        return $this->render('add', ['model'=>$model]);
    }

    public function actionUpdate(){
        if(Yii::$app->request->isPost){
//            $model->add(Yii::$app->request->post());
        }else{
            $model = Organ::findOne(['organ_id'=>Yii::$app->request->get('organ_id')]);
//            $model->organ_time =date('Y-m-d H:i:s', $model->organ_time);
            return $this->render('update', ['model'=>$model]);
        }
    }
    public function actionDelete(){
        if (Yii::$app->request->isPost){

        }
    }
}
