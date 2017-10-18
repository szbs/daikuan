<?php
/**
 * 后台首页
 */
namespace Qianshan\Controller;

use Common\Controller\AdminbaseController;

class ProductController extends AdminbaseController {
	
    function _initialize(){
        //$this->canshus = M('JsCanshu')->where()->select();
        //$this->shuxings = M('JsAttribute')->where()->select();
        $this->types = array(
            array('typeid'=>'text','typename'=>'单行文本'),
            array('typeid'=>'textarea','typename'=>'多行文本'),
            array('typeid'=>'radio','typename'=>'单选'),
            array('typeid'=>'checkbox','typename'=>'多选'),
            array('typeid'=>'select','typename'=>'下拉单选'),
            array('typeid'=>'mselect','typename'=>'下拉多选'),
            array('typeid'=>'color','typename'=>'拾色器'),
            array('typeid'=>'date','typename'=>'日期'),
            array('typeid'=>'datetime','typename'=>'日期和时间'),
            array('typeid'=>'month','typename'=>'月'),
            array('typeid'=>'week','typename'=>'周'),
            array('typeid'=>'time','typename'=>'时、分、秒'),
            array('typeid'=>'email','typename'=>'e-mail 地址'),
            array('typeid'=>'file','typename'=>'文件'),
            array('typeid'=>'number','typename'=>'数字'),
            array('typeid'=>'password','typename'=>'密码'),
            array('typeid'=>'range','typename'=>'数字区间'),
            array('typeid'=>'region','typename'=>'数字区间'),
            array('typeid'=>'tel','typename'=>'电话号码'),
            array('typeid'=>'url','typename'=>'网址'),
            );
        $this->ops = array(
            array('opid'=>'eq','opname'=>'等于'),
            array('opid'=>'neq','opname'=>'不等于'),
            array('opid'=>'gt','opname'=>'大于'),
            array('opid'=>'egt','opname'=>'大于等于'),
            array('opid'=>'lt','opname'=>'小于'),
            array('opid'=>'elt','opname'=>'小于等于'),
            array('opid'=>'heq','opname'=>'恒等于'),
            array('opid'=>'nheq','opname'=>'不恒等于'),
            );
        $this->shuxings = array(
            array('sxid'=>'due_time_from','sxname'=>'贷款期限开始'),
            array('sxid'=>'due_time_to','sxname'=>'贷款期限结束'),
            array('sxid'=>'credit_from','sxname'=>'额度开始'),
            array('sxid'=>'credit_to','sxname'=>'额度结束'),
            array('sxid'=>'interest','sxname'=>'利息'),
            array('sxid'=>'commission','sxname'=>'职业'),
            array('sxid'=>'occupation','sxname'=>'贷款期限开始'),
            array('sxid'=>'city','sxname'=>'所属城市'),
            );
        $this->canshus = array(
            //array('csid'=>'age','csname'=>'年龄'),
            array('csid'=>'gender','csname'=>'性别'),
            array('csid'=>'marry_status','csname'=>'婚姻状况'),
            array('csid'=>'marry_dates','csname'=>'结婚时长(月)'),
            array('csid'=>'educational','csname'=>'学历'),
            array('csid'=>'graduation_after_time','csname'=>'毕业年限(月)'),
            array('csid'=>'salary','csname'=>'平均月薪(元)'),
            array('csid'=>'income_tax_duration','csname'=>'个税缴纳时长(月)'),
            array('csid'=>'housing_fund_base_fee','csname'=>'公积金基数(元)'),
            array('csid'=>'housing_fund_fee','csname'=>'公积金缴费金额(元)'),
            array('csid'=>'housing_fund_duration','csname'=>'公积金缴费时长(月)'),
            array('csid'=>'occpation','csname'=>'职业'),
            array('csid'=>'occupation_duration','csname'=>'入职时长(月)'),
            array('csid'=>'social_security_fee','csname'=>'社保缴纳金额(元)'),
            array('csid'=>'social_security_duration','csname'=>'社保连续缴纳时长(月)'),
            //array('csid'=>'social_security_duration','csname'=>'贷款期限开始'),
            array('csid'=>'sesame_credit','csname'=>'芝麻信用分数'),
            array('csid'=>'alipay_register_date','csname'=>'支付宝注册时长(月)'),
            array('csid'=>'credit_line','csname'=>'信用卡授信额度(万元)'),
            array('csid'=>'credit_card_duration','csname'=>'信用卡使用时间(月)'),
            array('csid'=>'car_hand','csname'=>'汽车类型'),
            array('csid'=>'car_age','csname'=>'车龄(月)'),
            array('csid'=>'car_value','csname'=>'车估值(万元)'),
            array('csid'=>'oroperty_register_date','csname'=>'物业登记时长(月)'),
            array('csid'=>'rental_property_check','csname'=>'是否有物业出租'),
            array('csid'=>'mortgage_property_fee','csname'=>'按揭物业月供金额(元)'),
            array('csid'=>'mortgage_property_duration','csname'=>'按揭物业时长(月)'),
            array('csid'=>'mortgage_property_paid_off_duration','csname'=>'已结清按揭房产的时长(月)'),
            array('csid'=>'pos_register_date','csname'=>'pos使用时长(月)'),
            array('csid'=>'pos_money','csname'=>'pos月流水金额(万元)'),
            array('csid'=>'company_owner','csname'=>'是否是公司法人'),
            array('csid'=>'company_share','csname'=>'占公司股份百分比(％)'),
            array('csid'=>'company_register_duration','csname'=>'公司成立时长(月)'),
            array('csid'=>'company_sales','csname'=>'公司月营业额(万元)'),
            array('csid'=>'pos_money','csname'=>'pos月流水金额(万元)'),
            array('csid'=>'insurance_type','csname'=>'保单类型'),
            array('csid'=>'insurance_effective_time','csname'=>'保单生效时长(月)'),
            array('csid'=>'insurance_fee_type','csname'=>'保单缴费情况'),
            array('csid'=>'taobao_register_duration','csname'=>'淘宝注册时长(月)'),
            array('csid'=>'taobao_credit_line','csname'=>'淘宝信用等级'),
            array('csid'=>'taobao_comment_rate','csname'=>'淘宝好评率(％)'),
            array('csid'=>'jingdong_credit_line','csname'=>'京东会员级别'),
            );
        $this->assign("canshus",$this->canshus);
        $this->assign("shuxings",$this->shuxings);
        $this->assign("types",$this->types);
        $this->assign("ops",$this->ops);
    }
	
