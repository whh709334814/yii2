<?php

use kartik\file\FileInput;
use yii\grid\GridView;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
$this->title = '机构更新';
$this->params['breadcrumbs'][] = ['label' => '机构更新', 'url' => ['organ/site']];
$this->params['breadcrumbs'][] = $this->title;
use kartik\date\DatePicker;
?>
<div class="box-header with-border">
    Tips:
</div>

<div class="nav-tabs-custom">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#organ" data-toggle="tab">机构信息</a></li>
        <li><a href="#reg" data-toggle="tab">注册信息</a></li>
    </ul>
    <div class="tab-content">
        <div class="active tab-pane" id="organ">
            <?php
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
            <?= $form->field($model, 'createtime')->textInput(); ?>
            <?= $form->field($model, 'organ_logo')->widget(kartik\file\FileInput::classname(), [
//                'options' => ['multiple' => true],
                'pluginOptions' => [
                    // 需要预览的文件格式
                    'previewFileType' => 'image',
                    // 预览的文件
                    'initialPreview' => '/'.$model->organ_logo,
                    // 是否展示预览图
                    'initialPreviewAsData' => false,
// 需要展示的图片设置，比如图片的宽度等
                    'initialPreviewConfig' => ['width' => '120px'],
                    // 是否展示预览图
                    'uploadAsync' => true,
                    // 最少上传的文件个数限制
                    'minFileCount' => 1,
                    // 最多上传的文件个数限制
                    'maxFileCount' => 10,
                    // 是否显示移除按钮，指input上面的移除按钮，非具体图片上的移除按钮
                    'showRemove' => true,
                    // 是否显示上传按钮，指input上面的上传按钮，非具体图片上的上传按钮
                    'showUpload' => true,
                    //是否显示[选择]按钮,指input上面的[选择]按钮,非具体图片上的上传按钮
                    'showBrowse' => true,
                    // 展示图片区域是否可点击选择多文件
                    'browseOnZoneClick' => true,
// 如果要设置具体图片上的移除、上传和展示按钮，需要设置该选项
                    'fileActionSettings' => [
                        // 设置具体图片的查看属性为false,默认为true
                        'showZoom' => false,
                        // 设置具体图片的上传属性为true,默认为true
                        'showUpload' => true,

                    ],
                ],
            ]);?>
            <?=
            $form->field($model, 'organ_time')->widget(\kartik\date\DatePicker::className(),[
                'type' => \kartik\date\DatePicker::TYPE_COMPONENT_APPEND,
                'options' => ['placeholder' => '请选择...'],
                'pluginOptions' => [
                    'format' => 'yyyy-mm-dd h:i:s',
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
