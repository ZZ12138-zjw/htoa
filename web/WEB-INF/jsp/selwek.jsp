<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/12/11
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看周报界面</title>
</head>
<body>
    <h2 align="center">宏图软件工作报告</h2>
    <div align="center">
        <c:forEach items="${mlist}" var="mt">
            部门:${mt.depName}&nbsp;&nbsp;&nbsp;&nbsp;
            姓名:${mt.empName}&nbsp;&nbsp;&nbsp;&nbsp;
            时间:${mt.workday}
        </c:forEach>
    </div>
    <table cellspacing="0" cellpadding="0" border="1" style="width: 500px;height: 700px" align="center">
        <tbody>
            <tr style="height: 204px">
                <td rowspan="3" style="width: 30px">
                    <p style="margin: 0;text-align: center">本</p>
                    <p style="margin: 0;text-align: center">&nbsp;</p>
                    <p style="margin: 0;text-align: center">周</p>
                    <p style="margin: 0;text-align: center">&nbsp;</p>
                    <p style="margin: 0;text-align: center">总</p>
                    <p style="margin: 0;text-align: center">&nbsp;</p>
                    <p style="margin: 0;text-align: center">结</p>
                </td>
                <td style="width: 50px">
                    <p style="margin: 0;text-align: center">本</p>
                    <p style="margin: 0;text-align: center">&nbsp;</p>
                    <p style="margin: 0;text-align: center">周</p>
                    <p style="margin: 0;text-align: center">&nbsp;</p>
                    <p style="margin: 0;text-align: center">情</p>
                    <p style="margin: 0;text-align: center">&nbsp;</p>
                    <p style="margin: 0;text-align: center">况</p>
                </td>
                <td>
                    <c:forEach items="${mlist}" var="mt">
                        <p style="margin: 0;text-align: center">${mt.weekCur}</p>
                    </c:forEach>
                </td>
            </tr>
            <tr style="height: 70px">
                <td style="width: 50px">
                    <p style="margin: 0;text-align: center">问题学生</p>
                </td>
                <td>
                    <c:forEach items="${mlist}" var="mt">
                        <p style="margin: 0;text-align: center">${mt.studentQuestion}</p>
                    </c:forEach>
                </td>
            </tr>
            <tr style="height: 85px">
                <td style="width: 50px">
                    <p style="margin: 0;text-align: center">意见建议</p>
                </td>
                <td>
                    <c:forEach items="${mlist}" var="mt">
                        <p style="margin: 0;text-align: center">${mt.idea}</p>
                    </c:forEach>
                </td>
            </tr>
            <tr style="height: 240px">
                <td>
                    <p style="margin: 0;text-align: center">下</p>
                    <p style="margin: 0;text-align: center">&nbsp;</p>
                    <p style="margin: 0;text-align: center">周</p>
                    <p style="margin: 0;text-align: center">&nbsp;</p>
                    <p style="margin: 0;text-align: center">计</p>
                    <p style="margin: 0;text-align: center">&nbsp;</p>
                    <p style="margin: 0;text-align: center">划</p>
                </td>
                <td style="width: 50px">
                    <p style="margin: 0;text-align: center">下</p>
                    <p style="margin: 0;text-align: center">周</p>
                    <p style="margin: 0;text-align: center">计</p>
                    <p style="margin: 0;text-align: center">划</p>
                </td>
                <td>
                    <c:forEach items="${mlist}" var="mt">
                        <p style="margin: 0;text-align: center">${mt.weekNext}</p>
                    </c:forEach>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>
