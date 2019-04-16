<?php
use yii\grid\GridView;
use yii\helpers\Html;
use kartik\form\ActiveForm;
$this->title = '机构管理';
$this->params['breadcrumbs'][] = ['label' => '机构管理', 'url' => ['rbac/roles']];
$this->params['breadcrumbs'][] = $this->title;
?>

<?php
$form = ActiveForm::begin(['method'=>'get',
    'fieldConfig' => [
        'template' => '<div class="span12 field-box">{label}{input}</div>{error}',
    ],
    'options' => [
        'class' => 'new_user_form inline-input',
    ],
]);
?>
    <?= $form->field($model, 'organ_name')->textInput(['maxlength' => 10]); ?>
    <?= $form->field($model, 'organ_id')->textInput(['maxlength' => 10]); ?>

    <?= Html::submitButton('搜索', ['class' => 'btn btn-primary']); ?>

<?php ActiveForm::end(); ?>
<?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            [
                'class' => 'yii\grid\SerialColumn',
            ],
            'level_id:text:名称',
            'organ_name:text:标识',
            'user_name:text:规则名称',
            'organ_time:datetime:创建时间',
            'organ_end_time:datetime:更新时间',
            [
                'class' => 'yii\grid\ActionColumn',
                'header' => '操作',
                'template' => '{assign} {update} {delete}',
                'buttons' => [
                    'assign' => function ($url, $model, $key) {
                        return Html::a('分配权限', ['assignitem', 'organ_id' => $model['organ_id']]);
                    },
                    'update' => function ($url, $model, $key) {
                        return Html::a('更新', ['updateitem', 'organ_id' => $model['organ_id']]);
                    },
                    'delete' => function ($url, $model, $key) {
                        return Html::a('删除', ['deleteitem', 'organ_id' => $model['organ_id']]);
                    }
                ],
            ],
        ],
        'layout' => "\n{items}\n{summary}<div class='pagination pull-right'>{pager}</div>",
    ]);
?>
