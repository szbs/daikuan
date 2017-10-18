<?php
namespace Qianshan\Controller;
use Common\Controller\MemberbaseController;

class IndexController extends MemberbaseController{

    function _initialize(){
        $userid=sp_get_current_userid();
        $myinfo = M('users')->where('id='.$userid)->find();
        if ($myinfo['user_type'] == 1 || $myinfo['user_type'] == 3){

        }else{
            //exit;
        }
    }
	
	function index(){
        $userid=sp_get_current_userid();
        
		$prolists = M('JsPro')->select();
		//dump($prolists);
		$this->assign("prolists",$prolists);
		$this->display();
	}
	function useradd(){
		$this->assign("prolists",$prolists);
		$this->display();
	}
    /**
     * 普通用户列表
     */
    public function userlist(){
        $userid=sp_get_current_userid();
        $myinfo = M('users')->where('id='.$userid)->find();

        
        $id = $_GET['id'];
        if ($id>0){
            $proinfo = M('JsPro')->where('pid='.$pid)->find();
            $proinfo = GetSettingHtml($proinfo);
            //dump($proinfo);
            $this->assign("proinfo",$proinfo);
        }
        $lists = array();
        $where =  '';
        if ($myinfo['user_type'] == 1){
            $where =  '';
        }else if ($myinfo['user_type'] == 3){
            $where =  'loan_manager_id='.$userid;
        }else{

        }
        foreach (M('JsUserProfile')->where($where)->select() as $k=>$v){
            $lists[] = $v;
        }
        $this->assign("lists",$lists);
        $this->display();
    }
    /**
     * 普通用户管理
     */
    public function useredit(){
        $userid=sp_get_current_userid();
        $myinfo = M('users')->where('id='.$userid)->find();
        $id = I('id');
    	if ($id >0){
    		$userinfo = M('JsUserProfile')->where('id='.$id)->find();
    	}
        if(IS_POST){
            //dump($_POST);
        }
        
        $loan_manager_text = '';
        if ($myinfo['user_type'] == 1){
            $loan_manager_text .= '<select name="loan_manager_id" >';
            foreach (M('JsLoanManager')->select() as $k=>$v){
                $loan_manager_text .= '<option value="'.$v['id'].'" '.($userinfo['loan_manager_id'] == $v['id'] ? 'selected':'').'>'.$v['name'].'</option>';
            }
            $loan_manager_text .= '</select>';

        }elseif($myinfo['user_type'] == 3){
            $loan_manager_info = M('JsLoanManager')->where('id='.$userid)->find();
            $loan_manager_text = '<input type="hidden" name="loan_manager_id" value="'.$userid.'">'.$loan_manager_info['name'];
        }

        $this->assign("loan_manager_text",$loan_manager_text);
        $this->assign("userinfo",$userinfo);
        $this->display();
    }
    /**
     * 产品列表
     */
    public function prolist(){
        $lists = array();

        foreach (M('JsPro')->where()->select() as $k=>$v){
            $lists[] = $v;
        }
        $this->assign("lists",$lists);
        $this->display();
    }
    /**
     * 产品列表
     */
    public function prodetails(){
    	$pid = I('pid');
    	if ($pid >0){
    		$proinfo = M('JsPro')->where('pid='.$pid)->find();
    	}
        

        
        $this->assign("proinfo",$proinfo);
        $this->display();
    }
}