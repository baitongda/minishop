<?php
// +----------------------------------------------------------------------
// | Minishop [ Easy to handle for Micro businesses ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.qasl.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: tangtanglove <dai_hang_love@126.com> <http://www.ixiaoquan.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

use think\Controller;
use think\Lang;
use think\Request;
use think\Db;

/**
 * 系统通用控制器：需登录
 * @author  tangtanglove <dai_hang_love@126.com>
 */
class Common extends Controller
{
    /**
     * 初始化方法
     * @author tangtanglove
     */
    protected function _initialize()
    {
    	if (session('admin_user_auth')) {
            if (!defined('UID')) {
    		    define('UID', session('admin_user_auth.uid'));
            }
            // 初始化导航
            $this->navbar();
    	} else {
    		define('UID', null);
    	}
        if(!UID){
            $this->redirect(url('base/login'));
        }
        //权限判断
        $this->auth();
        load_config();// 加载接口配置      
    }

    /* 退出登录 */
    public function logout()
    {
        //退出登錄註銷session
        session('admin_user_auth',null);
        $this->redirect(url('base/login'));
    }

    /**
     * 后台菜单
     * @author tangtanglove
     */
    protected function navbar()
    {
        $request        = Request::instance();
        //获取当前控制器
        $controller     = strtolower($request->controller());
        //获取当前方法
        $action         = strtolower($request->action());
        //组合url
        $url            = $controller."/".$action;
        //顶部菜单
        $top = [];        
        //读取用户缓存
        $uinfo = cache('U_'.UID);
        if($uinfo&&isset($uinfo['menuTop'])){
            $top = $uinfo['menuTop'];
        }else{
            //获取当前登录者的权限
            $topAuth   = get_top_menu_auth(); 
            $menuAuth = get_menu_auth();        
            $menuTop = Db::name('MenuGroup')->where('status',1)->order('sort asc')->select();
            foreach ($menuTop as $t) {
                if(check_menu_auth($t['id'],$topAuth)){
                    $top[] = $t; 
                }            
            }
            //左边菜单（做顶部菜单连接）
            foreach ($top as $key => $value) {
                // 左侧菜单权限
                $left = Db::name('Menu')->where(['hide'=>0,'pid'=>0,'group_id'=>$value['id']])->order('sort asc')->select();
                $acc = [];
                if($left){
                    foreach ($left as $v) {
                        if(check_menu_auth($v['id'],$menuAuth)){
                            $acc[] = $v; 
                        }
                    }            
                }    
                //选取第一个有权限的左侧子菜单作为顶部菜单的链接 
                if($acc){
                    $children = Db::name('Menu')->where(['hide'=>0,'pid'=>$acc[0]['id']])->order('sort asc')->select();
                    $top[$key]['url'] = "#";
                    foreach ($children as $data) {
                        if(check_menu_auth($data['id'],$menuAuth)){
                            $top[$key]['url'] = url($data['url']);
                            break;
                        }
                    }               
                }else{
                    $top[$key]['url'] = "#";
                }
            }
            //读取合并
            $uinfo = cache('U_'.UID); 
            $uinfo['menuTop'] = $top;
            cache('U_'.UID,$uinfo); 
                  
        }        
        //左侧菜单（显示）
        $group_id = Db::name('Menu')->where('url',$url)->value('group_id');
        if($uinfo&&isset($uinfo['menu_'.$group_id])){
            $menuTree = $uinfo['menu_'.$group_id];
        }else{
            $lists = [];
            //获取当前登录者的权限
            $menuAuth = get_menu_auth();    
            if($group_id){
                $menuList = Db::name('Menu')->where(['hide'=>0,'group_id'=>$group_id])->select();
                $menuList = list_sort_by($menuList,'sort');
                foreach ($menuList as $key => $data) {
                    if(check_menu_auth($data['id'],$menuAuth)){
                        $lists[] = $data; 
                    }
                }            
            }
            // 列表数据转换成树
            $menuTree = list_to_tree($lists);  
            //读取合并
            $uinfo = cache('U_'.UID);              
            $uinfo['menu_'.$group_id] = $menuTree;  
            cache('U_'.UID,$uinfo); 
        }        
        $this->assign('menuTree', $menuTree);
        $this->assign('nav_group_id',$group_id);
        $this->assign('menuTop',$top);
    }

