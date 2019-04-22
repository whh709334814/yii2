<?php
$this->title = '管理员列表';
$this->params['breadcrumbs'][] = ['label' => '管理员管理', 'url' => ['/backstage/manage/managers']];
$this->params['breadcrumbs'][] = $this->title;

?>
<div class="callout callout-info">
    Tips:
    <i class="icon-lightbulb pull-left"></i>
    请在左侧填写管理员相关信息，包括管理员账号，电子邮箱，以及密码
</div>
<div class="box box-solid">
    <div class="box-header with-border">
        <a href="<?php echo yii\helpers\Url::to(['manage/reg']); ?>" class="btn btn-primary pull-right">
            <i>&#43;</i>
            添加新管理员
        </a>
    </div>
    <!-- main container -->
    <div class="box-body">
        <!-- Users table -->
        <table class="table table-striped table-bordered">
            <thead>
            <tr>
                <th>
                    管理员ID
                </th>
                <th>
                    <span class="line"></span>管理员账号
                </th>
                <th>
                    <span class="line"></span>管理员邮箱
                </th>
                <th>
                    <span class="line"></span>最后登录时间
                </th>
                <th>
                    <span class="line"></span>最后登录IP
                </th>
                <th>
                    <span class="line"></span>添加时间
                </th>
                <th>
                    <span class="line"></span>操作
                </th>
            </tr>
            </thead>
            <tbody>
            <?php foreach($managers as $manager): ?>
                <!-- row -->
                <tr>
                    <td>
                        <?php echo $manager->adminid; ?>
                    </td>
                    <td>
                        <?php echo $manager->adminuser; ?>
                    </td>
                    <td>
                        <?php echo $manager->adminemail; ?>
                    </td>
                    <td>
                        <?php echo date('Y-m-d H:i:s', $manager->logintime); ?>
                    </td>
                    <td>
                        <?php echo long2ip($manager->loginip); ?>
                    </td>
                    <td>
                        <?php echo date("Y-m-d H:i:s", $manager->createtime); ?>
                    </td>
                    <td class="align-right">
                        <?php if ($manager->adminid != 1): ?>
                            <a href="<?php echo yii\helpers\Url::to(['manage/del', 'adminid' => $manager->adminid]) ?>">删除</a>
                            <a href="<?php echo yii\helpers\Url::to(['manage/assign', 'adminid' => $manager->adminid]) ?>">授权</a>
                        <?php endif; ?>
                    </td>
                </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
        <?php
//        if (Yii::$app->session->hasFlash('info')) {
//            echo Yii::$app->session->getFlash('info');
//        }
        ?>
        <div class="pagination pull-right">
            <?php echo yii\widgets\LinkPager::widget(['pagination' => $pager, 'prevPageLabel' => '&#8249;', 'nextPageLabel' => '&#8250;']); ?>
        </div>
        <!-- end users table -->
    </div>
    <!-- end main container -->
</div>