<%--
  Created by IntelliJ IDEA.
  User: LaIWeiChun
  Date: 2019/12/17
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<! DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>个人资料</title>
    <jsp:include page="top.jsp"></jsp:include>
</head>
<body>
    <table width="400" class="layui-table">
        <tr align="center">
            <td colspan="4">员工信息</td>
        </tr>
        <tr>
            <td>员工姓名</td>
            <td>${empVo.empName}</td>
            <td>部门名称</td>
            <td>${empVo.deptId}</td>
        </tr>
        <tr>
            <td>出生日期</td>
            <td>${empVo.birthday}</td>
            <td>身份证号</td>
            <td>${empVo.cardno}</td>
        </tr>
        <tr>
            <td>籍贯</td>
            <td>${empVo.nation}</td>
            <td>手机号码</td>
            <td>${empVo.phone}</td>
        </tr>

        <tr align="center" >
            <td colspan="4">工作经历</td>
        </tr>
        <c:forEach items="${jobVos}" var="j">
            <tr>
                <td>公司名称</td>
                <td>${j.companyName}</td>
                <td>岗位</td>
                <td>${j.degree}</td>
            </tr>
            <tr>
                <td>入职时间</td>
                <td>${j.startDate}</td>
                <td>离职时间</td>
                <td>${j.endDate}</td>
            </tr>
        </c:forEach>
        <tr align="center" >
            <td colspan="4">教育背景</td>
        </tr>
        <c:forEach items="${educationVos}" var="e">
            <tr>
                <td>学校名称</td>
                <td>${e.collegeName}</td>
                <td>学历</td>
                <td>${e.degree}</td>
            </tr>
            <tr>
                <td>入校时间</td>
                <td>${e.startDate}</td>
                <td>毕业时间</td>
                <td>${e.endDate}</td>
            </tr>
        </c:forEach>
        <tr align="center" >
            <td colspan="4">家庭联系信息</td>
        </tr>
        <c:forEach items="${familyInfoVos}" var="f">
            <tr>
                <td>联系人名称</td>
                <td>${f.contactName}</td>
                <td>与员工的关系</td>
                <td>${f.relationship}</td>
            </tr>
            <tr>
                <td>联系电话</td>
                <td colspan="3">${f.phone}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
