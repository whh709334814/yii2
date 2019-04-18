<?php
/**
 * Created by PhpStorm.
 * User: xuguoliang
 * Date: 2015/8/2
 * Time: 12:48
 */
namespace backstage\models;
use yii\db\ActiveRecord;
use Yii;
/**
 * Class OrganSearch
 * @package backstage\models\permission\search
 */
class Organ extends ActiveRecord
{
    public $seller_account;
    public $password;
    public static function tableName()
    {
        return '{{%organ}}';
    }

    public function rules()
    {
        return [
            [['organ_name'],'required'],
            [['user_name'],'safe'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'organ_name'=> '机构名称：',
            'user_name'=> '使用：',
            'seller_account'=> '机构账号：',
            'password'=> '密码：',
        ];
    }
    //注册机构账号
    public function add($data){
        $trans = Yii::$app->db->beginTransaction();
        try {
            //添加到用户表
            $o = $data['Organ'];
            $users = new User();
            $users->username =$o['seller_account'];
            $users->userpass = md5($o['password']);
            $users->createtime = time();
            $users->save();
            //添加到机构表
            $organ = new Organ();
            $organ->adminid = Yii::$app->admin->identity->adminid;
            $organ->organ_name = $o['organ_name'];
            $organ->user_name = $o['organ_name'];
            $organ->user_id = $users->attributes['userid'];
            $organ->createtime = time();
            $organ->organ_time = time();
            $organ->save();
            $trans->commit();
        } catch (\Exception $e) {
            $trans->rollback();
            return false;
        }
        return true;
    }
}