     /**
     * 权限判断
     * @return [type] [description]
     */
    protected function auth(){
        $request        = Request::instance();
        //获取当前控制器
        $controller     = strtolower($request->controller());
        //获取当前方法
        $action         = strtolower($request->action());
        //组合url
        $url            = $controller."/".$action;
        //获取菜单的id
        $menu_cache = cache('menu_rule');
        if(isset($menu_cache[$url]['id'])){
            $ruleId = $menu_cache[$url]['id'];
        }else{
            $info = Db::name('Menu')->where('url',$url)->find(); 
            if($info){
                $menu_cache[$url]['id'] = $info['id'];
                $menu_cache[$url]['pid'] = $info['pid'];
                cache('menu_rule',$menu_cache);                
            }
        }      
        //读取用户缓存
        $uinfo = cache('U_'.UID);
        if($uinfo&&isset($uinfo['rules'])){
            $rules_array = $uinfo['rules'];
        }else{
            //查询当前登录用户的uuid
            $uuid           = Db::name('Users')->where('id',UID)->value('uuid');
            $keyValue       = Db::name('KeyValue')->where('uuid',$uuid)->find();
            if($keyValue && $keyValue['value']==1){
                //超级管理员，直接返回
                $uinfo['rules'] = 'administrator';
                cache('U_'.UID,$uinfo);                
                return true;
            }
            
            //获取当前登录用户所在的用户组(可以是多组)
            $group          = Db::name('UserGroupAccess')->where('uid',UID)->select();
            if(!$group){
                $uinfo['rules'] = 'no';
                cache('U_'.UID,$uinfo);                
                $this->error("没有权限");
            }
            //所有权限数组
            $rules_array = [];
            $arr = [];
            foreach ($group as  $v) {
                $rules = Db::name('UserGroup')->where('id',$v['group_id'])->where('status',1)->value('rules');
                if($rules){
                    $arr = explode(',',$rules);
                }
                $rules_array = array_merge($rules_array, $arr);  
            }
            //去除重复值
            $rules_array = array_unique($rules_array);
            $uinfo['rules'] = $rules_array;
            cache('U_'.UID,$uinfo);            
        }        
        //权限判断
        if(is_array($rules_array)){
            if(!in_array($ruleId,$rules_array)){
                $this->error("没有权限");
            }else{
                return true;
            }
        }else{
            if($rules_array == "administrator"){ //超级管理员，拥有所有权限
                return true;
            }else{
                $this->error("没有权限");
            }
        }

    }

     /**
     * 清除缓存
     * @return [type] [description]
     */
    public function delelteRuntime()
    {
        if ($this->delDirAndFile('./runtime/cache') && $this->delDirAndFile('./runtime/temp')) {
            return $this->success('缓存清除成功！');
        } else {
            return $this->error("操作失败，请检查是否有删除权限！");
        }
    }

     /**
     * 删除文件
     * @return [type] [description]
     */
    protected function delDirAndFile($dirPath)
    {
        if(is_dir($dirPath)) {
            if ($handle = opendir($dirPath)) {
                while (false !== ($item = readdir($handle))) {
                    if ($item != "." && $item != "..") {
                        if (is_dir("$dirPath/$item")) {
                            $this->delDirAndFile("$dirPath/$item");
                        } else {
                            if(!unlink("$dirPath/$item")) {
                                return false;
                            }
                        }
                    }
                }
                closedir($handle);
                if (!rmdir($dirPath)) {
                    return false;
                } else {
                    return true;
                }
            }
        } else {
            return true;
        }
    }

}
