<%--
  Created by IntelliJ IDEA.
  User: 小燕
  Date: 2019/12/5
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>table模块快速使用</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css" media="all">
</head>
<body>

<table id="demo" lay-filter="test"></table>

<script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#demo'
            ,height: 312
            ,url:'<%=request.getContextPath()%>/student/testdata'
            ,page: true //开启分页
            ,method:'post'
            ,limit:10
            ,cols: [[ //表头
                {checkbox:true}//开启多选框
                ,{field: 'stuName', title: '学生姓名', width:80, sort: true, fixed: 'left'}
                ,{field: 'stuno', title: '学号', width:80}
                ,{field: 'sex', title: '性别', width:80, sort: true}
                ,{field: 'cardid', title: '身份证', width:80}
                ,{field: 'phone', title: '联系方式', width: 177}
                ,{field: 'className', title: '班级名称', width: 80, sort: true}
                ,{field: 'hourName', title: '宿舍房号', width: 80, sort: true}
                ,{field: 'state', title: '学生状态', width: 80}
                ,{field: 'collar', title: '是否领用电脑', width: 135, sort: true}
                ,{field: 'grants', title: '享受助学金', width: 80}
                ,{field: 'computer', title: '是否送电脑', width: 135, sort: true}
                ,{field: 'parents', title: '家长姓名', width: 135, sort: true}
                ,{field: 'parentsphone', title: '家长电话', width: 135, sort: true}
                ,{field: 'qkMoney', title: '欠款金额', width: 135, sort: true}
            ]]
            ,limits: [5,10,20,50]
        });
    });
</script>
</body>
</html>
