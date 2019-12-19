<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理-登陆</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/stuLogin.css">
    <script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/img_ver.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css" media="all">
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        html, body {width: 100%;height: 100%;overflow: hidden}
        body {background: #009688;}
        .bxs-row {
            margin-bottom:12px;
        }
        .layui-container{
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
        .logo-box {
            width:404px;
            margin:120px auto;
            border:1px solid #e5e5e5;
            border-radius:4px;
            box-shadow:0 4px 18px rgba(0,0,0,0.2);
            position:relative;
            height:360px;
            background-color: #fff;

        }
        .login {
            position:absolute;
            width:320px;left:0;
            top:0;
            padding: 42px 42px 36px;
            transition:all 0.8s;
            background-color: #fff;
            border: 1px solid #fff;
            border-radius: 3px;
        }
        .username,.password,.btn {
            height: 44px;
            width: 100%;
            padding: 0 10px;
            border: 1px solid #9da3a6;
            background: #fff;
            text-overflow: ellipsis;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -khtml-border-radius: 4px;
            border-radius: 4px;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
            color: #000;
            font-size: 1em;
            font-family: Helvetica,Arial,sans-serif;
            font-weight: 400;
            direction: ltr;
            font-size:13px;
        }
        .submit {
            background-color: #00968a;
            color:#fff;
            border:1px solid #00968a;
        }
        .submit:hover {
            background-color:#005ea6;
        }
        .verBox {
            position:absolute;
            width:100%;
            text-align:center;
            left:404px;
            top:0;
            opacity:0;
            transition:all 0.8s;
            padding-top:55px;
        }
        .err {
            margin:12px 0 0;
            line-height:12px;
            height:12px;
            font-size:12px;
            color:red;
        }
    </style>
</head>
<body>
<div class="layui-container">
    <div class="logo-box">
        <div class="login" >
            <div class="bxs-row" style="text-align:center;">
                <img id="logo" src="${pageContext.request.contextPath}/images/logo.jpg" style="width:72px;"><span class="tips" style="color:red;">忍住不哭来段口技</span>
            </div>
            <div class="layui-form-item">
                <label class="layui-icon layui-icon-username" for="username"></label>
                <input type="text" name="username" id="username" lay-verify="required|account" placeholder="用户名或者邮箱"  class="layui-input" >
            </div>
            <div class="layui-form-item">
                <label class="layui-icon layui-icon-password" for="password"></label>
                <input type="password" name="password" id="password" lay-verify="required|password" placeholder="密码"  class="layui-input" >
            </div>
            <div class="bxs-row">
                <input type="submit" class="submit btn" value="登录">
            </div>
        </div>
        <div class="verBox">
            <div id="imgVer" style="display:inline-block;"></div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.4.1.min.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/lib/jq-module/jquery.particleground.min.js" charset="utf-8"></script>
<script>
    layui.use(['form'], function () {
        var form = layui.form,
            layer = layui.layer;
        // 登录过期的时候，跳出ifram框架
        if (top.location != self.location) top.location = self.location;

        // 粒子线条背景
        $(document).ready(function(){
            $('.login-box').particleground({
                dotColor:'#5cbdaa',
                lineColor:'#5cbdaa'
            });
        });

    });
</script>
<script>


    imgVer({
        el:'$("#imgVer")',
        width:'260',
        height:'116',
        img:[
            '${pageContext.request.contextPath}/images/ver.png',
            '${pageContext.request.contextPath}/images/ver-1.png',
            '${pageContext.request.contextPath}/images/ver-2.png',
            '${pageContext.request.contextPath}/images/ver-3.png'
        ],
        success:function () {
            //alert('执行登录函数');
            $(".login").css({
                "left":"0",
                "opacity":"1"
            });
            $(".verBox").css({
                "left":"404px",
                "opacity":"0"
            });
            $.post('${pageContext.request.contextPath}/stuLogin',{
                phone:$("#username").val(),
                password:$("#password").val()
            },function (data) {
                if ('failed'==data){
                    $(".tips").html('你是不是不知道账号密码！？？？');
                    $("#logo").attr("src",'${pageContext.request.contextPath}/images/login-err.png')
                }else {
                    location.href='${pageContext.request.contextPath}/toStu';
                }
            },'text')
        },
        error:function () {
            //alert('错误什么都不执行')
        }
    });

    $(".submit").on('click',function () {
        if($("#username").val() == '') {
            // $(".err-username").html('杂种！！你用户名呢！？？？');
            $(".tips").html('老兄！！你用户名呢！？？？');
            $("#logo").attr("src",'${pageContext.request.contextPath}/images/null-username.jpg')
        } else if($("#password").val() == '') {
            // $(".err-password").html('畜生！！你密码呢！？？？');
            $(".tips").html('老兄！！你密码呢！？？？');
            $("#logo").attr("src",'${pageContext.request.contextPath}/images/null-password.jpg')
        } else {
            $(".login").css({
                "left":"-404px",
                "opacity":"0"
            });
            $(".verBox").css({
                "left":"0",
                "opacity":"1"
            })
        }
    })

</script>
</body>
</html>