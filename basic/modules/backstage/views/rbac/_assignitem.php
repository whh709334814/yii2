<?php
use yii\bootstrap\ActiveForm;
use yii\helpers\Html;
$this->title = '分配权限';
$this->params['breadcrumbs'][] = ['label' => '角色管理', 'url' => ['/admin/rbac/roles']];
$this->params['breadcrumbs'][] = $this->title;
$this->registerCssFile('admin/css/compiled/new-user.css');
?>
<div class="callout callout-info">
    Tips:
    <i class="icon-lightbulb pull-left"></i>
    请在左侧填写管理员相关信息，包括管理员账号，电子邮箱，以及密码
</div>
<!-- main container -->
<div class="box box-info">
            <!-- left column -->
    <div class="container">
        <?php
        if (Yii::$app->session->hasFlash('info')) {
            echo Yii::$app->session->getFlash('info');
        }
        $form = ActiveForm::begin([
            'options' => [
                'class' => 'form-horizontal',
            ],
        ]);

        ?>
        <div class="box-body">
            <div class="form-group">
                <?php echo Html::label('角色名称', null,['class'=>'col-sm-2 control-label']).'<div class="col-sm-10">'. Html::encode($parent); ?></div>
            </div>
            <div class="form-group">
                <?php echo Html::label('角色子节点', null,['class'=>'col-sm-2 control-label']).'<div class="col-sm-10">'. Html::checkboxList('children',$children? $children['roles']:'', $roles); ?></div>
            </div>
            <div class="form-group">
                <?php echo Html::label('权限子节点', null,['class'=>'col-sm-2 control-label']).'<div class="col-sm-10">'. Html::checkboxList('children', $children?$children['permissions']:'', $permissions,['class'=>'col-sm-10']); ?></div>
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


</div>
<!-- end main container -->
