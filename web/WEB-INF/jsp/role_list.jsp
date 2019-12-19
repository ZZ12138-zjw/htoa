<%--
  Created by IntelliJ IDEA.
  User: LaIWeiChun
  Date: 2019/12/18
  Time: 8:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>角色管理</title>
    <jsp:include page="top.jsp"></jsp:include>
</head>
<body>
        <div class="x-body">
            <table class="layui-hide" id="roleTable" lay-filter="roleTableFilter"></table>
            <script type="text/html" id="roleTableBar">
                <button class="layui-btn layui-btn-xs layui-btn-primary data-count-edit" lay-event="edit"><i class="layui-icon">&#xe642;</i>编辑权限</button>
                <button class="layui-btn layui-btn-xs layui-btn-primary data-count-delete" lay-event=""><i class="layui-icon">&#xe640;</i>角色名称</button>
                <button class="layui-btn layui-btn-xs layui-btn-primary data-count-delete" lay-event="delete"><i class="layui-icon">&#xe640;</i>删除</button>
            </script>
            <script type="text/html" id="toolbar">
                <button class="layui-btn" onclick="x_admin_show('添加角色','${pageContext.request.contextPath}/quanXie/to_roleAdd')"><i class="layui-icon">&#xe642;</i>添加</button>
            </script>
        </div>
</body>
<script>
    layui.use(['table','layer'],function () {
        var table = layui.table,
            layer = layui.layer;

        table.render({
            elem:"#roleTable",
            url:'${pageContext.request.contextPath}/quanXie/roleList',
            page:true, //开启分页
            method:'post',
            limit:10, //分页默认大小
            height:450,
            limits: [5,10,20,50],
            toolbar:'#toolbar',
            cols:[[ //标题栏
                {field:'groupId',width:100,title:'编号'}
                ,{field: 'groupName',width: 150,title: '角色名称'}
                ,{field: 'groupinfo',width: 350,title: '角色介绍'}
                ,{field:'right',width:350,title:'操作',toolbar:'#roleTableBar'}
            ]]
        });

        table.on('tool(roleTableFilter)',function (obj) {
            var data=obj.date;
            if (obj.event=='delete'){
                layer.confirm('你确定要删除吗？',{icon:2},function (index) {
                    $.ajax({
                        url: '${pageContext.request.contextPath}/quanXie/roleDle',
                        data:{groupId:data.groupId},
                        type: "post",
                        success: function(suc) {
                            obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                            layer.close(index);
                            layer.msg("删除成功", {
                                icon: 1
                            });
                        }
                    });
                });
            }
        });
    });
</script>
</html>
