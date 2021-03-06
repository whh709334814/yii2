<?php

use yii\grid\GridView;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
$this->title = '机构更新';
$this->params['breadcrumbs'][] = ['label' => '机构列表', 'url' => ['organ/site']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="callout callout-info">
    Tips:
    <i class="icon-lightbulb pull-left"></i>
    请在左侧填写管理员相关信息，包括管理员账号，电子邮箱，以及密码
</div>
<div class="box box-solid">
    <div class="nav-tabs-custom">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#organ" data-toggle="tab">机构信息</a></li>
            <li><a href="#reg" data-toggle="tab">注册信息</a></li>
        </ul>
        <div class="tab-content">
            <div class="active tab-pane" id="organ">
                <?php

                // widget with default options
              //  echo Dialog::widget();
                // buttons for testing the krajee dialog boxes
                $btns = <<< HTML
<button type="button" id="btn-alert" class="btn btn-info">Alert</button>
<button type="button" id="btn-confirm" class="btn btn-warning">Confirm</button>
<button type="button" id="btn-prompt" class="btn btn-primary">Prompt</button>
<button type="button" id="btn-dialog" class="btn btn-default">Dialog</button>
HTML;
                echo $btns;

                // javascript for triggering the dialogs

                $form = ActiveForm::begin(['method'=>'post',
                    'fieldConfig' => [
                        'template' => '{label}<div class="col-sm-6">{input}</div>{error}',
                        'labelOptions' =>['class' => 'col-sm-2 control-label']
                    ],
                    'options' => [
                        'class' => 'form-horizontal',
                    ],
                ]);
                ?>
                <?= $form->field($model, 'category_id')->widget(\kartik\tree\TreeViewInput::className(),[
                    'name' => 'kvTreeInput',
                    'value' => 'false', // preselected values
                    'query' => backstage\models\Category::find()->addOrderBy('root, lft'),
                    'headingOptions' => ['label' => 'تگ'],
                    'rootOptions' => ['label'=>'<i class="fa fa-building"></i>'],
                    'fontAwesome' => true,
                    'asDropdown' => true,
                    'multiple' => true,
                    'options' => ['disabled' => false]
                ]); ?>

                <?= $form->field($model, 'organ_name')->textInput(); ?>

                <?= $form->field($model, 'organ_end_time')->textInput(); ?>
                <?= $form->field($model, 'feedback')->textInput(); ?>
                <?= $form->field($model, 'score')->textInput(); ?>
                <?= $form->field($model, 'click')->textInput(); ?>
                <?= $form->field($model, 'intro')->textInput(); ?>
                <?= $form->field($model, 'organ_logo')->textInput(); ?>
                <?=
                $form->field($model, 'organ_time')->widget(\kartik\date\DatePicker::className(),[
                    'type' => \kartik\date\DatePicker::TYPE_COMPONENT_APPEND,
                    'options' => ['placeholder' => '请选择...'],
                    'pluginOptions' => [
                        'format' => 'yyyy-mm-dd',
                        'todayHighlight' => true
                    ]
                ]);
                ?>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <?= Html::submitButton('提交', ['class' => 'btn btn-primary']); ?>
                        <span>OR</span>
                        <?php echo Html::resetButton('取消', ['class' => 'btn btn-primary reset']); ?>
                    </div>
                </div>
                <?php ActiveForm::end() ?>
            </div>
            <div class="tab-pane" id="reg">

            </div>
        </div>
    </div>
</div>
<?php

$js = <<< JS
$("#btn-alert").on("click", function() {
     // krajeeDialog.alert("This is a Krajee Dialog Alert!")
    
    krajeeDialog.prompt({label:'Provide reason', placeholder:'Upto 30 characters...'}, function(out){
        if (out) {
            alert('Yes'); // or do something based on the value of out
        }
    });
});
JS;

// register your javascript
$this->registerJs($js);
