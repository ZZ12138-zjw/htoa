
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>我的任务</title>
    <jsp:include page="../top.jsp"/>
  </head>
  <body>

  <div class="layui-form">
      <button class="layui-btn" onclick="javascript:location.replace('${pageContext.request.contextPath}/empLeave/to_holidayList')">历史审批</button>
      <table class="layui-table">
          <thead>
          <tr>
              <th>编号</th>
              <th>请假人</th>
              <th>请假时长</th>
              <th>开始时间</th>
              <th>结束时间</th>
              <th>状态</th>
              <th>备注</th>
              <th>操作</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${holidayList}" var="h">
              <tr >
                  <td>${h.holidayId}</td>
                  <td>${h.stuName}</td>
                  <td>${h.holidayDay}</td>
                  <td><fmt:formatDate value="${h.startTime}" pattern="yyyy年MM月dd日"/></td>
                  <td><fmt:formatDate value="${h.endTime}" pattern="yyyy年MM月dd日"/></td>
                  <td>${h.status}</td>
                  <td>${h.remark}</td>
                  <td>
                      <a class="layui-btn layui-btn-xs" lay-event="edit" onclick="
                              x_admin_show('审批','${pageContext.request.contextPath}/stuHoliday/to_empLeaveAdult?taskId=${h.taskId}&hid=${h.holidayId}')">审批</a>
                  </td>
              </tr>
          </c:forEach>
          </tbody>
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