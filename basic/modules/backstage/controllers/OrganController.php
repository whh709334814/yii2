<?php

namespace backstage\controllers;

use Yii;
use backstage\components\BaseController;
class OrganController extends BaseController
{


    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

}
