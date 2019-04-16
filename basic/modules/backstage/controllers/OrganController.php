<?php

namespace backstage\controllers;

use Yii;
use backstage\models\permission\search\OrganSearch;
use backstage\components\BaseController;

class OrganController extends BaseController
{

    /**
     * Displays homepage.
     * @return string
     */
    public function actionIndex()
    {
        $model = new OrganSearch();
        $dataProvider = $model->search(Yii::$app->request->get());
        return $this->render('index',[
            'dataProvider'=>$dataProvider,
            'model'=>$model
        ]);
    }

}
