<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/12/5
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>资料文档</title>
    <jsp:include page="top.jsp"></jsp:include>
</head>
<body>
    <button type="button" class="layui-btn" onclick="window.location.href='${pageContext.request.contextPath}/doc/uploadoc';">
        <i class="layui-icon">&#xe608;</i> 上传文件资料
    </button>
    <table class="layui-table">
        <thead>
        <tr>
            <th>编号</th>
            <th>资料名称</th>
            <th>资料地址</th>
            <th>上传时间</th>
            <th>备注</th>
            <th>上传人员</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${documentList}" var="doc">
            <tr>
                <td>${doc.docId}</td>
                <td>${doc.dataName}</td>
                <td>${doc.url}</td>
                <td>${doc.optime}</td>
                <td>${doc.remark}</td>
                <td>${doc.empId}</td>
                <td>
                    <a title="删除" onclick="del(this,'要删除的id')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                    <a onclick="downloads(this,'10001')" href="javascript:;"  title="下载">
                        <i class="layui-icon">&#xe601;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
<script type="text/javascript ">
    function del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }
</script>
</html>
