<%--
  Created by IntelliJ IDEA.
  User: 小燕
  Date: 2019/12/16
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/lib/layui/css/layui.css" media="all">
</head>
<body>
<table class="layui-table" layui-filter="students" id="students" style="align-content: center"></table>
<script>
    layui.use('table',function () {
        var table = layui.table;
        table.render({
            elem:'#students'
            ,height:500
            ,url:'<%=request.getContextPath()%>/cla/loadStu?classId=<%=request.getAttribute("classId")%>'
            ,cols:[[//标题栏
                {align:'center',title:'共:${persents}人',colspan:4}
                ],[
                {field: 'className', title: '班级', width:250}
                ,{field: 'stuName', title: '学生姓名', width:90}
                ,{field: 'sex', title: '性别', width:80}
                ,{field: 'phone', title: '联系电话', width:120}
            ]]
        })
    })
</script>
</body>
</html>
