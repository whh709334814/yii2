<?php
    use yii\bootstrap\ActiveForm;
    use yii\helpers\Html;
    $this->title = '添加角色';
    $this->params['breadcrumbs'][] = ['label' => '角色管理', 'url' => ['/backstage/rbac/roles']];
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
    //        if (Yii::$app->session->hasFlash('info')) {
    //            echo Yii::$app->session->getFlash('info');
    //        }
    $form = ActiveForm::begin([
        'options' => ['class' => 'form-horizontal']
    ]);
    ?>
    <div class="box-body">
        <div class="form-group">
            <?php echo Html::label('名称', null, ['class' => 'col-sm-2 control-label']).'<div class="col-sm-6">'. Html::textInput('description', '', ['class' => 'form-control']); ?></div>
        </div>
        <div class="form-group">
            <?php echo Html::label('标识', null, ['class' => 'col-sm-2 control-label']).'<div class="col-sm-6">'. Html::textInput('name', '', ['class' => 'form-control']); ?></div>
        </div>
        <div class="form-group">
            <?php echo Html::label('规则名称', null, ['class' => 'col-sm-2 control-label']).'<div class="col-sm-6">'. Html::textInput('rule_name', '', ['class' => 'form-control']); ?></div>
        </div>
        <div class="form-group">
            <?php echo Html::label('数据', null, ['class' => 'col-sm-2 control-label']).'<div class="col-sm-6">'. Html::textarea('data', '', ['class' => 'form-control']); ?></div>
        </div>
    </div>
    <div class="box-footer">
        <div class=" form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <?= Html::submitButton('提交', ['class' => 'btn btn-primary']); ?>
                <span>OR</span>
                <?php echo Html::resetButton('取消', ['class' => 'btn btn-primary reset']); ?>
            </div>
        </div>
    </div>
    <?php ActiveForm::end(); ?>
</div>
    <!-- end main container -->
