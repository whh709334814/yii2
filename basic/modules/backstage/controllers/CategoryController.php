<?php

namespace backstage\controllers;
use backstage\models\Category;
use Yii;
use backstage\components\BaseController;

class CategoryController extends BaseController
{ 
    protected $mustlogin = ['index'];

    public function actionIndex()
    {
        return $this->render("cates");
    }
}
