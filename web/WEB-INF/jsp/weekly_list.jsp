<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/12/9
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>周报管理</title>
    <jsp:include page="top.jsp"></jsp:include>
</head>
<body>
    <div class="layui-row">
        <fieldset class="layui-elem-field layuimini-search">
        <legend>搜索信息</legend>
        <div style="margin: 10px">
        <form class="layui-form layui-form-pane">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">部门名称</label>
                    <div class="layui-input-inline"  >
                        <select name="depid" id="selectDep">
                            <option value="">请选择</option>
                            <c:forEach items="${depVos}" var="deps">
                                <option value="${deps.depid}">${deps.depName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label">员工姓名</label>
                    <div class="layui-input-inline">
                        <input name="empName" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label">开始日</label>
                    <div class="layui-input-inline">
                        <input name="startDay" autocomplete="off" class="layui-input" id="test1">
                    </div>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label">结束日</label>
                    <div class="layui-input-inline">
                        <input name="endDay" autocomplete="off" class="layui-input" id="test2">
                    </div>
                </div>

                <div class="layui-inline">
                    <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                </div>
            </div>
        </form>
        </div>
        </fieldset>
    </div>

    <div class="layui-row">
        <table class="layui-hide" id="idTest" lay-filter="complainList"></table>
    </div>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="sel">查看周报</a>
    </script>

    <script>
        layui.use('laydate',function () {
           var laydate = layui.laydate;

           laydate.render({
              elem:'#test1'
           });
            laydate.render({
                elem:'#test2'
            });
        });

        layui.use(['table','form','layer'],function () {
            var table = layui.table,
                form = layui.form,
                layer = layui.layer;

            table.render({
                id:"idTest"
                ,elem: '#idTest'
                ,url:'${pageContext.request.contextPath}/week/weekList'
                ,page: true
                ,method:'post'
                ,limit:10
                ,cols: [
                    [
                        {field:'worklogid',title: '编号'}
                        ,{field:'empName', title: '员工名称'}
                        ,{field:'workday', title: '填写日期', templet:function (row){
                            return createTime(row.workday);
                        }}
                        ,{field:'weekCur', title: '本周情况描述'}
                        ,{field:'studentQuestion',title: '问题学生情况反馈'}
                        ,{field:'idea',title: '意见建议'}
                        ,{field:'weekNext',title: '下周工作计划'}
                        ,{fixed: 'right', title:'操作',toolbar: '#barDemo'}
                    ]
                ]
                ,limits: [5,10,20,50]
            });

            function createTime(v){
                var date = new Date(v);
                var y = date.getFullYear();
                var m = date.getMonth()+1;
                m = m<10?'0'+m:m;
                var d = date.getDate();
                d = d<10?("0"+d):d;
                var str = y+"-"+m+"-"+d;
                return str;
            }

            // 监听搜索操作
            form.on('submit(sreach)', function (data) {
                var result = JSON.stringify(data.field);
                alert(result);
                //执行搜索重载
                table.reload('idTest', {
                    page: {
                        curr: 1
                    }
                    , where: {
                        depid:data.field.depid,
                        empName:data.field.empName,
                        startDay:data.field.startDay,
                        endDay:data.field.endDay
                    }
                    ,text:{none:'无数据'}
                }, 'data');

                return false;
            });

            table.on('tool(complainList)',function (obj) {
                var data = obj.data;
                json = JSON.stringify(data);
                switch(obj.event) {
                    case 'sel':
                        x_admin_show('查看周报','${pageContext.request.contextPath}/myweek/selwek?worklogid='+data.worklogid);
                }
            })

        });
    </script>
</body>
</html>
