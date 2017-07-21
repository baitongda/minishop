<?php
// +----------------------------------------------------------------------
// | Minishop [ Easy to handle for Micro businesses ]
// +----------------------------------------------------------------------
// | Copyright (c) 2016 http://www.qasl.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: tangtanglove <dai_hang_love@126.com> <http://www.ixiaoquan.com>
// +----------------------------------------------------------------------

use think\Db;

/**
 * 系统公共库文件
 * 主要定义系统公共函数库
 */

/**
 * 执行自动加载方法
 * @author tangtanglove <dai_hang_love@126.com>
 */
autoload_function(ROOT_PATH.'application/common/function');

/**
 * 自动加载方法
 * @author tangtanglove <dai_hang_love@126.com>
 */
function autoload_function($path)
{
    $dir  = array();
    $file = array();
    recursion_dir($path,$dir,$file);
    foreach ($file as $key => $value) {
        if (file_exists($value)) {
            require_once($value);
        }
    }
    if(is_file(ROOT_PATH . 'data/install.lock')){
        // 加载主题里的方法
        $where['collection'] = 'indextheme';
        $theme_path = Db::name('KeyValue')->where($where)->value('value');        
        if (file_exists(ROOT_PATH.'themes/'.$theme_path.'/functions.php')) {
            require_once(ROOT_PATH.'themes/'.$theme_path.'/functions.php');
        }
    }
}

/*
* 获取文件&文件夹列表(支持文件夹层级)
* path : 文件夹 $dir ——返回的文件夹array files ——返回的文件array 
* $deepest 是否完整递归；$deep 递归层级
*/
function recursion_dir($path,&$dir,&$file,$deepest=-1,$deep=0){
    $path = rtrim($path,'/').'/';
    if (!is_array($file)) $file=array();
    if (!is_array($dir)) $dir=array();
    if (!$dh = opendir($path)) return false;
    while(($val=readdir($dh)) !== false){
        if ($val=='.' || $val=='..') continue;
        $value = strval($path.$val);
        if (is_file($value)){
            $file[] = $value;
        }else if(is_dir($value)){
            $dir[]=$value;
            if ($deepest==-1 || $deep<$deepest){
                recursion_dir($value."/",$dir,$file,$deepest,$deep+1);
            }
        }
    }
    closedir($dh);
    return true;
}

