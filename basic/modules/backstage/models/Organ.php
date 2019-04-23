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

//    public function rules()
//    {
//        return [
//            [[ 'user_id', 'organ_state', 'organ_sort',  'organ_end_time', 'is_recommend', 'organ_credit', 'organ_collect', 'is_own_shop', 'deposit_icon',  'createtime', 'click'], 'integer'],
//            [['organ_presales', 'intro'], 'string'],
//            [['organ_servicecredit'], 'number'],
//            [['createtime'], 'required'],
//            [['seller_account','organ_name','password'], 'required', 'on' => 'add'],
//            ['organ_time' ,  'filter', 'filter' => function(){
//                return strtotime($this->organ_time);
//            }],
//            [['organ_time','createtime'], function($attr, $params) {
//                if ($this->hasErrors()) return false;
//                $datetime = $this->{$attr};
//                $time = strtotime($datetime);
//                // 验证时间格式是否正确
//                if ($time === false) {
//                    $this->addError($attr, '时间格式错误.');
//                    return false;
//                }
//                // 将转换为时间戳后的时间赋值给time属性
//                $this->{$attr} = $time;
//                return true;
//            }],
//            [['user_name', 'category_id','organ_qq', 'organ_domain', 'feedback', 'score'], 'string', 'max' => 50],
//            [['organ_adress', 'organ_workingtime'], 'string', 'max' => 100],
//            [['organ_zip'], 'string', 'max' => 10],
//            [['organ_close_info', 'organ_logo', 'organ_banner', 'seo_keywords', 'seo_description'], 'string', 'max' => 255],
//            [['organ_avatar'], 'string', 'max' => 150],
//            [['organ_phone'], 'string', 'max' => 20],
//        ];
//    }
    public function rules()
    {
        return [
            [[ 'user_id','level_id','is_recommend'], 'integer'],
            [['organ_name', 'user_name','category_id'], 'string', 'max' => 50],
            [['organ_time'], function($attr, $params) {
                if ($this->hasErrors()) return false;
                $datetime = $this->{$attr};
                $time = strtotime($datetime);
                // 验证时间格式是否正确
                if ($time === false) {
                    $this->addError($attr, '时间格式错误.');
                    return false;
                }
                // 将转换为时间戳后的时间赋值给time属性
                $this->{$attr} = $time;
                return true;
            }],
            [['seller_account','organ_name', 'password','createtime'], 'required', 'on' => 'add'],
        ];
    }
    public function afterFind()
    {
        parent::afterFind();
        $this->organ_time = date('Y-m-d', $this->organ_time);
        $this->createtime = date('Y-m-d H:i:s', $this->createtime);
    }
    public function attributeLabels()
    {
        return [
            'organ_name'=> '机构名称：',
            'organ_time'=> '开通时间：',
            'organ_end_time'=> '有效期至：',
            'feedback'=> '好评率：',
            'score'=> '综合得分：',
            'click'=> '访问量：',
            'organ_logo'=> '网站LOGO：',
            'intro'=> '公司简介：',
            'category_id'=> '分类：',
        ];
    }
    //注册机构账号
    public function add($data){
        $this->scenario = 'add';
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
            $organ->user_name = $o['seller_account'];
            $organ->user_id = $users->attributes['userid'];
            $organ->createtime= time();
            $organ->save();
            $trans->commit();
        } catch (\Exception $e) {
            $trans->rollback();
            return false;
        }
        return true;
    }
}