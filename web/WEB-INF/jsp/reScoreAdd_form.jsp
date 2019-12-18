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
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="save"><i class="layui-icon"></i>保存</button>
        <label class="layui-input-inline">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班级:${cla.className}</label>
        <label class="layui-input-inline">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;答辩项目名称:${reScore.proName}</label>
        <label class="layui-input-inline">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录入人员:${emp.empName}</label>
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
            ,url:'<%=request.getContextPath()%>/reScore/loadReScore?classid=${reScoreChecks.classid}'
            ,toolbar:'#toolbarDemo'
            ,method:'post'
            ,cols:[[
                ,{field:'stuId',title:'学生编号'}
                ,{field:'stuName',title:'学生姓名'}
                ,{field:'s1',title:'功能完善50',edit:'text'}
                ,{field:'s2',title:'技术难度10',edit:'text'}
                ,{field:'s3',title:'界面完美10',edit:'text'}
                ,{field:'s4',title:'回答问题10',edit:'text'}
                ,{field:'s5',title:'演示方法10',edit:'text'}
                ,{field:'s6',title:'语言表达10',edit:'text'}
                ,{field:'s7',title:'总分100',edit:'text'}
                ,{field:'rs',title:'备注',edit:'text'}
            ]]
        });
        table.on('toolbar(test)',function (obj) {
            switch (obj.event){
                case 'save':
                    console.log("data-----"+JSON.stringify(table.cache));
                    $.ajax({
                        url:'<%=request.getContextPath()%>/reScore/addStuReScore',
                        type:'post',
                        dataType:'json',
                        data:{
                            reScoreList:JSON.stringify(table.cache.LAY_table_stu_reScore),
                            empId:'${reScoreChecks.empId}',
                            projectId:'${reScoreChecks.projectId}'
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
                        }
                    })
                    break;
            }
        })
    })
</script>
</body>

</html>
