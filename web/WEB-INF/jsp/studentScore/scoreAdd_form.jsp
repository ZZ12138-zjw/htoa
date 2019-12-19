<%--
  Created by IntelliJ IDEA.
  User: 小燕
  Date: 2019/12/18
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../top.jsp"></jsp:include>
    <script src="<%=request.getContextPath()%>/laydate/laydate.js"></script> <!-- 改成你的路径 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/laydate/theme/default/laydate.css">
</head>
<body>

<form class="layui-form" action="<%=request.getContextPath()%>/testscore/score_form">
    <div class="layui-form-item">
        <label class="layui-form-label">班级名称</label>
        <div class="layui-input-inline">
            <select name="classid" lay-verify="required">
                <option value="">--未选择--</option>
                <c:forEach items="${classes}" var="cla">
                    <option value="${cla.classId}">${cla.className}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">课程名称</label>
        <div class="layui-input-inline">
            <select name="courseId" lay-verify="required">
                <option value="">--未选择--</option>
                <c:forEach items="${cources}" var="cource">
                    <option value="${cource.courseid}">${cource.courseName}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"><span class="x-red">*</span>考试日期</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input" id="time1" name="time1" placeholder="yyyy-MM-dd">
        </div>
        <label class="layui-form-label"><span class="x-red">*</span>选择开始时间</label>
        <div class="layui-input-inline">
            <input type="text" class="layui-input" id="time2"  name="time2" placeholder="HH:mm:ss">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">评分人员</label>
        <div class="layui-input-inline">
            <select name="Empid" lay-verify="required">
                <option value="">--未选择--</option>
                <c:forEach items="${emps}" var="emp">
                    <option value="${emp.empId}">${emp.empName}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">考试类型</label>
        <div class="layui-input-inline">
            <select name="testType" lay-verify="required">
                <option value="">--未选择--</option>
                <c:forEach items="${types}" var="type">
                    <option value="${type.typeId}">${type.typeName}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">在读学期</label>
        <div class="layui-input-inline">
            <select name="termid" lay-verify="required">
                <option value="">--未选择--</option>
                <c:forEach items="${terms}" var="term">
                    <option value="${term.termid}">${term.termName}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
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
</body>
</html>
