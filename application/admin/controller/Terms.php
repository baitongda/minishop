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
use think\Loader;
use think\Request;

/**
 * 系统分类系统
 * @author  tangtanglove <dai_hang_love@126.com>
 */
class Terms extends Common
{
    /**
     * 分类列表
 	 * @author  tangtanglove <dai_hang_love@126.com>
     */
    public function index()
    {
    	$name = input('name');
    	if (!empty($name)) {
    		$map['b.name'] = ['like','%'.mb_convert_encoding($name, "UTF-8", "auto").'%'];
    	} else {
    		$map = 1;
    	}
    	// 列表数据
    	$termList = Db::name('Terms')->where($map)->order('sort asc')->select();
    	// dump($termList);die();
    	$termListTree = list_to_tree($termList);    	
    	$allList = Db::name('Terms')->select();
    	$allListTree = list_to_tree($allList);
		// 输出赋值
		$this->assign('name',$name);    
    	$this->assign('termListTree',$termListTree);
    	$this->assign('allListTree',$allListTree);
        return $this->fetch();
    }

    /**
     * 添加或修改分类
 	 * @author  tangtanglove <dai_hang_love@126.com>
     */
    public function edit()
    {
		if (Request::instance()->isPost()) {
			// 接收post数据
			$data = input('');			
            // 实例化验证器
            $validate = Loader::validate('Terms');
            // 验证
            if(!$validate->check($data)){
                return $this->error($validate->getError());
            }
            
            // 更新或添加数据
			if (!empty($data['id'])) {
				$data['sort'] = (int)$data['sort'];
				$data['status'] = 1;
				if ($data['id'] === $data['pid']) {
					return $this->error('不可将自己节点设为父节点！');
				}				
				// 更新数据
				$termsResult = Db::name('Terms')->where('id',$data['id'])->update($data);			
				// ajax返回
				if ($termsResult){
					return $this->success('操作成功！' ,url('terms/index'));
				} else {
					return $this->error('操作失败！');
				}
			} else {
	            // 添加数据
				$result = Db::name('Terms')->insert($data);				
				// ajax返回
				if ($result) {
					return $this->success('操作成功！');
				} else {
					return $this->error('操作失败！');
				}
			}

		} else {
			$id = input('id');
			if (!empty($id)) {
				$termsInfo 		= Db::name('Terms')->where('id',$id)->find();
				$termList 		= Db::name('Terms')->select();
				$termListTree	= list_to_tree($termList);
				$this->assign([
					'termsInfo' 		=> $termsInfo,					
					'termListTree' 		=> $termListTree,
					]);
			}
        	return $this->fetch();
		}
    }

    /**
     * 修改设置状态
 	 * @author  tangtanglove <dai_hang_love@126.com>
     */
    public function setStatus()
    {
		// 更新状态
		$status = input('status');
		$checkids = $ids 	= input('ids/a');
		if (empty($ids)) {
			return $this->error('请选择数据！');
		}
		if ($status === 'delete') {	        			
	        $postList = Db::name('TermRelationships')->where('term_id','in',implode(',', $ids))->field('post_id')->select();	        
	        if(!empty($postList)){
	            return $this->error('请先删除分类下的文章（包含回收站）');
	        }			
			// 删除Terms表
			$termsResult = Db::name('Terms')->where('id','in',implode(',', $ids))->delete();
			if(!$termsResult){
	        	return $this->error('删除分类失败');
	        }
			return $this->success('操作成功！');			
		}
    }

}