//云打印机.除actionprint()函数，其他函数请勿更改
/**
 * 生成签名sign
 * @param  array $params 参数
 * @param  string $apiKey API密钥
 * @param  string $msign 打印机密钥
 * @return   string sign
 */
 function generateSign($params, $apiKey,$msign)
{
    //所有请求参数按照字母先后顺序排
    ksort($params);
    //定义字符串开始所包括的字符串
    $stringToBeSigned = $apiKey;
    //把所有参数名和参数值串在一起
    foreach ($params as $k => $v)
    {
        $stringToBeSigned .= urldecode($k.$v);
    }
    unset($k, $v);
    //定义字符串结尾所包括的字符串
    $stringToBeSigned .= $msign;
    //使用MD5进行加密，再转化成大写
    return strtoupper(md5($stringToBeSigned));
}
/**
 * 生成字符串参数
 * @param array $param 参数
 * @return  string        参数字符串
 */
 function getStr($param)
{
    $str = '';
    foreach ($param as $key => $value) {
        $str=$str.$key.'='.$value.'&';
    }
    $str = rtrim($str,'&');
    return $str;
}
/**
 * 打印接口
 * @param  int $partner     用户ID
 * @param  string $machine_code 打印机终端号
 * @param  string $content      打印内容
 * @param  string $apiKey       API密钥
 * @param  string $msign       打印机密钥
 */
 function  action_print($partner,$machine_code,$content,$apiKey,$msign)
{
    $param = array(
        "partner"=>$partner,
        'machine_code'=>$machine_code,
        'time'=>time(),
        );
    //获取签名
    $param['sign'] = generateSign($param,$apiKey,$msign);
    $param['content'] = $content;
    $str = getStr($param);
    return sendCmd('http://open.10ss.net:8888',$str);
}
/**
 *  添加打印机
 * @param  int $partner     用户ID1       
 * @param  string $machine_code 打印机终端号
 * @param  string $username     用户名
 * @param  string $printname    打印机名称
 * @param  string $mobilephone  打印机卡号
 * @param  string $apiKey       API密钥
 * @param  string $msign       打印机密钥
 */
 function action_addprint($partner,$machine_code,$username,$printname,$mobilephone,$apiKey,$msign)
{
    $param = array(
        'partner'=>$partner,
        'machine_code'=>$machine_code,
        'username'=>$username,
        'printname'=>$printname,
        'mobilephone'=>$mobilephone,
        );
    $param['sign'] = generateSign($param,$apiKey,$msign);
    $param['msign'] = $msign;
    $str = getStr($param);
    return sendCmd('http://open.10ss.net:8888/addprint.php',$str);
}
/**
 * 删除打印机
 * @param  int $partner      用户ID
 * @param  string $machine_code 打印机终端号
 * @param  string $apiKey       API密钥
 * @param  string $msign        打印机密钥
 */
 function action_removeprinter($partner,$machine_code,$apiKey,$msign)
{
    $param = array(
        'partner'=>$partner,
        'machine_code'=>$machine_code,
        );
    $param['sign'] = generateSign($param,$apiKey,$msign);
    $str = getStr($param);
    return sendCmd('http://open.10ss.net:8888/removeprint.php',$str);
}
/**
 * 发起请求
 * @param  string $url  请求地址
 * @param  string $data 请求数据包
 * @return   string      请求返回数据
 */
 function sendCmd($url,$data)
{
    $curl = curl_init(); // 启动一个CURL会话      
    curl_setopt($curl, CURLOPT_URL, $url); // 要访问的地址                  
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0); // 对认证证书来源的检测    
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 2); // 从证书中检查SSL加密算法是否存在      
    curl_setopt($curl, CURLOPT_HTTPHEADER, array('Expect:')); //解决数据包大不能提交     
    curl_setopt($curl, CURLOPT_FOLLOWLOCATION, 1); // 使用自动跳转      
    curl_setopt($curl, CURLOPT_AUTOREFERER, 1); // 自动设置Referer      
    curl_setopt($curl, CURLOPT_POST, 1); // 发送一个常规的Post请求      
    curl_setopt($curl, CURLOPT_POSTFIELDS, $data); // Post提交的数据包      
    curl_setopt($curl, CURLOPT_TIMEOUT, 30); // 设置超时限制防止死循     
    curl_setopt($curl, CURLOPT_HEADER, 0); // 显示返回的Header区域内容      
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1); // 获取的信息以文件流的形式返回 
           
    $tmpInfo = curl_exec($curl); // 执行操作      
    if (curl_errno($curl)) {      
       echo 'Errno'.curl_error($curl);      
    }      
    curl_close($curl); // 关键CURL会话      
    return $tmpInfo; // 返回数据      
}
 /**
 * 执行易联云打印机，编码格式只可为utf-8
 * k1、k2在<table></table>排版中会出现略微错版，易连云官方暂未修复
 * @param string $header     头部信息
 * @param string $order      订单编号
 * @param string $goodslists 商品列表
 * @param string $paytype    支付方式
 * @return 标准json字符串    返回状态
 * @author 天行健 <764617706@qq.com>
 * $print 返回JSON数据的状态码
 * state:"1","id":"1234"  数据提交成功，1234代表单号，打印完成上报时用、详情请查看：打印完成自动上报接口文档
 * state:"2"   提交时间超时。验证你所提交的时间戳超过3分钟后拒绝接受
 * state:"3"   参数有误
 * state:"4"   sign加密验证失败
 */
