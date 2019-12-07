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

    <%--定义头部按钮--%>
    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-normal" lay-event="add">添加</button>
            <button  class="layui-btn layui-btn-warm" lay-event="allDelete">批量删除</button>
        </div>
    </script>

    <%--定义行按钮--%>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>

    <script>
        layui.use('table', function(){
            var table = layui.table;

            //第一个实例
            table.render({
                elem: '#demo'
                ,height: 460
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
                    ,{field: 'startDate', title: '申请时间', width: 100, sort: true}
                    ,{field: 'endDate', title: '结束时间', width: 100, sort: true}
                    ,{field: 'repairIndex', title: '备注', width: 100}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:110}
                ]],
                toolbar:'#toolbarDemo'
            });


            table.on('toolbar(test)',function(obj){
               if (obj.event == "add"){
                   layer.open({
                       type: 2,
                       title: '新增维修管理',
                       shadeClose: true,
                       shade: 0.8,
                       area: ['450px', '90%'],
                       content: '${pageContext.request.contextPath}/repaircontro/to_addrepairmanage' //iframe的url
                   })
               }
            });

            table.on('tool(test)',function(obj2){
                var data = obj2.data;
                if(obj2.event == "edit"){
                    layer.msg(data.repairMan);
                }
            });

        });
    </script>
</body>
</html>
