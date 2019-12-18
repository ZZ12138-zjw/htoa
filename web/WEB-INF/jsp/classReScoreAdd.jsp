<%--
  Created by IntelliJ IDEA.
  User: 小燕
  Date: 2019/12/17
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<form class="layui-form" action="<%=request.getContextPath()%>/reScore/addReScore">
    <div class="layui-form-item">
        <label class="layui-form-label">项目名称</label>
        <div class="layui-input-inline">
            <select name="projectId" lay-verify="required">
                <option value="">--未选择--</option>
                <c:forEach items="${projects}" var="project">
                    <option value="${project.projectId}">${project.proName}</option>
                </c:forEach>
            </select>
        </div>
    </div>
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
        <label class="layui-form-label">评分人员</label>
        <div class="layui-input-inline">
            <select name="empId" lay-verify="required">
                <option value="">--未选择--</option>
                <c:forEach items="${emps}" var="emp">
                    <option value="${emp.empId}">${emp.empName}</option>
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
</body>
</html>