function actionprint($header,$order,$paytype,$goodslists){ 
    $res    = Db::name('Orders')->where('id',$goodslists['0']['order_id'])->find();
    $time = date("Y-m-d H:i",time());
    $print_error = '订单打印失败';
    $totalnum    = '总量';
    $totalprice  = '合计';   
    $total_num   = '';//总量
    $total_price = '';//合计
    $pay         = '支付类型';
    $order_no    = '订单号';   
    $address     = '收货地址';
    $mobile      = '联系电话';
    $order_time  = '下单时间';
    $consignee_name = '会员名';

    $Y_consignee_name = $res['consignee_name'];
    $Y_mobile         = $res['mobile'];
    $Y_address        = $res['address'];
    $Y_order_no       = $res['order_no'];
    $con=null;
    //循环遍历数组
    foreach($goodslists as $k=>$val){
        $goods = $val['name'];
        $number = $val['num'];
        $price = $val['price'];
        $temp="<tr><td>$goods</td><td>$number</td><td>$price</td></tr>";
        $con=$con.$temp;
        $total_num += $val['num'];
        $total_price += $val['num']*$val['price'];
    }
    //打印头部
    $con_head = '<tr><td>品名</td><td>数量</td><td>单价</td></tr>';  
    $con = $con_head.$con;
    //格式化要打印的内容
    $content =  "<center>@@2$header</center>$consignee_name:$Y_consignee_name\n$order_no:$Y_order_no\n<table>$con</table>$totalnum:$total_num  $totalprice:$total_price\n$pay:$paytype\n$mobile:$Y_mobile\n$address:$Y_address\n$order_time:$time";
    //确认所有接口信息填写完整时执行打印操作
    if(config('print_partner')&&config('print_machine_code')&&config('print_apiKey')&&config('print_msign')){
        $print_partner =intval(config('print_partner'));
        $print = action_print($print_partner,
                              config('print_machine_code'),
                              $content,
                              config('print_apiKey'),
                              config('print_msign')); 
        $yprint = json_decode($print);
        //state的状态为1，打印成功,不为1，发送邮件通知管理员
        if($yprint['state'] != 1){
            OrderMail($Y_order_no,config('mail_address'),$time,$print_error,$print_error);
        }
        return   $print;
    }
}


/**
 * 系统邮件发送函数
 * @param string $to 接收邮件者邮箱
 * @param string $subject 邮件主题
 * @param string $body 邮件内容
 * @param string $attachment 附件列表
 * @return boolean
 */
function SendMail($title,$username,$time,$email,$url)
{
    $config = config('email');
    import('org.util.phpmailer.PHPMailer');
    $mail = new \PHPMailer;
    $mail->CharSet = 'utf-8';//设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置，否则乱码，
    $mail->IsSMTP();//设定使用SMTP服务
    $mail->SMTPSecure = 'ssl'; 
    $mail->SMTPDebug = 1;//关闭SMTP调试功能//1=errors and messages//2=messages only
    $mail->SMTPAuth  = true;//启用SMTP验证功能
    $mail->Port      = $config['mail_port'];  // SMTP服务器的端口号
    $mail->Host      = $config['mail_smtp'];
    $mail->AddAddress($email);//添加收件人地址，
    $mail->Body      = "亲爱的" . $username . "：<br/>您在" . $time . "提交了通过邮箱".$email."找回密码请求。请点击下面的链接重置密码（按钮24小时内有效）。<br/><a href='" . $url . "' target='_blank'>" . $url . "</a><br/>如果以上链接无法点击，请将它复制到你的浏览器地址栏中进入访问。<br/>如果您没有提交找回密码请求，请忽略此邮件。"; //设置邮件正文
    $mail->From      = config('mail_address');//设置发件人名字
    $mail->FromName  = '管理员团队';//设置发件人名字
    $mail->Subject   = $title;//设置邮件标题
    $mail->Username  = config('mail_loginname');//设置用户名和密码
    $mail->Password  = config('mail_password');
    return($mail->Send());
} 
/**
 * 订单打印失败发送邮件函数
 * @param string $to 接收邮件者邮箱
 * @param string $subject 邮件主题
 * @param string $body 邮件内容
 * @param string $attachment 附件列表
 * @return boolean
 */
function OrderMail($out_trade_no,$email,$time,$print_error)
{
    $config = config('email');
    import('org.util.phpmailer.PHPMailer');
    $mail = new \PHPMailer;
    $mail->CharSet = 'utf-8';//设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置，否则乱码，
    $mail->IsSMTP();//设定使用SMTP服务
    $mail->SMTPSecure = 'ssl'; 
    $mail->SMTPDebug = 1;//关闭SMTP调试功能//1=errors and messages//2=messages only
    $mail->SMTPAuth  = true;//启用SMTP验证功能
    $mail->Port      = $config['mail_port'];  // SMTP服务器的端口号
    $mail->Host      = $config['mail_smtp'];
    $mail->AddAddress($email);//添加收件人地址，
    $mail->Body      = "亲爱的管理员：<br/>顾客在" . $time . "提交的订单:".$out_trade_no."没有打印成功，请进入后台核实，以免漏单"; //设置邮件正文
    $mail->From      = config('mail_address');//设置发件人名字
    $mail->FromName  = '管理员团队';//设置发件人名字
    $mail->Subject   = $print_error;//设置邮件标题
    $mail->Username  = config('mail_loginname');//设置用户名和密码
    $mail->Password  = config('mail_password');
    return($mail->Send());
} 
