<?php
    use yii\bootstrap\ActiveForm;
    use yii\helpers\Html;
    $this->title = '授权';
    $this->params['breadcrumbs'][] = ['label' => '管理员管理', 'url' => ['manage/managers']];
    $this->params['breadcrumbs'][] = $this->title;
?>
<div class="callout callout-info">
    Tips:
    <i class="icon-lightbulb pull-left"></i>
    请在左侧填写管理员相关信息，包括管理员账号，电子邮箱，以及密码
</div>
    <!-- main container -->
        <div class="box box-info">
            <?php
            if (Yii::$app->session->hasFlash('info')) {
                echo Yii::$app->session->getFlash('info');
            }
            $form = ActiveForm::begin([
//                        'fieldConfig' => [
//                            'template' => '{label}<div class="span12 field-box">{input}</div>{error}',
//                        ],
                'options' => [
                    'class' => 'form-horizontal',
                ],
            ]);
            ?>
        <div class="box-body">
            <div class="form-group">
                <?php echo Html::label('管理员：', null,['class'=>'col-sm-2 control-label']).'<div class="col-sm-10">'. Html::encode($admin); ?></div>
            </div>
            <div class="form-group">
                <?php echo Html::label('角色：', null,['class'=>'col-sm-2 control-label']).'<div class="col-sm-10">'. Html::checkboxList('children', $children['roles'], $roles); ?></div>
            </div>
            <div class="form-group">
                <?php echo Html::label('权限：', null,['class'=>'col-sm-2 control-label']). Html::checkboxList('children', $children['permissions'], $permissions,['class'=>'col-sm-10']); ?>
            </div>
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
        <?php ActiveForm::end(); ?>
    </div>
    <!-- end main container -->
