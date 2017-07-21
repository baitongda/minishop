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
use think\Db;
use think\Input;
use think\Request;

/**
 * 系统用户控制器
 * @author  ILSunshine  
 */
class Menu extends Common
{
    /**
     * 后台菜单首页
     */
    public function index()
    {

        // Menu列表数据
        $menuList = Db::name('Menu')
        ->alias('a')
        ->join('menu_group b','a.group_id = b.id','left')
        ->field('a.*,b.name as gname')
        ->order('a.group_id asc,a.sort asc')
        ->select();
        // Select列表数据转换成树
        $menuListTree = list_to_tree($menuList);
        // 输出赋值
        $this->assign('menuListTree',$menuListTree);
        return $this->fetch();
    }

    /**
     * 新增菜单
     * @author  ILSunshine
     */
    public function add()
    {
        if (Request::instance()->isPost()) {
            $data = input('post.');
            if($data['pid'] != 0){
                $group_id = Db::name('Menu')->where('id',$data['pid'])->value('group_id');
                $data['group_id'] = $group_id;
            }
            $getStatus = Db::name('Menu')->insert($data);
            if ($getStatus !== false) {
                return $this->success('添加成功',url('menu/index'));
            } else {
                return $this->error('添加失败');
            }
        } else {
            $menuList = Db::name('Menu')->field(true)->select();
            $top = Db::name('MenuGroup')->select();
            // 列表数据转换成树
            $menuList = list_to_tree($menuList);
            $this->assign('menuList', $menuList);
            $this->assign('top',$top);
            return $this->fetch();
        }
    }

    /**
     * 编辑菜单
     * @author  ILSunshine
     */
    public function edit($id)
    {
        if (Request::instance()->isPost()) {
            $data = input('post.');
            if($data['pid'] != 0){
                $group_id = Db::name('Menu')->where('id',$data['pid'])->value('group_id');
                $data['group_id'] = $group_id;
            }            
            $getStatus = Db::name('Menu')->where('id', $data['id'])->update($data);
            if ($getStatus !== false) {
                return $this->success('编辑成功',url('menu/index'));
            } else {
                return $this->error('编辑失败');
            }
        } else {
            // 查询单条数据
            if (empty($id)) {
                return $this->error('请选择有效数据');
            }
            $map['id'] = $id;
            $menuInfo = Db::name('Menu')->where($map)->find();
            //查询menu菜单数组
            $menuList = Db::name('Menu')->field(true)->select();
            $top = Db::name('MenuGroup')->select();
            // 列表数据转换成树
            $menuList = list_to_tree($menuList);
            $this->assign('menuList', $menuList);
            $this->assign('menuInfo', $menuInfo);
            $this->assign('top',$top);
            return $this->fetch();
        }
    }

    /**
     * 删除后台菜单
     * @author  ILSunshine
     */
    public function setstatus()
    {
        $status  = input('post.status');
        $menuids = input('post.ids/a');
        if (!in_array($status,['delete'])) {
            return $this->error('请选择需要操作的名称');
        }
        $menuResult = Db::name('Menu')->where('id','in',implode(',', $menuids))->delete();
        if ($menuResult) {
            return $this->success('操作成功！');
        } else {
            return $this->error('操作失败！');
        }
    }

    /**
     * 菜单组首页
     * @return [type] [description]
     */
    public function group()
    {
        $lists = Db::name('MenuGroup')->order('sort asc')->select();
        $this->assign('lists',$lists);
        return $this->fetch();
    }

    /**
     * 设置菜单组状态
     * @return [type] [description]
     */
    public function groupstatus()
    {
        $status  = input('post.status');
        $ids = input('post.ids/a');  
        if(empty($ids)){
            $this->error('请选择要操作的数据');
        } 
        //禁用 
        if($status == 'forbidden'){
            $res = Db::name('MenuGroup')->where('id','in',$ids)->update(['status'=>2]);
            if ($res) {
                $this->success('操作成功！');
            } else {
                $this->error('操作失败！');
            }   
        //启用         
        }elseif($status == 'open'){
            $res = Db::name('MenuGroup')->where('id','in',$ids)->update(['status'=>1]);
            if ($res) {
                $this->success('操作成功！');
            } else {
                $this->error('操作失败！');
            }    
        //删除            
        }elseif($status == 'delete'){
            $flg = true;
            foreach ($ids as $id) {
                $has = Db::name('Menu')->where('group_id',$id)->find();
                if($has){
                    $flg = false;
                    break;
                }
            }
            if($flg){
                $info = Db::name('MenuGroup')->where('id','in',$ids)->delete();
                if($info){
                    $this->success('删除成功');
                }else{
                    $this->error('删除失败');
                }
            }else{
                $this->error('请先删除菜单组下的所有菜单');
            }
        }
        //错误
        else{
            $this->error('错误');
        }
    }

    /**
     * 修改菜单组
     * @return [type] [description]
     */
    public function editgroup(){
        $id  = input('id');
        if(empty($id)){
            $this->error('参数错误');
        }        
        if (Request::instance()->isPost()){
            $data['name'] = input('name');
            $data['sort'] = input('sort',0);
            if(empty($data)){
                $this->error('菜单组名称不能为空');
            }
            $flg = Db::name('MenuGroup')->where('id',$id)->update($data);
            if($flg){
                $this->success('编辑成功');
            }else{
                $this->error('编辑失败');
            }
        }else{
            $data = Db::name('MenuGroup')->where('id',$id)->find();
            $this->assign('data',$data);
            return $this->fetch();
        }
    }

    /**
     * 添加菜单组
     * @return [type] [description]
     */
    public function addgroup()
    {   
        if (Request::instance()->isPost()){
            $data['name'] = input('name');
            $data['sort'] = input('sort',0);
            if(empty($data)){
                $this->error('菜单组名称不能为空');
            }
            $flg = Db::name('MenuGroup')->insert($data);
            if($flg){
                $this->success('添加成功');
            }else{
                $this->error('添加失败');
            }
        }else{
            return $this->fetch();
        }        
    }
}