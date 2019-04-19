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
            [['level_id', 'user_id', 'province_id', 'city_id', 'district', 'organ_state', 'organ_sort', 'organ_time', 'organ_end_time', 'is_recommend', 'is_home_recommend', 'organ_credit', 'organ_collect', 'is_own_shop', 'ensure', 'deposit_icon', 'is_delete', 'goods_examine', 'domain_enable', 'createtime', 'click'], 'integer'],
            [['organ_zy', 'organ_presales', 'intro'], 'string'],
            [['organ_servicecredit', 'deposit'], 'number'],
            [['createtime'], 'required'],
            [['organ_name', 'user_name', 'seller_id', 'category_id', 'service_id', 'DL_area', 'DL_nation', 'organ_qq', 'organ_domain', 'organ_theme', 'feedback', 'score'], 'string', 'max' => 50],
            [['organ_adress', 'organ_workingtime'], 'string', 'max' => 100],
            [['organ_zip'], 'string', 'max' => 10],
            [['organ_close_info', 'organ_logo', 'organ_banner', 'seo_keywords', 'seo_description'], 'string', 'max' => 255],
            [['organ_avatar'], 'string', 'max' => 150],
            [['organ_phone'], 'string', 'max' => 20],
        ];
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
            'organ_logo'=> 'LOGO：',
            'intro'=> '公司简介：',
            'category_id'=> '分类：',
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