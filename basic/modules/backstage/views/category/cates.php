<?php
$this->title = '分类列表';
$this->params['breadcrumbs'][] = ['label' => '分类管理', 'url' => ['/backstage/category/list']];
$this->params['breadcrumbs'][] = $this->title;
use kartik\tree\TreeView;

?>
<div class="box box-solid">
    <?php
    echo TreeView::widget([
        // single query fetch to render the tree
        'query'             => backstage\models\Category::find()->addOrderBy('root, lft'),
        'headingOptions'    => ['label' => '网站分类'],
        'isAdmin'           => true,                       // optional (toggle to enable admin mode)
        'displayValue'      => 1,                           // initial display value
        'iconEditSettings' => [
            'show' => 'list',
            'listData' => [
                'folder' => '文件夹',
                'file' => '文件',
                'mobile' => '手机',
                'bell' => '贝尔',
            ]
        ],
        'rootOptions' => [ 'label' => '<span class =“text-primary”>网站分类</span>' ],
        //'softDelete'      => true,                        // normally not needed to change
        //'cacheSettings'   => ['enableCache' => true]      // normally not needed to change
    ]);
    ?>
</div>
