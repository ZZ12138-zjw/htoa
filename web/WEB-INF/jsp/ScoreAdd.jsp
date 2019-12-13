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
    <script src="<%=request.getContextPath()%>/laydate/laydate.js"></script> <!-- 改成你的路径 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/laydate/theme/default/laydate.css">
</head>
<body>
<div class="x-body">
    <form class="layui-form">
        <input type="hidden" value="<%=request.getAttribute("stuId")%>" name="stuid"/>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>课程名称</label>
            <div class="layui-input-inline">
                <select name="courseId" lay-verify="required">
                    <option value="" selected>--请选择课程名称--</option>
                    <c:forEach var="course" items="${requestScope.courses}">
                        <option value="${course.courseid}">${course.courseName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>考试类型</label>
            <div class="layui-input-inline">
                <select name="testType" lay-verify="required">
                    <option value="" selected>--请选择考试类型--</option>
                    <c:forEach var="type" items="${requestScope.types}">
                        <option value="${type.typeId}">${type.typeName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>考试时间</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="time1" name="time1" placeholder="yyyy-MM-dd">
            </div>
            <label class="layui-form-label"><span class="x-red">*</span>选择开始时间</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="time2"  name="time2" placeholder="HH:mm:ss">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>学生成绩
            </label>
            <div class="layui-input-inline">
                <input type="text" id="score" name="score" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>补考成绩
            </label>
            <div class="layui-input-inline">
                <input type="text" id="rescore" name="rescore" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>学期号</label>
            <div class="layui-input-inline">
                <select name="termid" lay-verify="required">
                    <option value="" selected>--请选择学期--</option>
                    <c:forEach var="term" items="${requestScope.terms}">
                        <option value="${term.termid}">${term.termName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>录入人员</label>
            <div class="layui-input-inline">
                <select name="Empid" lay-verify="required">
                    <option value="" selected>--请选择录入人员--</option>
                    <c:forEach var="emp" items="${requestScope.emps}">
                        <option value="${emp.empId}">${emp.empName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>备注</label>
            <div class="layui-input-inline">
                <input type="text" id="remark" name="remark" required="" lay-verify=""
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
    var laydate=layui.laydate;
    //执行一个laydate实例
    laydate.render({
        elem: '#time1'
    });
    laydate.render({
        elem: '#time2'
        ,type: 'time'
    })
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
        form.on('submit(add)', function(data){
            $.ajax({
                url:'${pageContext.request.contextPath}/student/score/add',
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
                },
                error:function () {
                    layer.alert("增加失败");
                }
            });
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
