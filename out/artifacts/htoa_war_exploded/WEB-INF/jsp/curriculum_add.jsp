<%--
  Created by IntelliJ IDEA.
  User: 华
  Date: 2019/12/4
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <jsp:include page="top.jsp"></jsp:include>
</head>
<body>
<div class="x-body">
    <form class="layui-form">
        <div class="layui-form-item">
            <label for="username" class="layui-form-label">
                <span class="x-red">*</span>类别名称：
            </label>
            <div class="layui-input-inline">
                <input type="text" id="username" name="vcourseTypeName" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" placeholder="请输入类别名称">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="phone" class="layui-form-label">
                <span class="x-red">*</span>说明：
            </label>
            <div class="layui-input-inline">
                <input type="text" id="phone" name="remark" required="" lay-verify="phone"
                       autocomplete="off" class="layui-input" placeholder="请输入备注">
            </div>
        </div>
        <div class="layui-form-item">
            <button  class="layui-btn" lay-filter="add" lay-submit="">
                保存
            </button>
        </div>
    </form>
</div>
</body>
</html>
