
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>查看批注</title>
    <jsp:include page="top.jsp"/>
  </head>

  <body>
  <div class="x-body">
      <table>
          <tr>
              <th>审批人</th>
              <th>批注</th>
              <th>审批时间</th>
          </tr>
          <c:forEach items="${commentList}" var="c">
          <tr align="center">
              <td>${c.userId}</td>
              <td>${c.fullMessage}</td>
              <td>${c.time}</td>
          </tr>
          </c:forEach>
      </table>
  </div>


    <script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>
  </body>


</html>