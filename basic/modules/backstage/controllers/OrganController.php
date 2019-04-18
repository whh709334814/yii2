<?php

namespace backstage\controllers;
use backstage\models\permission\search\OrganSearch;
use backstage\components\BaseController;
use backstage\models\Organ;
use Yii;
use yii\web\Response;
use yii\bootstrap\ActiveForm;

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
            $model->add(Yii::$app->request->post());
        }else{
            return $this->render('add', ['model'=>$model]);
        }
    }

    public function actionUpdate(){
        if(Yii::$app->request->isPost){
//            $model->add(Yii::$app->request->post());
        }else{
            $model = Organ::findOne(['organ_id'=>Yii::$app->request->get('organ_id')]);
            return $this->render('update', ['model'=>$model]);
        }
    }
    public function actionDelete(){
        if (Yii::$app->request->isPost){

        }
    }
}
