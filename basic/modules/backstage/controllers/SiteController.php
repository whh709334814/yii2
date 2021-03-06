<?php

namespace backstage\controllers;

use Yii;
use backstage\components\BaseController;

class SiteController extends BaseController
{

    /**
     * Displays homepage.
     *
     * @return string
     */
    protected $mustlogin = ['index'];
    public function actionIndex()
    {
        return $this->render('index');
    }

}
