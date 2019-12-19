<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body>
<div class="x-body">
    <form class="layui-form">
        <input name="studentId" value="<%=request.getAttribute("stuId")%>" type="hidden" class="layui-input"/>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>项目答辩名称
            </label>
            <div class="layui-input-block">
                <select name="projectId" lay-verify="">
                    <option value="" selected>--请选择答辩项目--</option>
                    <c:forEach var="reScore" items="${requestScope.reScores}">
                        <option value="${reScore.projectId}">${reScore.proName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>打分老师</label>
            <div class="layui-input-block">
                <select name="empId" lay-verify="">
                    <option value="" selected>--请选择打分老师--</option>
                    <c:forEach items="${requestScope.emps}" var="emp">
                        <option value="${emp.empId}">${emp.empName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>功能完善(满分50分)</label>
            <div class="layui-input-inline">
                <input type="text" id="score1" name="score1" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>技术难度(满分10分)</label>
            <div class="layui-input-inline">
                <input type="text" id="score2" name="score2" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>界面完美(满分10)</label>
            <div class="layui-input-inline">
                <input type="text" id="score3" name="score3" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>回答问题(满分10)</label>
            <div class="layui-input-inline">
                <input type="text" id="score4" name="score4" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>演示方法(满分10)</label>
            <div class="layui-input-inline">
                <input type="text" id="score5" name="score5" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>语言表达(满分10)</label>
            <div class="layui-input-inline">
                <input type="text" id="score6" name="score6" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>总分(满分100)</label>
            <div class="layui-input-inline">
                <input type="text" id="score7" name="score7" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>备注</label>
            <div class="layui-input-inline">
                <input type="text" id="remark" name="remark" required="" lay-verify="required"
                       autocomplete="off" class="layui-textarea">
            </div>
        </div>
        <div class="layui-form-item">
            <button  class="layui-btn" lay-filter="add" lay-submit="">
                增加
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
        form.on('submit(add)', function(data){
            $.ajax({
                url:'${pageContext.request.contextPath}/student/replyScore/add',
                type:'post',
                data:data.field,
                dataType:'json',
                success:function (data){
                    layer.alert("增加成功", {icon: 6},function(){
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                        setTimeout(function () {
                            window.parent.location.reload(); //新增成功后刷新父界面
                        })
                    });
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
