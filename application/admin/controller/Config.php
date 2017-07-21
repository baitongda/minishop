<?php
// +----------------------------------------------------------------------
// | Minishop [ Easy to handle for Micro businesses]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.qasl.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: tangtanglove <dai_hang_love@126.com> <http://www.ixiaoquan.com>
// +----------------------------------------------------------------------

namespace app\admin\controller;

use think\Controller;
use think\Input;
use think\DB;
use think\Request;

/**
 * 系统用户控制器
 * @author  ILSunshine
 */
class Config extends Common
{
    /**
     * 系统配置
     * @author 天行健<764617706@qq.com>
     */
    public function consumer()
    {
          
        if(Request::instance()->isPost()) {              
            $data  = input('post.');
            foreach ($data as $key => $value) {
                if($value != ""){
                    $result  = Db::name('Apiconfig')
                ->update(['id' => $key,'value'=>$value]);
                }                
            }
            if($result ==0||$result){
                return $this->success('保存成功');
            }else {
                return $this->error('请重试');
            }
        }else{
            $list = Db::name('Apiconfig')
            ->where('group','0')
            ->order("sort")
            ->select(); 
            foreach ($list as $key => $value) {
                if($value['extra']){
                    $list[$key]['extra'] = explode('|', $value['extra']);
                }                       
            }
            // dump($list);die();
            $this->assign('list',$list);
            return $this->fetch();
        }
    }
    /**
     * 开发者模式
     * @author 天行健
     */
    public function developer(){
        // $group     = input('get.group');
        //筛选用户状态
        $group = input('approved');
        $group = intval($group)-1;
        if (empty($group)||$group==-1) {
            $group = array(0,1,2,3,4,5);
        }else{
            $group = array($group);
        }
        $list    = Db::name('Apiconfig')
        ->where('group','in',$group)
        ->order("sort")
        ->paginate(10);  
        $this->assign('list',$list);
        return $this->fetch();     
    }
    /**
     * 开发者模式
     * 添加配置
     * @author 天行健
     */
    public function add(){
        if(Request::instance()->isPost()) {
            $data             = input('post.');                       
            $data1['extra']   = $data['extra'];
            $data1['value']   = $data['value'];      
            if($data['type'] == '4'){
                $data['value']= $data['banner_path'];                
                unset($data['banner_path']);
            }else{
                unset($data['banner_path']);
            }
            //判断配置标志，配置名称，配置值是否为空
            if($data['value']==null||$data['value']==null||$data['value']==null){
            	return $this->error('配置标志、名称、值不可为空');
            }
            if($data['type']   == '3'){
                $data['extra'] = explode('|', $data['extra']);
                foreach ($data['extra'] as $key => $value) {
                    if($value  == ""){
                        return $this->error('配置项格式不正确，请重填');
                    }
                }
                if(is_array($data['extra'])){
                    if(count($data['extra']) == 0){
                        return $this->error('配置项不可为单项，请重填');
                    }
                }else{
                    return $this->error('配置项格式不正确，请重填');
                }
                $data['extra'] = $data1['extra'];
            } 
            //验证是否为数字
            if($data['type']   == '1'){
            	$data['value'] = intval($data['value']);
            	if($data['value'] == 0){
            		return $this->error('配置类型非数字!');
            	}
            }          
            $result  = Db::name('Apiconfig')
            ->insert($data);
            if($result){
                return $this->success('添加成功！',url('config/developer'));
            }else {
                return $this->error('添加失败！');
            }
        }else{
            return $this->fetch();
        }        
    }
    /**
     * 开发者模式
     * 修改配置
     * @author 天行健
     */
    public function edit(){
        if(Request::instance()->isPost()) {
            $data         = input('post.');
            if($data['value'] == null)
                unset($data['value']);
            $result  = Db::name('Apiconfig')
            ->where('id',$data['id'])
            ->update($data);
            if($result==1||$result==0){
                return $this->success('更新成功！',url('config/developer'));
            }else {
                return $this->error('更新失败！');
            }
        }else{
            $id     = input('');
            $list   = Db::name('Apiconfig')
            ->where('id','in',$id)
            ->find();  
            $this->assign('list',$list);
            return $this->fetch();
        }        
    }
    /**
     * 开发者模式
     * 删除配置
     * @author 天行健
     */
    public function del(){
        $id         = input('');
        $id['id'] = intval($id['id']);
        $result  = Db::name('Apiconfig')
        ->where('id','in',$id)
        ->delete();
        if($result){
            return $this->success('删除成功！',url('config/developer'));
        }else {
            return $this->error('删除失败！');
        }
    }
    /**
     * 开发者模式
     * 对用户是否显示
     * @author 天行健
     */
    public function status(){
        $id         = input('id');
        $status  = input('status');
        $result  = Db::name('Apiconfig')
        ->where('id',$id)
        ->update(['status' => $status]);
        if($result==1||$result==0){
            return $this->success('修改成功',url('config/developer'));
        }else {
            return $this->error('修改失败，请重试');
        }
    }
    /**
     * 开发者模式
     * @author 天行健
     */
    public function setStatus()
    {
        $status   = input('post.status');
        $posids   = input('post.ids/a');

        if (!in_array($status,['1','2','-1','3','4','5'])) {
            return $this->error('请勾选需要操作的配置');
        }
        $posStatus = Db::name('Apiconfig')->where('id','in',implode(',',$posids))->update(['status'=>$status]);
        if ($posStatus==0||$posStatus) {
            if($status=='-1'){
                $res = Db::name('Apiconfig')->where('id','in',implode(',',$posids))->where('status',$status)->delete();
                if($res){
                    return $this->success('修改成功！');
                }else{
                    return $this->error('修改失败!');
                }
            }else{
                return $this->success('修改成功！');
            }           
            
        } else {
            return $this->error('修改失败!');
        }
    }
}
   

