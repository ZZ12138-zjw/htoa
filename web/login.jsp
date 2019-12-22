<%--
  Created by IntelliJ IDEA.
  User: LaIWeiChun
  Date: 2019/12/3
  Time: 13:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>宏图软件后台登录</title>
  <meta name="renderer" content="webkit|ie-comp|ie-stand">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
  <link rel="stylesheet" href="./css/font.css">
  <link rel="stylesheet" href="./css/xadmin.css">
  <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
  <script src="./lib/layui/layui.js" charset="utf-8"></script>
  <script type="text/javascript" src="./js/xadmin.js"></script>
</head>
<body class="login-bg" >

<div class="login">
  <div class="message">宏图软件后台登录</div>
  <div id="darkbannerwrap"></div>

  <form method="post" class="layui-form" >
    <input name="phone" placeholder="用户名"   type="text" lay-verify="required" class="layui-input" >
    <hr class="hr15">
    <input name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
    <hr class="hr15">
    <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
    <hr class="hr20" >
  </form>
</div>

<script>
  $(function(){
    layui.use('form', function(){
      var form = layui.form;

      //监听提交
      form.on('submit(login)', function(data){
        $.post("${pageContext.request.contextPath}/login",{phone:data.field.phone,password:data.field.password},function (callVal) {
              if (callVal=='success'){
                 layer.alert('登录成功',{icon:6},function(){
                   location.href='${pageContext.request.contextPath}/htoa';
                 });
              }else{
                layer.msg('账号异常(请检查账号密码是否正常)',{icon:2});
              }
        },'text');
        return false;
      });
    });
  })


</script>


<!-- 底部结束 -->
<script>
  //百度统计可去掉
  var _hmt = _hmt || [];
  (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
  })();
</script>
</body>
</html>