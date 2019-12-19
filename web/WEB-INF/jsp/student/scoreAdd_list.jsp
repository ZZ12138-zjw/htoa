<%--
  Created by IntelliJ IDEA.
  User: 小燕
  Date: 2019/12/18
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="save"><i class="layui-icon"></i>保存</button>
        <label class="layui-input-inline">班级:${cla.className}</label>
        <label class="layui-input-inline">&nbsp;&nbsp;&nbsp;&nbsp;考试科目:${course.courseName}</label>
        <label class="layui-input-inline">&nbsp;&nbsp;&nbsp;&nbsp;考试类型:${type.typeName}</label>
        <label class="layui-input-inline">&nbsp;&nbsp;&nbsp;&nbsp;录入人员:${emp.empName}</label>
    </div>
</script>
<div class="layui-row">
    <table id="LAY_table_stu_reScore" lay-filter="test" class="layui-table layui-btn-xs"></table>
</div>
<script>
    layui.use('table',function () {
        var table = layui.table;
        var form = layui.form;

        table.render({
            elem:'#LAY_table_stu_reScore'
            ,height:400
            ,url:'<%=request.getContextPath()%>/testscore/getTableData?classid=${scoreCheck.classid}'
            ,toolbar:'#toolbarDemo'
            ,method:'post'
            ,cols:[[
                {field:'stuId',title:'学生编号'}
                ,{field:'stuName',title:'学生姓名'}
                ,{field:'s1',title:'成绩',edit:'text'}
                ,{field:'s2',title:'补考成绩',edit:'text'}
                ,{field:'rs',title:'备注',edit:'text'}
            ]]
        });
        table.on('toolbar(test)',function (obj) {
            switch (obj.event){
                case 'save':
                    console.log("data-----"+JSON.stringify(table.cache));
                    $.ajax({
                        url:'<%=request.getContextPath()%>/testscore/addScore',
                        type:'post',
                        dataType:'json',
                        data:{
                            tableList:JSON.stringify(table.cache.LAY_table_stu_reScore),
                            empId:'${emp.empId}',
                            courseId:'${scoreCheck.courseId}',
                            testType:'${scoreCheck.testType}',
                            termid:'${scoreCheck.termid}',
                            scoreTime:'${scoreCheck.scoreTime}'
                        },
                        success:function () {
                            layer.alert("保存成功", {icon: 6},function(){
                                // 获得frame索引
                                var index = parent.layer.getFrameIndex(window.name);
                                //关闭当前frame
                                parent.layer.close(index);
                                setTimeout(function () {
                                    window.parent.location.reload(); //修改成功后刷新父界面
                                })
                            });
                        },
                        error:function () {
                            layer.msg("保存失败，请完善信息！")
                        }
                    })
                    break;
            }
        })
    })
</script>
</body>
</html>
