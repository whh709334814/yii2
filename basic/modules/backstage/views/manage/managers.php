<?php
$this->title = '管理员列表';
$this->params['breadcrumbs'][] = ['label' => '管理员管理', 'url' => ['/backstage/manage/managers']];
$this->params['breadcrumbs'][] = $this->title;

?>
<!-- main container -->
<div class="container-fluid">
    <div id="pad-wrapper" class="users-list">

        <a href="<?php echo yii\helpers\Url::to(['manage/reg']); ?>" class="btn btn-primary pull-right">
            <i>&#43;</i>
            添加新管理员
        </a>

        <!-- Users table -->
        <div class="row-fluid table">
            <table class="table table-striped table-bordered table-hover">
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
                if (Yii::$app->session->hasFlash('info')) {
                    echo Yii::$app->session->getFlash('info');
                }
            ?>
        </div>
        <div class="pagination pull-right">
            <?php echo yii\widgets\LinkPager::widget(['pagination' => $pager, 'prevPageLabel' => '&#8249;', 'nextPageLabel' => '&#8250;']); ?>
        </div>
        <!-- end users table -->
    </div>
</div>
<!-- end main container -->

