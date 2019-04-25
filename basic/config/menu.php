<?php

return [
        ['label'=>'系统','url'=>['rbac/roles'], 'items'=>[
            ['label' => '权限管理', 'url' => ['rbac/roles'],
                'items' => [
                    ['label' => '创建角色', 'url' =>['rbac/createrole'], 'options' =>['class' => 'hide']],
                    ['label' => '角色列表', 'url' =>['rbac/roles']],
                    ['label' => '创建规则', 'url' =>['rbac/createrule']],
                    ['label' => '分配权限', 'url' =>['rbac/assignitem'], 'options' => ['class' => 'hide']],
                ]
            ],
            ['label'=>'管理员管理', 'url' => ['manage/managers'],
                'items' => [
                    ['label' => '管理员列表', 'url' =>['manage/managers']],
                    ['label' => '添加管理员', 'url' =>['manage/reg']],
                    ['label' => '授权', 'url' =>['manage/assign'], 'options' => ['class' => 'hide']],
                ]
            ],
            ['label' => '个人中心', 'url' => ['personal/reset-password'],
                'items' => [
                    ['label' => '修改密码', 'url' => ['personal/reset-password']],
                ]
            ]
        ]],
        ['label'=>'主页','url'=>['organ/site'], 'items'=>[
            ['label' => '机构管理', 'url' => ['organ/site'],
                'items' => [
                    ['label' => '机构列表', 'url' =>['organ/site']],
                    ['label' => '添加机构', 'url' =>['organ/add'], 'options' => ['class' => 'hide']],
                    ['label' => '更新机构', 'url' =>['organ/update'], 'options' => ['class' => 'hide']],
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
