<%--
  Created by IntelliJ IDEA.
  User: 华
  Date: 2019/12/4
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="top.jsp"></jsp:include>
</head>
<body>
    <div>
        <table class="layui-table">
            <thead algin="center">
                <tr>
                    <th>编号</th>
                    <th>类别名称</th>
                    <th>说明</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>专业课</td>
                    <td>宏图软件专业课程</td>
                    <td>
                        <a title="编辑"  onclick="" href="javascript:;">
                            <i class="layui-icon">&#xe642;</i>
                        </a>
                        <a title="删除" onclick="" href="javascript:;">
                            <i class="layui-icon">&#xe640;</i>
                        </a>
                    </td>
                </tr>
            </tbody>
        </table>
        <button class="layui-btn" onclick="x_admin_show('添加课程类别','${pageContext.request.contextPath}/coursetype/tocurriculum_add')"><i class="layui-icon"></i>添加</button>
    </div>

</body>
</html>
