<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/6
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>维修管理</title>
    <jsp:include page="top.jsp"></jsp:include>
</head>
<body>
    <table id="demo" lay-filter="test"></table>

    <script>
        layui.use('table', function(){
            var table = layui.table;

            //第一个实例
            table.render({
                elem: '#demo'
                ,height: 312
                ,url: '${pageContext.request.contextPath}/repaircontro/listrepair' //数据接口
                ,page: true //开启分页
                ,cols: [[ //表头
                    {field: 'iD', title: 'ID', width:80, sort: true, fixed: 'left'}
                    ,{field: 'repairMan', title: '报修人', width:100}
                    ,{field: 'repairName', title: '报修名称', width: 100}
                    ,{field: 'repairSort', title: '报修类别', width:100, sort: true}
                    ,{field: 'repairStatus', title: '报修状态', width:100, sort: true}
                    ,{field: 'repairAddress', title: '报修地址', width: 100}
                    ,{field: 'repairDept', title: '部门或班级', width: 100}
                    ,{field: 'startDate', title: '申请时间', width: 120, sort: true}
                    ,{field: 'endDate', title: '结束时间', width: 120, sort: true}
                    ,{field: 'repairIndex', title: '备注', width: 150}
                ]]
            });

        });
    </script>
</body>
</html>
