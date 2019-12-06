<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/12/5
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传文件资料</title>
</head>
<body>
    <form action="<%=request.getContextPath()%>/doc/touploadoc" method="post" enctype="multipart/form-data">
        <input type="file" name="fbfile"/>
        备注:<textarea rows="3" cols="8"></textarea>
        <br/>
        <input type="submit" value="上传"/>
    </form>
</body>
</html>
