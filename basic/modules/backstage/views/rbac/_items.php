<?php
    use yii\grid\GridView;
    use yii\helpers\Html;
    $this->title = '角色列表';
    $this->params['breadcrumbs'][] = ['label' => '角色管理', 'url' => ['rbac/roles']];
    $this->params['breadcrumbs'][] = $this->title;
?>
<div class="callout callout-info">
    Tips:
    <i class="icon-lightbulb pull-left"></i>
    请在左侧填写管理员相关信息，包括管理员账号，电子邮箱，以及密码
</div>
    <!-- main container -->
<div class="box box-info">
    <div class="box-header with-border">
        <div class="box-header with-border">
            <a href="<?php echo yii\helpers\Url::to(['rbac/createrole']); ?>" class="btn btn-primary pull-right">
                <i>&#43;</i>
                添加角色
            </a>
        </div>
    </div>
    <div class="box-body">
        <?php
            echo GridView::widget([
                'dataProvider' => $dataProvider,
                'columns' => [
                    [
                        'class' => 'yii\grid\SerialColumn',
                    ],
                    'description:text:名称',
                    'name:text:标识',
                    'rule_name:text:规则名称',
                    'created_at:datetime:创建时间',
                    'updated_at:datetime:更新时间',
                    [
                        'class' => 'yii\grid\ActionColumn',
                        'header' => '操作',
                        'template' => '{assign} {update} {delete}',
                        'buttons' => [
                            'assign' => function ($url, $model, $key) {
                                return Html::a('分配权限', ['assignitem', 'name' => $model['name']]);
                            },
                            'update' => function ($url, $model, $key) {
                                return Html::a('更新', ['updateitem', 'name' => $model['name']]);
                            },
                            'delete' => function ($url, $model, $key) {
                                return Html::a('删除', ['deleteitem', 'name' => $model['name']]);
                            }
                        ],
                    ],
                ],
                'layout' => "\n{items}\n{summary}<div class='pagination pull-right'>{pager}</div>",
            ]);

        ?>
    </div>
</div>
<!-- end main container -->
