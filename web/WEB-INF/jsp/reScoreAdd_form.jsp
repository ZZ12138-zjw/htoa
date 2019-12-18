<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 小燕
  Date: 2019/12/17
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/font.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <script src="<%=request.getContextPath()%>/laydate/laydate.js"></script> <!-- 改成你的路径 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/laydate/theme/default/laydate.css">
</head>
<body>
<table id="LAY_table_stu_reScore" lay-filter="test" class="layui-table layui-btn-xs"></table>
<script>
    layui.use('table','form',function () {
        var table=layui.table;

        table.render({
            elem:'#LAY_table_stu_reScore'
            ,height:500
            ,url:'<%=request.getContextPath()%>/reScore/loadReScore'
            ,cols:[[
                {field:'stuId',title:'学生编号'}
                ,{field:'stuName',title:'学生姓名'}
                ,{field:'score1',title:'功能完善50',edit:'text'}
                ,{field:'score2',title:'技术难度10',edit:'text'}
                ,{field:'score3',title:'界面完美10',edit:'text'}
                ,{field:'score4',title:'回答问题10',edit:'text'}
                ,{field:'score5',title:'演讲方式10',edit:'text'}
                ,{field:'score6',title:'语言表达10',edit:'text'}
                ,{field:'score7',title:'总分100',edit:'text'}
                ,{field:'remark',title:'备注',edit:'text'}
            ]]
        })

    })
</script>
</body>

</html>
