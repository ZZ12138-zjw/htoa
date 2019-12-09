<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/12/5
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>资料文档</title>
    <jsp:include page="top.jsp"></jsp:include>
</head>
<body>
<div class="x-nav">
    <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:38px">ဂ</i></a>
</div>
<div class="x-body">
    <xblock>
        <button class="layui-btn layui-btn-danger" onclick="dele()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加用户','${pageContext.request.contextPath}/doc/uploadoc')"><i class="layui-icon"></i>添加资料</button>
        <span class="x-right" style="line-height:40px">共有数据：${count} 条</span>
    </xblock>
    <table class="layui-hide" id="idTest" lay-filter="complainList"></table>

    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" >删除</a>
        <a class="layui-btn layui-btn-xs"  lay-event="download">下载</a>
    </script>
</div>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });

    layui.use(['table','layer','form','laypage'], function(){
        var table = layui.table,
            layer = layui.layer,
            form = layui.form,
            laypage = layui.laypage;

        table.render({
            id:"provinceReload"
            ,elem: '#idTest'
            ,url:'${pageContext.request.contextPath}/doc/docList'
            ,page: true
            ,method:'post'
            ,limit:10
            ,cols: [
                [
                    {checkbox:true}//开启多选框
                    ,{field:'docId', width:100,title: '编号'}
                    ,{field:'dataName',width:150, title: '资料名'}
                    ,{field:'url',width:150, title: '资料地址'}
                    ,{field:'optime',width:150, title: '上传时间'}
                    ,{field:'remark',width:100,title: '备注'}
                    ,{field:'empId',width:150,title: '上传人员'}
                    ,{fixed: 'right', title:'操作',width:300,toolbar: '#barDemo'}
                ]
            ]
            ,limits: [5,10,20,50]
        });

        table.on('tool(complainList)', function(obj) {
            var data = obj.data;
            json = JSON.stringify(data);
            switch(obj.event) {
                case 'del':
                    var delIndex = layer.confirm('确定删除id为' + data.docId + "的信息吗?", function(delIndex) {
                        $.ajax({
                            url: '${pageContext.request.contextPath}/doc/delete',
                            data:{docId:data.docId},
                            type: "post",
                            success: function(suc) {
                                obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                                layer.close(delIndex);
                                console.log(delIndex);
                                layer.msg("删除成功", {
                                    icon: 1
                                });
                            }
                        });
                        layer.close(delIndex);
                    });
                    break;

            }
        });

    });

</script>
</body>
</html>
