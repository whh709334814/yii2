<?php

return [
        ['label'=>'系统','url'=>['rbac/roles'], 'items'=>[
            ['label' => '权限管理', 'url' => ['rbac/roles'],
                'items' => [
                    ['label' => '创建角色', 'url' =>['rbac/createrole'] ],
                    ['label' => '角色列表', 'url' =>['rbac/roles']],
                    ['label' => '创建规则', 'url' =>['rbac/createrule']],
                ]
            ],
            ['label'=>'管理员管理', 'url' => ['manage/managers'],
                'items' => [
                    ['label' => '管理员列表', 'url' =>['manage/managers']],
                    ['label' => '添加管理员', 'url' =>['manage/reg']]
                ]
            ],
    //                ['label' => '个人中心', 'url' => ['manage/managers'],
    //                    'items' => [
    //                        ['label' => '修改密码', 'url' => ['/admin/personal/reset-password']],
    //                    ]
    //                ]
        ]],
        ['label'=>'主页','url'=>['site/index'], 'items'=>[
            ['label' => '主页', 'url' => ['site/index'],
                'items' => [
                    ['label' => '主页1', 'url' =>['organ/index'] ],
//                    ['label' => '主页2', 'url' =>['rbac/roles']],
//                    ['label' => '主页3', 'url' =>['rbac/createrule']],
                ]
            ],
            ['label'=>'分类管理', 'url' => ['category/index'],
                'items' => [
                    ['label' => '分类管理', 'url' =>['category/index']]
                ]
            ],
//            ['label'=>'管理员管理', 'url' => ['manage/managers'],
//                'items' => [
//                    ['label' => '管理员列表', 'url' =>['manage/managers']],
//                    ['label' => '添加管理员', 'url' =>['manage/reg']]
//                ]
//            ],
        ]]
    ];
