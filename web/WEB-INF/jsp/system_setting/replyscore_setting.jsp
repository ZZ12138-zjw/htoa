<%--
  Created by IntelliJ IDEA.
  User: 小燕
  Date: 2019/12/22
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../top.jsp"></jsp:include>
</head>
<body>
<div class="layui-row">
    <table id="LAY_table_classes" lay-filter="classes"></table>
</div>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" onclick="x_admin_show('添加答辩项目','<%=request.getContextPath()%>/system_setting/replyscore_toAdd')"><i class="layui-icon"></i>添加</button>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;
        //第一个实例
        table.render({
            elem: '#LAY_table_classes'
            ,height: 500
            ,url:'<%=request.getContextPath()%>/system_setting/replyscore_data'
            ,toolbar: '#toolbarDemo'//开启头部工具栏，并为其绑定左侧模板
            ,page: true //开启分页
            ,method:'post'
            ,limit:10
            ,cols: [[ //表头
                {field: 'projectId', title: '编号'}
                ,{field: 'proName', title: '学期名称'}
                ,{fixed: 'right', title:'操作',toolbar:'#barDemo'}
            ]]
            ,limits: [5,10,20,50]
            ,id:'testReload'
        });

        table.on('tool(classes)',function (obj) {
            var data = obj.data; //获取当前行的数据
            var layEvent =  obj.event; //获取lay-event对应的值
            var tr = obj.tr;//获取当前行

            if(layEvent == 'del'){//删除
                layer.confirm('真的删除么',function (index) {
                    alert(data.stuId);
                    $.ajax({
                        url:'${pageContext.request.contextPath}/system_setting/replyscore_delete',
                        type:'post',
                        data:{
                            termid:data.termid
                        },
                        dataType:'json',
                        success:function (data){
                            layer.alert("删除成功", {icon: 6});
                        }
                    });
                    obj.del(); //删除对应行（tr）的DOM结构，并更新 缓存
                    layer.close(index);
                });
            }
        })
    });
</script>
</body>
</html>
