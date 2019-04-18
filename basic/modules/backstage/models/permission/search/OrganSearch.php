<?php
/**
 * Created by PhpStorm.
 * User: xuguoliang
 * Date: 2015/8/2
 * Time: 12:48
 */
namespace backstage\models\permission\search;
use backstage\models\Admin;
use yii\data\ActiveDataProvider;

/**
 * Class OrganSearch
 * @package backstage\models\permission\search
 */
class OrganSearch extends Admin
{

    public static function tableName()
    {
        return '{{%organ}}';
    }

    public function rules()
    {
        return [
            [['organ_name','organ_id'],'safe'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'organ_name' => '机构名称：',
            'organ_id' => '机构：'
        ];
    }

    public function search($params)
    {

        $query = OrganSearch::find();
        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination'=>[
                'pageSize'=>10
            ]
        ]);
        if (!$this->load($params)) {
            return $dataProvider;
        }
        $query->andFilterWhere(['like', 'organ_name', $this->organ_name]);
        $query->andFilterWhere(['like', 'organ_id', $this->organ_id]);
        return $dataProvider;
    }
}