<?php
use yii\grid\GridView;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
$this->title = '机构添加';
$this->params['breadcrumbs'][] = ['label' => '机构管理', 'url' => ['organ/site']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="callout callout-info">
    Tips:
    <i class="icon-lightbulb pull-left"></i>
    请在左侧填写管理员相关信息，包括管理员账号，电子邮箱，以及密码
</div>
<div class="box box-info">
    <div class="box-header with-border">
    </div>

        <?php
        $form = ActiveForm::begin(['method'=>'post',
            'fieldConfig' => [
                'template' => '{label}<div class="col-sm-6">{input}</div>{error}',
                'labelOptions' =>['class' => 'col-sm-2 control-label'],
//        'inputOptions'=> ['class' => 'col-sm-10']
            ],
            'options' => [
                'class' => 'form-horizontal',
            ],
        ]);
        ?>
    <div class="box-body">
        <?= $form->field($model, 'organ_name')->textInput(); ?>
        <?= $form->field($model, 'seller_account')->textInput(); ?>
        <?= $form->field($model, 'password')->passwordInput(); ?>
    </div>
    <div class="box-footer">
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <?= Html::submitButton('提交', ['class' => 'btn btn-primary']); ?>
                <span>OR</span>
                <?php echo Html::resetButton('取消', ['class' => 'btn btn-primary reset']); ?>
            </div>
        </div>
    </div>
        <?php ActiveForm::end() ?>
</div>