    /**
     * 产品管理
     */
    public function index() {
        if(IS_POST){
            foreach ($_POST['displayorders'] as $k=>$v){
                $data['displayorder'] = $v;
                $data['status'] = $_POST['status'][$k];
                M('JsPro')->where('pid='.$k)->save($data);
            }
            $this->success("更新成功！");
            
        }

        $count = M('JsPro')->count();
        $Page  = $this->Page($count,10);
        $show       = $Page->show("Admin");// 分页显示输出
        $lists = array();
        foreach (M('JsPro')->order('pid DESC ,displayorder ASC')->limit($Page->firstRow . ',' . $Page->listRows)->select() as $k=>$v){
            $v['interest'] = unserialize($v['interest']);
            $v['commission'] = $v['commission'] ? ($v['commission'] .($v['commission_type'] ==1 ? '%' : '元')) : '';
            $lists[] = $v;
        }

        $this->assign('Page',$show);
        $this->assign("lists",$lists);
        $this->display();
    }
    /**
     * 产品管理
     */
    public function proadd() {

        $pid = $_GET['pid'];
        $provinces = M('JsDistrict')->where('level=1 AND upid=0')->select();
        foreach (M('JsDistrict')->where('level=1 AND upid=0')->select() as $k=>$v){
            $citys[$v['id']] = M('JsDistrict')->where('level=2 AND upid='.$v['id'])->select();
        }

        if(IS_POST){
            if(!empty($_POST['proname'])){
                $data['name'] = trim($_POST['proname']);
                $data['due_time_from'] = trim($_POST['due_time_from']);
                $data['due_time_to'] = trim($_POST['due_time_to']);
                $data['credit_from'] = trim($_POST['credit_from']);
                $data['credit_to'] = trim($_POST['credit_to']);
                for($i=0;$i<3;$i++){
                    $lixi[$i] = array('lixitype'=>$_POST['lixitype'][$i],'lixi1'=>$_POST['lixi1'][$i],'lixidw1'=>$_POST['lixidw1'][$i],'lixi2'=>$_POST['lixi2'][$i],'lixidw2'=>$_POST['lixidw2'][$i]);
                }
                $data['interest'] = serialize($lixi);
                $data['commission'] = trim($_POST['commission']);
                $data['commission_type'] = intval($_POST['commission_type']);
                $data['apply_material'] = trim($_POST['apply_material']);
                $data['prepayment_notice'] = trim($_POST['prepayment_notice']);
                $data['overdue_repayment_notice'] = trim($_POST['overdue_repayment_notice']);
                $data['occupation'] = serialize($_POST['occupation']);
                $data['city'] = serialize($_POST['citys']);

                


                $tipstext = '';
                $stauts_text = 'success';
                
                if ($pid>0){
                    if (M('JsPro')->where("name='".$data['name']."' AND pid <> ".$pid)->find()){
                        $this->error("产品名称已经存在！");
                    }
                    $data['updatetime'] = time();
                    M('JsPro')->where('pid='.$pid)->save($data);
                    $tipstext = '修改成功！';
                    
                    
                }else{
                    if (M('JsPro')->where("name='".$data['name']."'")->find()){
                        $stauts_text = 'error';
                        $tipstext = '产品名称已经存在！';
                        
                    }
                    
                    $data['createtime'] = time();
                    $data['updatetime'] = time();
                    $pid = M('JsPro')->add($data);
                    if ($pid){
                        $tipstext = '修改成功！';
                         
                    }else{
                        $stauts_text = 'error';
                        $tipstext = '添加失败！';
                    }
                }
                if ($pid){
                    M('JsProType')->where("type='age' AND pid=".$pid)->delete();
                    for ($agei=0;$agei<2;$agei++){
                        if ($_POST['agetype'][$agei] && $_POST['age_min'][$agei] && $_POST['age_max'][$agei]){
                            $agedata['type'] = 'age';
                            $agedata['pid'] = $pid;
                            $agedata['ptype'] = $_POST['agetype'][$agei];
                            $agedata['data1'] = $_POST['age_min'][$agei];
                            $agedata['data2'] = $_POST['age_max'][$agei];
                            M('JsProType')->add($agedata);
                        }
                    }

                }
                if ($stauts_text == 'success'){
                    $this->success($tipstext, U("Qianshan/product/index"));
                }else if ($stauts_text == 'error'){
                    $this->error($tipstext, U("Qianshan/product/index"));
                }
               
                exit;
            }else{
                $this->error("必须填写产品名称！");
            }

        }else{
            
            if ($pid>0){
                $proinfo = M('JsPro')->where('pid='.$pid)->find();
                $proinfo['interest'] =  unserialize($proinfo['interest']);
                $proinfo['occupation'] =  unserialize($proinfo['occupation']);
                $proinfo['city'] =  unserialize($proinfo['city']);
                $provs_check = array();
                foreach ($proinfo['city'] as $ck=>$cv){
                    $prov_info = M('JsDistrict')->where('id='.$cv)->find();
                    $provs_check[$prov_info['upid']] = 1;
                    
                }
                $orther_info = array();
                foreach (M('JsProType')->where('pid='.$pid)->select() as $k=>$v){
                    $orther_info[$v['type']][] = $v;
                }
                //var_dump($proinfo);
                
                $this->assign("orther_info",$orther_info);
                $this->assign("proinfo",$proinfo);
            }
        }
        
        $this->assign("provs_check",$provs_check);
        $this->assign("provinces",$provinces);
        $this->assign("citys",$citys);
        $this->assign("pid",$pid);
        $this->assign("canshus",$this->canshus);
        $this->assign("shuxings",$this->shuxings);
        
        
        $this->display();
    }
    
