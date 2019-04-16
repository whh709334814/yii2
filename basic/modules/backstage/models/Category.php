<?php

namespace backstage\models;

use Yii;

class Category extends \kartik\tree\models\Tree
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%category}}';
    }
}