<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 小燕
  Date: 2019/12/17
  Time: 8:50
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
<div class="layui-row">
    <fieldset class="layui-elem-field layuimini-search">
        <legend>搜索信息</legend>
        <div style="margin: 10px 10px 10px 10px">
            <form class="layui-form layui-form-pane" action="">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">项目名称</label>
                        <div class="layui-input-inline">
                            <select name="projectId">
                                <option value="">--不选择--</option>
                                <c:forEach items="${projects}" var="project">
                                    <option value="${project.projectId}">${project.proName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">班级名称</label>
                        <div class="layui-input-inline">
                            <select name="classid">
                                <option value="" class="layui-input">--未选择--</option>
                                <c:forEach items="${requestScope.classes}" var="cla">
                                    <option value="${cla.classId}">${cla.className}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">评分人员</label>
                        <div class="layui-input-inline">
                            <select name="empId">
                                <option value="" class="layui-input">--未选择--</option>
                                <c:forEach items="${requestScope.emps}" var="emp">
                                    <option value="${emp.empId}">${emp.empName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <a class="layui-btn" lay-submit="" lay-filter="data-search-btn">搜索</a>
                    </div>
                </div>
            </form>
        </div>
    </fieldset>
</div>
<div class="layui-row">
    <table id="LAY_table_classes" lay-filter="test" class="layui-table layui-btn-xs"></table>
</div>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
<script>
    layui.use('table',function () {
        var table = layui.table;
        var form = layui.form;

        table.render({
            elem:'#LAY_table_classes'
            ,height:500
            ,url:'<%=request.getContextPath()%>/reScore/loadData'
            ,page:true
            ,method:'post'
            ,limit:10
            ,cols:[[
                {field:'replyId',title:'编号',width:60}
                ,{field:'stuName',title:'学生姓名',width:80}
                ,{field:'classid',title:'班级',width:120,templet:function (d) {
                        <c:forEach items="${classes}" var="cla">
                            if(d.classid == ${cla.classId}){
                                return "${cla.className}";
                            }
                        </c:forEach>
                    }}
                ,{field:'proName',title:'项目名称',width:150}
                ,{field:'score1',title:'功能完善50',width:95}
                ,{field:'score2',title:'技术难度10',width:95}
                ,{field:'score3',title:'界面完美10',width:95}
                ,{field:'score4',title:'回答问题10',width:95}
                ,{field:'score5',title:'演示方法10',width:95}
                ,{field:'score6',title:'语言表达10',width:95}
                ,{field:'score7',title:'总分100',width:90}
                ,{field:'remark',title:'备注',width:100}
            ]]
            ,id:'testReload'
        });
        form.on('submit(data-search-btn)',function (data) {
            table.reload('testReload',{
                page:{
                    curr:1
                }
                ,where:{
                    projectId:data.field.projectId,
                    classid:data.field.classid,
                    empId:data.field.empId
                }
            },'data');
            return false;
        })
    })
</script>
</body>
</html>
