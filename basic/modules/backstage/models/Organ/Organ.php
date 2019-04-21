<?php

namespace backstage\models\Organ;

use Yii;

/**
 * This is the model class for table "y9_organ".
 *
 * @property int $organ_id 机构索引id
 * @property string $organ_name 机构名称
 * @property int $level_id 机构等级
 * @property int $user_id 会员id
 * @property string $user_name 会员名称
 * @property string $seller_id 机构用户名
 * @property string $category_id 机构类别
 * @property string $service_id 机构服务项目
 * @property string $DL_area 服务地区
 * @property string $DL_nation 办理国家
 * @property string $province_id 机构所在省份ID
 * @property int $city_id 机构所在城市ID
 * @property string $district 机构所在地区ID
 * @property string $organ_adress 详细地区
 * @property string $organ_zip 邮政编码
 * @property int $organ_state 机构状态，0关闭，1开启，2审核中
 * @property string $organ_close_info 机构关闭原因
 * @property int $organ_sort 机构排序
 * @property int $organ_time 机构开通时间
 * @property int $organ_end_time 机构有效截止时间
 * @property string $organ_logo 机构logo
 * @property string $organ_banner 机构横幅
 * @property string $organ_avatar 机构头像
 * @property string $seo_keywords 机构seo关键字
 * @property string $seo_description 机构seo描述
 * @property string $organ_qq QQ
 * @property string $organ_phone 机构电话
 * @property string $organ_zy 机构主要做那一块
 * @property string $organ_domain 机构二级域名
 * @property int $is_recommend 推荐，0为否，1为是，默认为0
 * @property int $is_home_recommend 1:上首页，0：正常
 * @property string $organ_theme 机构当前主题
 * @property int $organ_credit 机构信用
 * @property string $organ_servicecredit 服务态度分数
 * @property string $organ_collect 机构收藏数量
 * @property string $organ_presales 机构咨询客服
 * @property string $organ_workingtime 工作时间
 * @property int $is_own_shop 是否个人 1是 0否
 * @property int $ensure 保证服务开关
 * @property string $deposit 保证金额
 * @property int $deposit_icon 保证金显示开关
 * @property int $is_delete 未删除0，已删除1
 * @property int $goods_examine 机构发布内容是否需要审核1：需要，0：不需要
 * @property int $domain_enable 是否启用二级域名.1:启用;0:关闭
 * @property string $intro 机构简介
 * @property string $feedback 好评率
 * @property string $score 综合得分
 * @property int $createtime 机构添加时间
 * @property int $click 点击
 */
class Organ extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'y9_organ';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['level_id', 'user_id', 'province_id', 'city_id', 'district', 'organ_state', 'organ_sort', 'organ_end_time', 'is_recommend', 'is_home_recommend', 'organ_credit', 'organ_collect', 'is_own_shop', 'ensure', 'deposit_icon', 'is_delete', 'goods_examine', 'domain_enable', 'createtime', 'click'], 'integer'],
            [['organ_zy', 'organ_presales', 'intro'], 'string'],
            [['organ_servicecredit', 'deposit'], 'number'],
            [['createtime'], 'required'],
            ['organ_time', function($attr, $params) {
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
            [['organ_name', 'user_name', 'seller_id', 'category_id', 'service_id', 'DL_area', 'DL_nation', 'organ_qq', 'organ_domain', 'organ_theme', 'feedback', 'score'], 'string', 'max' => 50],
            [['organ_adress', 'organ_workingtime'], 'string', 'max' => 100],
            [['organ_zip'], 'string', 'max' => 10],
            [['organ_close_info', 'organ_logo', 'organ_banner', 'seo_keywords', 'seo_description'], 'string', 'max' => 255],
            [['organ_avatar'], 'string', 'max' => 150],
            [['organ_phone'], 'string', 'max' => 20],
        ];
    }

    public function afterFind()
    {
        parent::afterFind();
        $this->organ_time = date('Y-m-d', $this->organ_time);
    }
    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'organ_id' => 'Organ ID',
            'organ_name' => 'Organ Name',
            'level_id' => 'Level ID',
            'user_id' => 'User ID',
            'user_name' => 'User Name',
            'seller_id' => 'Seller ID',
            'category_id' => 'Category ID',
            'service_id' => 'Service ID',
            'DL_area' => 'Dl Area',
            'DL_nation' => 'Dl Nation',
            'province_id' => 'Province ID',
            'city_id' => 'City ID',
            'district' => 'District',
            'organ_adress' => 'Organ Adress',
            'organ_zip' => 'Organ Zip',
            'organ_state' => 'Organ State',
            'organ_close_info' => 'Organ Close Info',
            'organ_sort' => 'Organ Sort',
            'organ_time' => 'Organ Time',
            'organ_end_time' => 'Organ End Time',
            'organ_logo' => 'Organ Logo',
            'organ_banner' => 'Organ Banner',
            'organ_avatar' => 'Organ Avatar',
            'seo_keywords' => 'Seo Keywords',
            'seo_description' => 'Seo Description',
            'organ_qq' => 'Organ Qq',
            'organ_phone' => 'Organ Phone',
            'organ_zy' => 'Organ Zy',
            'organ_domain' => 'Organ Domain',
            'is_recommend' => 'Is Recommend',
            'is_home_recommend' => 'Is Home Recommend',
            'organ_theme' => 'Organ Theme',
            'organ_credit' => 'Organ Credit',
            'organ_servicecredit' => 'Organ Servicecredit',
            'organ_collect' => 'Organ Collect',
            'organ_presales' => 'Organ Presales',
            'organ_workingtime' => 'Organ Workingtime',
            'is_own_shop' => 'Is Own Shop',
            'ensure' => 'Ensure',
            'deposit' => 'Deposit',
            'deposit_icon' => 'Deposit Icon',
            'is_delete' => 'Is Delete',
            'goods_examine' => 'Goods Examine',
            'domain_enable' => 'Domain Enable',
            'intro' => 'Intro',
            'feedback' => 'Feedback',
            'score' => 'Score',
            'createtime' => 'Createtime',
            'click' => 'Click',
        ];
    }
}
