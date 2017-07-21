<?php
// +----------------------------------------------------------------------
// | Minishop [ Easy to handle for Micro businesses ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.qasl.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: tangtanglove <dai_hang_love@126.com> <http://www.ixiaoquan.com>
// +----------------------------------------------------------------------

namespace app\index\controller;

use think\Controller;
use think\Db;
use think\Request;

/**
 * 文章控制器
 * @author  tangtanglove <dai_hang_love@126.com>
 */
class Article extends Base
{
	/**
	 * 文章专题控制器
	 * @author  tangtanglove <dai_hang_love@126.com>
	 */
    public function index()
    {
    	// 输出主题
        return $this->themeFetch('index');
    }    

	/**
	 * 文章列表控制器
	 * @author  tangtanglove <dai_hang_love@126.com>
	 */
    public function lists()
    {
        
        $category     = input('get.category');
        if (empty($category)) {
            return $this->error('参数错误');
        }
        // 读取数据
        $categoryInfo = Db::name('Terms')->where('slug',$category)->find();
        if (empty($categoryInfo)) {
            return $this->error('分类不存在！');
        }
        // 子分类
        $categoryIds = Db::name('Terms')
        ->where(['pid'=>$categoryInfo['id']])->column('id');
        
        // 条件
        if (empty($categoryIds)) {
            $map['b.term_id'] = $categoryInfo['id'];
        }else{
            $categoryIds[] = $categoryInfo['id'];
            $map['b.term_id'] = ['in',$categoryIds];
        }
        $map['a.type'] = 'post';
        $map['a.status'] = 'publish';        
        
        // 文章列表
        $list = Db::name('Posts')
        ->alias('a')
        ->join('term_relationships b','b.post_id= a.id','LEFT')
        ->where($map)
        ->distinct(true)
        ->order('a.updatetime desc')
        ->field('a.*')
        ->paginate($categoryInfo['page_num'],false,[
            'query'    => ['category'=>$category],
        ]);        
        // 获取分页显示
        $page = $list->render();
        // 模板变量赋值
        $this->assign('list',$list);
        $this->assign('page', $page);
        $this->assign('categoryInfo',$categoryInfo);
        // 输出主题
        return $this->themeFetch($categoryInfo['lists_tpl']);
    }

	/**
	 * 文章详情控制器
	 * @author  tangtanglove <dai_hang_love@126.com>
	 */
    public function detail()
    {
        $id           = input('get.id');
        $category     = input('get.category');
      
        if (empty($id)) {
            return $this->error('参数错误');
        }
        //category为空
        if(empty($category)){
            $info = Db::name('TermRelationships')
            ->alias('a')
            ->join('terms b','b.id=a.term_id','LEFT')
            ->where('a.post_id',$id)
            ->field('b.*')
            ->find();
            if($info){
                $category = Db::name('Terms')->where('id',$info['id'])->value('slug');
            }else{
                return $this->error('分类不存在！');
            }
        }
        if (is_numeric($category)) {
            $map['id'] = $category;
        } else {
            $map['slug'] = $category;
        }
        // 读取数据
        $postInfo = Db::name('Posts')->where(['id'=>$id])->find();
        // 阅读量+1
        Db::name('Posts')->where(['id'=>$id])->setInc('view');
        if (empty($postInfo)) {
            return $this->error('内容不存在！');
        }
        $categoryInfo = Db::name('Terms')->where($map)->find();
        if (empty($categoryInfo)) {
            return $this->error('分类不存在！');
        }
        $subCate  = Db::name('Terms')->where('pid',$categoryInfo['id'])->select();

        $this->assign('subCate',$subCate);        
        // 输出数据
        $this->assign('postInfo',$postInfo);
        $this->assign('categoryInfo',$categoryInfo);
    	// 输出主题
        return $this->themeFetch($categoryInfo['detail_tpl']);
    }

	/**
	 * 文章单页控制器
	 * @author  tangtanglove <dai_hang_love@126.com>
	 */
    public function page()
    {
        $name     = input('get.name');
        if (empty($name)) {
            return $this->error('参数错误');
        }        
        // 读取数据
        $pageInfo = Db::name('Posts')->where(['name'=>$name,'type'=>'page'])->find();
        if (empty($pageInfo)) {
            return $this->error('内容不存在！');
        }
        //子页面
        $page = Db::name('Posts')->where('pid',$pageInfo['id'])->select();
        if($page) {
              $subPage = Db::name('Posts')->where('pid',$pageInfo['id'])->select();
        } else if($pageInfo['pid']!==0){
            $subPage =Db::name('Posts')->where('pid',$pageInfo['pid'])->select();
        } else {
            $subPage = Db::name('Posts')->where('id',$pageInfo['id'])->select();
        }        
        $this->assign('subPage',$subPage);
        $pidInfo = Db::name('Posts')->where('id',$pageInfo['pid'])->find();
        // 读取page页模板
        $page_tpl= find_key_value('posts.form',$pageInfo['uuid']);
        // 输出数据
        $this->assign('pageInfo',$pageInfo);
        $this->assign('pidInfo',$pidInfo);
    	// 输出主题
        if($page_tpl){
           return $this->themeFetch($page_tpl); 
        }else{
            return $this->themeFetch('page');
        }
        
    }
}
