<?php

namespace backstage\components;

use Yii;
use yii\web\Controller;
use yii\filters\AccessControl;
/**
 * Class BaseController
 * @package backstage\components
 */
class BaseController extends Controller
{
    public $layout='layout1';

    protected $actions = ['*'];
    protected $except = [];
    protected $mustlogin = [];
    public function init()
    {
        parent::init();
        $this->getView()->title = Yii::$app->id;
    }

    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'user' => 'admin',
                'only' => $this->actions,
                'except' => $this->except,
                'rules' => [
                    [
                        'allow' => false,
                        'actions' => empty($this->mustlogin) ? [] : $this->mustlogin,
                        'roles' => ['?'],
                    ],
                    [
                        'allow' => true,
                        'actions' => empty($this->mustlogin) ? [] : $this->mustlogin,
                        'roles' => ['@'],
                    ],
                ],
            ],
        ];
    }
    /**
     * flash message
     */
//    private function flash()
//    {
//        if($this->route == '/admin/site/close-win') {
//            return;
//        }
//        $levels = [0=>'warning',1=>'success',2=>'fail',6=>'info'];
//        foreach ($levels as $icon => $level) {
//            if(Yii::$app->session->hasFlash($level))
//            {
//                $msg = Yii::$app->session->getFlash($level);
//                $this->getView()->registerJs("
//                    layer.msg(\"$msg\", {icon: $icon});
//                ");
//            }
//        }
//    }
//    public function beforeAction($action)
//    {
//        if (!parent::beforeAction($action)) {
//            return false;
//        }
//        $controller = $action->controller->id;
//        $actionName = $action->id;
//        if (Yii::$app->admin->can($controller. '/*')) {
//            return true;
//        }
//        if (Yii::$app->admin->can($controller. '/'. $actionName)) {
//            return true;
//        }
//        throw new \yii\web\UnauthorizedHttpException('对不起，您没有访问'. $controller. '/'. $actionName. '的权限');
//    }

}