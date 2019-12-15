<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/12/5
  Time: 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>流程列表</title>
    <jsp:include page="top.jsp"></jsp:include>
</head>
<body>
<div>
    <button type="button" class="layui-btn" onclick="window.location.href='${pageContext.request.contextPath}/process/uploadPro';">
        <i class="layui-icon">&#xe608;</i> 上传流程图
    </button>
    <table class="layui-table">
        <thead>
        <tr>
            <th>流程编号</th>
            <th>流程名称</th>
            <th>流程KEY</th>
            <th>查看流程图</th>
            <th>下载流程图</th>
            <th>删除流程图</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${processList}" var="pl">
            <tr>
                <td>${pl.id }</td>
                <td>${pl.name }</td>
                <td>${pl.key }</td>
                <td>
                    <a href="${pageContext.request.contextPath}/process/selPro?did=${pl.deploymentId}&imageName=${pl.diagramResourceName}" target="_blank" class="layui-btn layui-btn-sm">
                        查看流程图
                    </a>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/process/downloadPro?id=${pl.id}" class="layui-btn layui-btn-sm">
                        下载流程图
                    </a>
                </td>
                <td>
                    <a href="<%=request.getContextPath()%>/process/delete?id=${pl.deploymentId}" onclick="return confirm('确认删除吗?')" class="layui-btn layui-btn-sm">
                        删除流程
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
