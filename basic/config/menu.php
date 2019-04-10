<?php

return [
    'menu'=>[
        'data'=> ['label'=>'主页','items'=>[
                ['label' => '主页1',
                    'items' => [
                        ['label' => '主页概览', 'url' => ['/backstage/site']],
                        ['label' => '分类管理', 'url' => ['/backstage/category']],
                        ['label' => '主页2', 'url' => ['/backstage/site']]
                    ]
                ],
                ['label' => '机构列表',
                    'items' => [
                        ['label' => '机构列表', 'url' => ['/admin/organ']],
                        ['label' => '等级列表', 'url' => ['/admin/level']],
                        ['label' => '机构列表2', 'url' => ['/site3']]
                    ]
                ],
            ]
        ],
        'setting'=> ['label'=>'系统设置', 'items'=>[
                ['label' => '权限管理',
                    'items' => [
                        ['label' => '管理员管理','url' => ['/admin/user']],
                        ['label' => '角色管理', 'url' => ['/admin/roles']],
                        ['label' => '权限列表', 'url' => ['/admin/permission']],
                        ['label' => '路由列表', 'url' => ['/admin/route']],
                        ['label' => '规则列表', 'url' => ['/admin/rule']]
                    ]
                ],
                ['label' => '个人中心',
                    'items' => [
                        ['label' => '修改密码', 'url' => ['/admin/personal/reset-password']],
                    ]
                ]
            ]
        ]
    ]
];
