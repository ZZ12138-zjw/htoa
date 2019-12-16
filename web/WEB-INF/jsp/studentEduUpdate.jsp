<%--
  Created by IntelliJ IDEA.
  User: 小燕
  Date: 2019/12/10
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/font.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <script src="<%=request.getContextPath()%>/laydate/laydate.js"></script> <!-- 改成你的路径 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/laydate/theme/default/laydate.css">
</head>
<body>
<div class="x-body">
    <form class="layui-form">
        <div class="layui-form-item">
            <input type="hidden" value="${stuEdu.stuId}" name="stuId" class="layui-inputs"/>
            <input type="hidden" value="${stuEdu.eduid}" name="eduid" class="layui-input"/>
            <label for="school" class="layui-form-label">
                <span class="x-red">*</span>就读学校
            </label>
            <div class="layui-input-inline">
                <input type="text" id="school" name="school" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${stuEdu.school}">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>输入学生就读学校
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>开始时间</label>
            <div class="layui-input-inline">
                <input type="text" id="begindate" name="time1" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${stuEdu.begindate}">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>结束时间</label>
            <div class="layui-input-inline">
                <input type="text" id="enddate" name="time2" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${stuEdu.enddate}">
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
    var laydate=layui.laydate;
    //执行一个laydate实例
    laydate.render({
        elem: '#begindate',//指定元素
        type:'datetime'
    });
    laydate.render({
        elem: '#enddate', //指定元素
        type:'datetime'
    });
</script>
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
                url:'${pageContext.request.contextPath}/other/stuEdu/update',
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
                            window.parent.location.reload(); //修改成功后刷新父界面
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
