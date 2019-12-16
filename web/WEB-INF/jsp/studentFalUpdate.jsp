<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 小燕
  Date: 2019/12/9
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>

</head>
<body>
<div class="x-body">
    <form class="layui-form">
        <input type="hidden" name="stuid" value="${stuFal.stuid}" class="layui-input">
        <input type="hidden" name="familyid" value="${stuFal.familyid}" class="layui-input">
        <div class="layui-form-item">
            <label for="familyname" class="layui-form-label">
                <span class="x-red">*</span>亲属姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="familyname" name="familyname" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${stuFal.familyname}">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>输入学生姓名
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>与学生关系</label>
            <div class="layui-input-inline">
                <select name="relation" lay-verify="">
                    <option value="" selected>--请选择与学生关系--</option>
                    <option value="父女" <c:if test="${stuFal.relation eq '父女'}">selected</c:if>>父女</option>
                    <option value="母女" <c:if test="${stuFal.relation eq '母女'}">selected</c:if>>母女</option>
                    <option value="父子" <c:if test="${stuFal.relation eq '父子'}">selected</c:if>>父子</option>
                    <option value="母子" <c:if test="${stuFal.relation eq '母子'}">selected</c:if>>母子</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="familyphone" class="layui-form-label">
                <span class="x-red">*</span>家长联系电话
            </label>
            <div class="layui-input-inline">
                <input type="text" id="familyphone" name="familyphone" required="" lay-verify="phone"
                       autocomplete="off" class="layui-input" value="${stuFal.familyphone}">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>输入家长联系电话
            </div>
        </div>
        <div class="layui-form-item">
            <button  class="layui-btn" lay-filter="update" lay-submit="">
                修改
            </button>
        </div>
    </form>
</div>
<script>
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;

        //自定义验证规则
        form.verify({
            nikename: function(value){
                if(value.length < 5){
                    return '昵称至少得5个字符啊';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
        });

        //监听提交
        form.on('submit(update)', function(data){
            $.ajax({
                url:'${pageContext.request.contextPath}/other/stuFal/update',
                type:'post',
                data:data.field,
                dataType:'json',
                success:function (data){
                    layer.alert("修改成功", {icon: 6},function(){
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                        setTimeout(function () {
                            window.parent.location.reload(); //新增成功后刷新父界面
                        })
                    });
                },
                error:function () {
                    layer.msg("修改失败");
                }
            });
            return false;
        });
    });
</script>
<script>var _hmt = _hmt || []; (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</body>
</html>