    /**
     * 产品属性
     */
    public function promod(){
        $pid = $_GET['pid'];
        if ($pid>0){
            $proinfo = M('JsPro')->where('pid='.$pid)->find();
            $proinfo = GetSettingHtml($proinfo);
            //dump($proinfo);
            $this->assign("proinfo",$proinfo);
        }
        $lists = array();
        foreach (M('JsModel')->where()->select() as $k=>$v){
            $lists[] = $v;
        }
        $this->assign("lists",$lists);
        $this->display();
    }
    /**
     * 产品模型
     */
    public function model(){
        $lists = array();

        foreach (M('JsModel')->where()->select() as $k=>$v){
            $lists[] = $v;
        }
        $this->assign("lists",$lists);
        $this->display();
    }
    /**
     * 产品模型排序
     */
    public function modelorders(){
        foreach($_POST['displayorders'] as $k=>$v){
            $data['displayorder'] = $v;
            M('JsModel')->where('mid='.$k)->save($data);
        }
        $this->success("排序调整成功");
    }
    /**
     * 增加产品模型
     */
    public function modeladd(){
        $mid = $_GET['mid'];
        if(IS_POST){
            if(!empty($_POST['modelname'])){
                $data['modelname'] = trim($_POST['modelname']);
                if ($mid>0){
                    if (M('JsModel')->where("modelname='".$data['modelname']."' AND mid <> ".$mid)->find()){
                        $this->error("模型名称已经存在！");
                    }
                    M('JsModel')->where('mid='.$mid)->save($data);
                    $this->success("修改成功！", U("Qianshan/product/model"));
                    exit;
                }else{
                    if (M('JsModel')->where("modelname='".$data['modelname']."'")->find()){
                        $this->error("模型名称已经存在！");
                    }
                    $data['dateline'] = time();
                    if (M('JsModel')->add($data)){
                        $this->success("添加成功！", U("Qianshan/product/model"));
                        exit;
                    }else{
                        $this->error("添加失败！");
                    }
                }
                
            }else{
                $this->error("必须填写模型名称！");
            }

        }else{
            
            if ($mid>0){
                $modelinfo = M('JsModel')->where('mid='.$mid)->find();
                $this->assign("modelinfo",$modelinfo);
            }
        }
        $this->assign("mid",$mid);
        $this->display();
    }
    /**
     * 参数设置
     */
    public function canshu(){
        $lists = array();
        $types = array();
        foreach($this->types as $sk=>$sv){
            $types[$sv['typeid']] = $sv['typename'];
        }
        foreach (M('JsCanshu')->where()->select() as $k=>$v){
            $v['typename'] = $types[$v['type']];
            $lists[] = $v;
        }
    
        //$columns = M('JsPro')->query("SHOW FULL COLUMNS FROM `__TABLE__`");   
        //dump($columns);     
        $this->assign("lists",$lists);
        $this->display();
    }
    /**
     * 添加参数设置
     */
    public function canshuadd(){
        $sid = $_GET['sid'];
        if(IS_POST){
            if (empty($_POST['title'])){
                $this->error("参数中文名称不能为空！");
            }
            if (empty($_POST['title'])){
                $this->error("参数英文标识不能为空！");
            }
            if (empty($_POST['content'])){
                //$this->error("参数选项不能为空！");
            }
            $data['title'] = trim($_POST['title']);
            $data['name'] = trim($_POST['name']);
            $data['type'] = trim($_POST['typeid']);
            $data['content'] = trim($_POST['content']);
            
            if ($sid>0){
                if (M('JsCanshu')->where("name='".$data['name']."' AND sid <> ".$sid)->find()){
                    $this->error("英文名称已经存在！");
                }
                M('JsCanshu')->where('sid='.$sid)->save($data);
                $this->success("修改成功！", U("Qianshan/product/canshu"));
                exit;
            }else{
                if (M('JsCanshu')->where("name='".$data['name']."'")->find()){
                    $this->error("参数英文标识（变量名）已经存在！");
                }
                $data['dateline'] = time();
                if (M('JsCanshu')->add($data)){
                    $sql = " ALTER TABLE ".C('DB_PREFIX')."js_pro ADD ".$data['name']." VARCHAR(100) CHARACTER SET utf8;";
                    $re = M() -> execute($sql);
                    $this->success("添加成功！", U("Qianshan/product/canshu"));
                    exit;
                }else{
                    $this->error("添加失败！");
                }
            }
        }else{
            
            if ($sid>0){
                $settinginfo = M('JsCanshu')->where('sid='.$sid)->find();
                $this->assign("settinginfo",$settinginfo);
            }
        }
        $this->assign("sid",$sid);
        
        $this->display();
    }
    /**
     * 产品属性
     */
    public function attribute(){
        $this->display();
    }
    /**
     * 添加产品属性
     */
    public function attributeadd(){
        $this->display();
    }
    /**
     * 筛选条件
     */
    public function user(){
        $this->display();
    }
    /**
     * 添加筛选条件
     */
    public function useradd(){
        $this->display();
    }

