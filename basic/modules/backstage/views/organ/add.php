<?php
use yii\grid\GridView;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
$this->title = '机构添加';
$this->params['breadcrumbs'][] = ['label' => '机构添加', 'url' => ['organ/index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<?php
$form = ActiveForm::begin(['method'=>'post',
    'fieldConfig' => [
        'template' => '{label}{input}{error}',
    ],
    'options' => [
        'class' => 'inline-input',
    ],
//    'validationUrl' => 'validate-view'
]);
?>
<?= $form->field($model, 'organ_name')->textInput(); ?>
<?= $form->field($model, 'seller_account')->textInput(); ?>
<?= $form->field($model, 'password')->passwordInput(); ?>
<?= Html::submitButton('提交', ['class' => 'btn btn-primary']); ?>
<span>OR</span>
<?php echo Html::resetButton('取消', ['class' => 'btn btn-primary reset']); ?>
<?php ActiveForm::end() ?>
