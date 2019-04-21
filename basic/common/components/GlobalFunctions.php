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
function menudata(){
    $menuFilePath = Yii::getAlias('@app/config/menu.php');
    return require $menuFilePath;
}
function topMenu(){
    $menus = menudata();
    foreach ($menus as $key=>$v){
        unset($menus[$key]['items']);
    }
    return $menus;
}

function leftMenu($where){
    $menus = menudata();
    $flag = 0;
    foreach ($menus as $k=>$v){
        if (in_array($where,$v['url'])==true){
           return $v['items'];
        }else{
            $flag =1;
        }
    }
    if ($flag == 1){
        foreach ($menus as $k=>$v){
            foreach ($v['items'] as $kk=>$vv){
                foreach ($vv['items'] as $kkk=>$vvv){
                    if (in_array($where,$vvv['url'])==true){
                        return $v['items'];
                    }
                }
            }
        }
    }
}
