<?php
// +----------------------------------------------------------------------
// | Minishop [ Easy to handle for Micro businesses ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.qasl.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: tangtanglove <dai_hang_love@126.com> <http://www.ixiaoquan.com>
// +----------------------------------------------------------------------

use think\Db;
use think\config;


/**
 * 公共库文件
 * 主要定义系统公共函数库
 */

/*
读取导航，不区分二级
 */
function get_nav(){
    $data = Db::name('Navigation')->select();
    $li = "";
    foreach ($data as  $value) {
        $li = $li.'<a style="color:#fff" href="'.url($value['url']).'"><li>'.$value['name'].'</li></a>';
    }
    return $li;
}

/**
 * 或取当前用户是否收藏了该商品，返回图标
 * @return [type] [description]
 */
function wap_collection_ico($id){
    if($id){
        $uid = session('wx_user_auth.uid');
        if($uid){
            $info = Db::name('GoodsCollection')->where(['goods_id'=>$id,'uid'=>$uid])->find();
            if($info){
                return 'collection_big.png';
            }else{
                return "collectionone.png";
            }
        }
        return "collectionone.png";
    }else{
        return "collectionone.png";
    }
    
}

//获取返回json
function curl_file_get_contents($durl){  
    $handle = fopen($durl,"rb");
    $content = "";
    while (!feof($handle)) {
        $content .= fread($handle, 10000);
    }
    fclose($handle);
    // $content = json_encode($content);
    $content = (Array)json_decode($content); 
    return $content;
} 



