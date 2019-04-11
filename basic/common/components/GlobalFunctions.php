<?php
    function yiiCache($config_key='', $data = array()){
        $param = explode('.', $config_key);
        $newArr = [];
        $newData =[];
        $_db = new \yii\db\Query();
        if (empty($data)) {
////            $cache->set('test', '');
//            //如$config_key=shop_info则获取网站信息数组
//            //如$config_key=shop_info.logo则获取网站logo字符串
            //直接获取缓存文件Yii::$app->cache->get($param[0])
            $config = Yii::$app->cache->get($param[0]);
            if (empty($config)) {
                //缓存文件不存在就读取数据库
                $res = $_db->select(['name','value', 'inc_type'])
                    ->where(['inc_type' =>$param[0] ])
                        ->from('{{%config}}')->all();
                if ($res) {
                    foreach ($res as $k => $val) {
                        $config[$val['name']] = $val['value'];
                    }
                    Yii::$app->cache->set($param[0],$config);
                }
            }
            if (count($param) > 1) {
                return $config[$param[1]];
            } else {
                return $config;
            }
        } else {
            //更新缓存
            $result =$_db->select(['name','value', 'inc_type'])
                        ->where(['inc_type' =>$param[0] ])
                        ->from('{{%config}}')->all();
            if ($result) {
                foreach ($result as $val) {
                    $temp[$val['name']] = $val['value'];
                }
                foreach ($data as $k => $v) {
                    if (!isset($temp[$k])) {
                        $newArr = array('name' => $k,'value'=>trim($v), 'inc_type' => $param[0]);
                        Yii::$app->db->createCommand()->insert('{{%config}}', $newArr)->execute();
                    } else {
                        $newArr = array('name' => $k, 'inc_type' => $param[0]);
                        if ($v != $temp[$k])
                        Yii::$app->db->createCommand()->update('{{%config}}', ['value'=>trim($v)], $newArr)->execute(); //缓存key存在且值有变更新此项
                    }
                }
                //更新后的数据库记录
                $newRes = $_db->select(['name','value', 'inc_type'])->where("inc_type", $param[0])->from('{{%config}}')->all();
                foreach ($newRes as $rs) {
                    $newData[$rs['name']] = $rs['value'];
                }
            } else {
                foreach ($data as $k => $v) {
                    $newArr = ['name' => $k, 'value' => trim($v), 'inc_type' => $param[0]];
                }
                Yii::$app->db->createCommand()->insert('{{%config}}', $newArr)->execute();
            }
            return Yii::$app->cache->set($param[0],$newData);
        }
    }

/**
 * 字符截取 支持UTF8/GBK
 * @param $string
 * @param $length
 * @param $dot
 */
function sub_str($str,$len){
    $lens=mb_strlen($str,'utf-8');  //计算出字符串的长度
    if($lens>$len){
        $dot = '...';
    }else{
        $dot = '';
    }
    return mb_substr($str,0,$len,'utf-8').$dot;//正常输出
}
/**
 * 字符截取 支持UTF8/GBK
 * @param $array
 * @param $string
 * return 数组中下标相似的字符串
 */
function cut_same_str($arr,$str){
    foreach ($arr as $k=>$v){
        if (strstr($str,$k)){
            $s = $k;
        }
    }
    return $s;
}

//menu
function topMenu($route){
    $menus = mdm\admin\components\MenuHelper::getAssignedMenu(Yii::$app->user->id);
    $activeTag='';
    $menus = normalizeMenu($menus,$activeTag,$route);
    if (isset($menus[$activeTag]['items'])) {
        $d['left'] = $menus[$activeTag]['items'];
    } else {
        $d['left'] = [];
    }
    foreach ($menus as $key => $items) {
        unset($menus[$key]['items']);
    }
    $d['top'] = $menus;
    return $d;
}

function normalizeMenu(&$assigned, &$menus, $callback, $parent = null)
{
    $result = [];
    $order = [];
    foreach ($assigned as $id) {
        $menu = $menus[$id];
        if ($menu['parent'] == $parent) {
            $menu['children'] = normalizeMenu($assigned, $menus, $callback, $id);
            if ($callback !== null) {
                $item = call_user_func($callback, $menu);
            } else {
                $item = [
                    'label' => $menu['name'],
                    'url' => parseRoute($menu['route']),
                ];
                if ($menu['children'] != []) {
                    $item['items'] = $menu['children'];
                }
            }
            $result[] = $item;
            $order[] = $menu['order'];
        }
    }
    if ($result != []) {
        array_multisort($order, $result);
    }
    return $result;
}

function parseRoute($route)
{
    if (!empty($route)) {
        $url = [];
        $r = explode('&', $route);
        $url[0] = $r[0];
        unset($r[0]);
        foreach ($r as $part) {
            $part = explode('=', $part);
            $url[$part[0]] = isset($part[1]) ? $part[1] : '';
        }

        return $url;
    }

    return '#';
}
//function normalizeMenu($menus,&$activeTag,$route)
//{
//    foreach($menus as $i => $items) {
//        $firstUrl = '';
//        foreach($items['items'] as $k => $item) {
//            if(!empty($item['items'])) {
//                foreach ($item['items'] as $l => $menu) {
//
////                    var_dump($menu['url'][0]);
//
//                    if (stripos($route,trim($menu['url'][0],'/')) === 0) {   //找出当前路由在哪个菜单下
//
//                        $activeTag = $i;
//                        $menus[$i]['active']=true;
//                    }else{
//                        $menus[$i]['active']=false;
//                    }
//
//                    if($firstUrl == '') {
//                        $firstUrl = $menu['url'][0];                      //获取第一个url
//                    }
//                }
//                if(empty($menus[$i]['items'][$k]['items'])){
//                    unset($menus[$i]['items'][$k]);
//                }else{
//                    $menus[$i]['items'][$k]['url'] = ['#'];
////                    $iconClass = isset($item['icon']) ? $item['icon'] : $this->defaultIcon;
//                    $menus[$i]['items'][$k]['label'] = $item['label'];
////                    unset($menus[$i]['items'][$k]['icon']);
//                }
//            }else{
//                unset($menus[$i]['items'][$k]);  //删除没有子菜单的菜单
//                continue;
//            }
//        }
//        if(empty($menus[$i]['items'])){
//            unset($menus[$i]);
//        }else {
//            $menus[$i]['url'] = [$firstUrl];
//        }
//    }
//    return $menus;
//}