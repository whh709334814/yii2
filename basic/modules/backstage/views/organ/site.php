<?php
use yii\grid\GridView;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
$this->title = '机构管理';
$this->params['breadcrumbs'][] = ['label' => '机构管理', 'url' => ['organ/site']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row-fluid table">
    <?php
    $form = ActiveForm::begin(['method'=>'get',
        'fieldConfig' => [
            'template' => '{label}{input}',
        ],
        'options' => [
            'class' => 'form-inline inline-input',
        ],
    ]);
    ?>

    <?= $form->field($model, 'organ_name')->textInput(); ?>
    <?= $form->field($model, 'organ_id')->textInput(); ?>
    <?= Html::submitButton('搜索', ['class' => 'btn btn-primary']); ?>
    <?php ActiveForm::end(); ?>
    <a href="<?php echo yii\helpers\Url::to(['organ/add']) ?>" class="btn btn-primary pull-right">
        <span>&#43;</span>
        添加机构
    </a>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            [
                'class' => 'yii\grid\SerialColumn',
            ],
            'organ_name:text:机构名称',
            'user_name:text:会员名称',
            'service_id:text:服务项目',
            'level_id:text:所属等级',
            [
                'header'=>'推荐',
                'attribute' => 'is_recommend',
                'value' => function ($model) {
                    return $model->is_recommend;
                }
            ],
            [
                'header'=>'更新时间',
                'attribute' => 'createtime',
                'value' => function ($model) {
                    return date('Y-m-d H:i:s',$model->createtime);
                }
            ],
            [
                'class' => 'yii\grid\ActionColumn',
                'header' => '操作',
                'template' => '{update} {delete}',
                'buttons' => [
                    'update' => function ($url, $model, $key) {
                        return Html::a('更新', ['update', 'organ_id' => $model['organ_id']]);
                    },
                    'delete' => function ($url, $model, $key) {
                        return Html::a('删除', ['delete', 'organ_id' => $model['organ_id']]);
                    }
                ],
            ],
        ],
        'layout' => "\n{items}\n{summary}<div class='pagination pull-right'>{pager}</div>",
    ]);
    ?>
</div>