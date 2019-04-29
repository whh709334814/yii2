<?php

$params = require __DIR__ . '/params.php';
$db = require __DIR__ . '/db.php';

$config = [
    'id' => 'basic',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'aliases' => [
        '@bower' => '@vendor/bower-asset',
        '@npm'   => '@vendor/npm-asset',
        '@backstage' => '@app/modules/backstage',
        '@front' => '@app/modules/front',
    ],
    'modules' => [
        'backstage' => [
            'class' => 'app\modules\backstage\Module',
        ],
        'front' => [
            'class' => 'app\modules\front\Module',
        ],
        'treemanager' =>  [
            'class' => '\kartik\tree\Module',
        ]
    ],
    'language' => 'zh-CN',
    'components' => [
        'assetManager' => [
            'bundles' => [
                'dmstr\web\AdminLteAsset' => [
                    'skin' => 'skin-blue',
                ],
            ],
        ],
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => '8o0A1at5Vgpxz8jd0QrujoaegHC2ke5r',
        ],
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'authManager' => [
            'class' => 'yii\rbac\DbManager',
            "defaultRoles" => ["guest"],
        ],
        'user' =>[
            'identityClass' => 'front\models\User',
            'idParam' => '__front',
            'identityCookie' => ['name' => '__front_identity', 'httpOnly' => true],
            'enableAutoLogin' => true,
            'loginUrl' => ['/front/site/login'],
        ],
        'admin' => [
            'class' => 'yii\web\User',
            'identityClass' => 'backstage\models\Admin',
            'idParam' => '__admin',
            'identityCookie' => ['name' => '__admin_identity', 'httpOnly' => true],
            'enableAutoLogin' => true,
            'loginUrl' => ['/backstage/public/login'],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            // send all mails to a file by default. You have to set
            // 'useFileTransport' to false and configure a transport
            // for the mailer to send real emails.
            'useFileTransport' => true,
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],

        'db' => $db,
        /*
        'urlManager' => [
            'enablePrettyUrl' => true,
            'showScriptName' => false,
            'rules' => [
            ],
        ],
        */
    ],
//    'as access' => [
//        'class' => 'mdm\admin\components\AccessControl',
//        'allowActions' => [
//            '*',
//        ]
//    ],
//    'params' => array_merge($params, ['menu' => $menu]),
    'params' => $params,
];

if (YII_ENV_DEV) {
    // configuration adjustments for 'dev' environment
    $config['bootstrap'][] = 'debug';
    $config['modules']['debug'] = [
        'class' => 'yii\debug\Module',
        // uncomment the following to add your IP if you are not connecting from localhost.
        //'allowedIPs' => ['127.0.0.1', '::1'],
    ];
    $config['modules']['gii'] = [
        'class' => 'yii\gii\Module',
        'generators' => [ // HERE
            'crud' => [
                'class' => 'yii\gii\generators\crud\Generator',
                'templates' => [
                    'adminlte' => '@vendor/dmstr/yii2-adminlte-asset/gii/templates/crud/simple',
                ]
            ]
        ],
    ];
}

return $config;
