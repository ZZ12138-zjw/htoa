
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>查看批注</title>
    <jsp:include page="top.jsp"/>
  </head>

  <body>

  <div class="layui-form">
      <table class="layui-table">
          <colgroup>
              <col width="150">
              <col width="150">
              <col width="200">
              <col>
          </colgroup>
          <thead>
          <tr>
              <th>审批人</th>
              <th>批注</th>
              <th>审批时间</th>
          </tr>
          </thead>
          <tbody>
              <c:forEach items="${commentList}" var="c">
                  <tr >
                      <td>${c.empName}</td>
                      <td>${c.fullMessage}</td>
                      <td><fmt:formatDate value="${c.time}" pattern="yyyy年MM月dd日"/></td>
                  </tr>
              </c:forEach>
          </tbody>
      </table>
  </div>
  </body>
</html>