<%--
  Created by IntelliJ IDEA.
  User: 华
  Date: 2019/12/19
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="top.jsp"></jsp:include>
</head>
<body>
<table  class="layui-hide" id="demo"></table>
<div>
    宿舍总人数:${count}
</div>
<script type="text/javascript">
    layui.use('table',function (){
        var table = layui.table;

        table.render({
            elem:"#demo",
            cols:[[ //标题栏
                {field: 'hourName', title: '宿舍房号', width: 120,sort: true}
                ,{field: 'className', title: '所在班级', width: 120}
                ,{field: 'stuName', title: '学生姓名', minWidth: 150}
                ,{field: 'phone', title: '学生电话号码', minWidth: 160}
            ]],
            data:${HourStudentList},
            even: true
        })
    })
</script>
</body>
</html>
