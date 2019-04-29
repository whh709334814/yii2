<?php

namespace backstage\models;
use yii\db\ActiveRecord;
use yii\behaviors\TimestampBehavior;
use Yii;

class Admin extends ActiveRecord implements \yii\web\IdentityInterface
{
    public $rememberMe = true;
    public $repass;
    public static function tableName()
    {
        return "{{%admin}}";
    }
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            [
                'class' => TimestampBehavior::className(),
                'attributes' => [
                    ActiveRecord::EVENT_BEFORE_INSERT => ['createtime'],
//                    ActiveRecord::EVENT_BEFORE_UPDATE => ['updated_at'],
                ],
            ],
        ];
    }
    public function attributeLabels()
    {
        return [
            'adminuser' => '管理员账号',
            'adminemail' => '管理员邮箱',
            'adminpass' => '管理员密码',
            'repass' => '确认密码',
            'rememberMe'=> '记住我'
        ];
    }

    public function rules()
    {
        return [
            ['adminuser', 'required', 'message' => '管理员账号不能为空', 'on' => ['login', 'seekpass', 'changepass', 'adminadd', 'changeemail']],
            ['adminpass', 'required', 'message' => '管理员密码不能为空', 'on' => ['login', 'changepass', 'adminadd', 'changeemail']],
            ['rememberMe', 'boolean', 'on' => 'login'],
            ['adminpass', 'validatePass', 'on' => ['login', 'changeemail']],
            ['adminemail', 'required', 'message' => '电子邮箱不能为空', 'on' => ['seekpass', 'adminadd', 'changeemail']],
            ['adminemail', 'email', 'message' => '电子邮箱格式不正确', 'on' => ['seekpass', 'adminadd', 'changeemail']],
            ['adminemail', 'unique', 'message' => '电子邮箱已被注册', 'on' => ['adminadd', 'changeemail']],
            ['adminuser', 'unique', 'message' => '管理员已被注册', 'on' => 'adminadd'],
            ['adminemail', 'validateEmail', 'on' => 'seekpass'],
            ['repass', 'required', 'message' => '确认密码不能为空', 'on' => ['changepass', 'adminadd']],
            ['repass', 'compare', 'compareAttribute' => 'adminpass', 'message' => '两次密码输入不一致', 'on' => ['changepass', 'adminadd']],
        ];
    }

    public function validatePass()
    {
        if (!$this->hasErrors()) {
            $data = self::find()->where('adminuser = :user', [":user" => $this->adminuser])->one();
            if (is_null($data)) {
                $this->addError("adminpass", "用户名或者密码错误");
            }
            if (!Yii::$app->getSecurity()->validatePassword($this->adminpass, $data->adminpass))
            {
                $this->addError("adminpass", "用户名或者密码错误");
            }
        }
    }

    public function validateEmail()
    {
        if (!$this->hasErrors()) {
            $data = self::find()->where('adminuser = :user and adminemail = :email', [':user' => $this->adminuser, ':email' => $this->adminemail])->one();
            if (is_null($data)) {
                $this->addError("adminemail", "管理员电子邮箱不匹配");        
            }
        }
    }

    public function getAdmin()
    {
        return self::find()->where('adminuser = :user', [':user' => $this->adminuser])->one();
    }

    public function login($data)
    {
        $this->scenario = "login";
        if ($this->load($data) && $this->validate()) {
            //做点有意义的事
            return Yii::$app->admin->login($this->getAdmin(), $this->rememberMe ? 24*3600 : 0);
        }
        return false;
    }
    
    public function seekPass($data)
    {
        $this->scenario = "seekpass";
        if ($this->load($data) && $this->validate()) {
            //做点有意义的事
            $time = time();
            $token = $this->createToken($data['Admin']['adminuser'], $time);
            $mailer = Yii::$app->mailer->compose('seekpass', ['adminuser' => $data['Admin']['adminuser'], 'time' => $time, 'token' => $token]);
            $mailer->setFrom("709334814@qq.com");
            $mailer->setTo($data['Admin']['adminemail']);
            $mailer->setSubject("91好管家-找回密码");
            if ($mailer->send()) {
                return true;
            }
        }
        return false;
    
    }

    public function createToken($adminuser, $time)
    {
        return md5(md5($adminuser).base64_encode(Yii::$app->request->userIP).md5($time));
    }

    public function changePass($data) 
    {
        $this->scenario = "changepass";
        if ($this->load($data) && $this->validate()) {
            return (bool)$this->updateAll(['adminpass' => md5($this->adminpass)], 'adminuser = :user', [':user' => $this->adminuser]);
        }
        return false;
    }

    public function reg($data) 
    {
        $this->scenario = 'adminadd';
        if ($this->load($data) && $this->validate()) {
            // $this->adminpass = md5($this->adminpass);
            $this->adminpass = Yii::$app->getSecurity()->generatePasswordHash($this->adminpass);

            if ($this->save(false)) {
                return true;
            }
            return false;
        }
        return false;
    }

    public function changeEmail($data)
    {
        $this->scenario = "changeemail";
        if ($this->load($data) && $this->validate()) {
            return (bool)$this->updateAll(['adminemail' => $this->adminemail], 'adminuser = :user', [':user' => $this->adminuser]);
        }
        return false;
    }

    /**
     * Generates password hash from password and sets it to the model
     *
     * @param string $password
     */
    public function setPassword($password)
    {
        $this->adminpass = Yii::$app->security->generatePasswordHash($password);
    }

    public static function findIdentity($id)
    {
        return static::findOne($id);
    }

    public static function findIdentityByAccessToken($token, $type = null)
    {
        return null;
    }

    public function getId()
    {
        return $this->adminid;
    }

    public function getAuthKey()
    {
        return '';
    }

    public function validateAuthKey($authKey)
    {
        return true;
    }







}
