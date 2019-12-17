<%--
  Created by IntelliJ IDEA.
  User: 华
  Date: 2019/12/13
  Time: 21:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div align="center">
        <div>
            <h2 align="center">${noticeList.title}</h2>
        </div>
        <div align="center" style="font-size: 12px;color: #808080">
            ${empList.empName}&nbsp;&nbsp;${noticeList.noticeTime}
        </div>
    </div>
    <br>
    <br>
    <tbody>
        ${noticeList.content}
    </tbody>
</body>
</html>
