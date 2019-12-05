<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/12/5
  Time: 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传流程图</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/flow/touploadPro" method="post" enctype="multipart/form-data">
        <input type="file" name="fbfile"/>
        <input type="submit" value="上传"/>
    </form>
</body>
</html>