    /**
     * 申请条件列表
     */
    public function shenqing(){
        $pid = I('pid');
        $cid = intval(I('cid'));
        $coninfo = $proinfo = $proconlist = array();
        $proinfo = M('JsPro')->where('pid='.$pid)->find();

        if ($cid>0 && I('type')=='del'){
            M('JsProCondition')->where('cid='.$cid)->delete();
        }

        foreach ($this->canshus as $k=>$v){
            $csarray[$v['csid']] = $v['csname'];
        }
        foreach ($this->ops as $k=>$v){
            $sxarray[$v['opid']] = $v['opname'];
        }
        
        if(IS_POST){
            if (trim($_POST['content']) || $_POST['content1']){
                $data['pid'] = $pid;
                $data['optionname'] = $_POST['optionname'];
                $data['equationtype'] = $_POST['equationtype'];
                $data['content'] = in_array($data['optionname'],array('occpation','insurance_type','insurance_fee_type','gender','educational','rental_property_check','company_owner','taobao_credit_line','jingdong_credit_line','car_hand')) ? serialize($_POST['content1']) : $_POST['content'];
                var_dump($data['content']);
                if ($cid > 0){
                    M('JsProCondition')->where('cid='.$cid)->save($data);
                    $this->success("编辑成功！", U("Qianshan/product/shenqing",array('pid'=>$pid)));
                }else{
                    M('JsProCondition')->add($data);
                    $this->success("添加成功！", U("Qianshan/product/shenqing",array('pid'=>$pid)));
                }
                exit;
            }
        }else{
            if ($cid>0){
                $coninfo = M('JsProCondition')->where('cid='.$cid)->find();
                $proconlist = M('JsProCondition')->where('pid='.$pid." AND cid <> ".$cid)->select();
            }else{
                $proconlist = M('JsProCondition')->where('pid='.$pid)->select();
            }
            foreach ($proconlist as $k=>$v){
                $v['optionname'] = $csarray[$v['optionname']];
                $v['equationtype'] = $sxarray[$v['equationtype']];
                $v['content'] = is_array(unserialize($v['content'])) ? implode(',',unserialize($v['content'])) : $v['content'] ;
                $proconlist[$k] = $v;
            }
            
        }
        $this->assign("csarray",$csarray);
        $this->assign("coninfo",$coninfo);
        $this->assign("proinfo",$proinfo);
        $this->assign("proconlist",$proconlist);
        $this->display();
    }
    /**
     * 申请条件列表
     */
    public function shenqingadd(){
        $pid = I('pid');
        $canshutypes = $this->types;
        
        foreach (M('JsCanshu')->where()->select() as $k=>$v){
            $v['typename'] = $types[$v['type']];
            $canshulists[] = $v;
        }

        $proinfo = M('JsPro')->where('pid='.$pid)->find();
        $this->assign("canshutypes",$canshutypes);
        $this->assign("canshulists",$canshulists);
        $this->assign("proinfo",$proinfo);
        $this->display();
    }

}

