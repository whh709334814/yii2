<?php
use yii\helpers\Html;
/* @var $this \yii\web\View */
/* @var $content string */

?>
<header class="main-header">
    <?= Html::a('<span class="logo-mini">APP</span><span class="logo-lg">' . Yii::$app->name . '</span>', Yii::$app->homeUrl, ['class' => 'logo']) ?>

    <nav class="navbar navbar-static-top">
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <div class="container-fluid">
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav">
<!--                    class="active"-->
                    <?php  foreach (topMenu() as $k=>$p_menu): ?>
                        <li><?php  echo  Html::a($p_menu['label'],$p_menu["url"],['data' => [ 'method' => 'post']])?></li>
                    <?php endforeach; ?>
                </ul>
<!--                <form class="navbar-form navbar-left" role="search">-->
<!--                    <div class="form-group">-->
<!--                        <input type="text" class="form-control" id="navbar-search-input" placeholder="Search">-->
<!--                    </div>-->
<!--                </form>-->
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <img src="<?= $directoryAsset ?>/img/user2-160x160.jpg" class="user-image" alt="User Image"/>
                            <span class="hidden-xs"><?= yii::$app->admin->identity->adminuser ?></span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- User image -->
                            <li class="user-header">
                                <img src="<?= $directoryAsset ?>/img/user2-160x160.jpg" class="img-circle"
                                     alt="User Image"/>

                                <p>
                                    <?= yii::$app->admin->identity->adminuser ?> - Web Developer
                                    <small>Member since Nov. 2012</small>
                                </p>
                            </li>
                            <!-- Menu Body -->
                            <li class="user-body">
                                <div class="col-xs-4 text-center">
                                    <a href="#">Followers</a>
                                </div>
                                <div class="col-xs-4 text-center">
                                    <a href="#">Sales</a>
                                </div>
                                <div class="col-xs-4 text-center">
                                    <a href="#">Friends</a>
                                </div>
                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat">Profile</a>
                                </div>
                                <div class="pull-right">
                                    <?= Html::a(
                                        '退出',
                                        ['public/logout'],
                                        ['data-method' => 'post', 'class' => 'btn btn-default btn-flat']
                                    ) ?>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</header>