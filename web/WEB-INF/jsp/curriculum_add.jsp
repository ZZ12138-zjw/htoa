<%--
  Created by IntelliJ IDEA.
  User: 华
  Date: 2019/12/4
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <jsp:include page="top.jsp"></jsp:include>
</head>
<body>
    <div class="x-body">
        <form class="layui-form">
            <div class="layui-form-item">
                <label for="username" class="layui-form-label">
                    <span class="x-red">*</span>类别名称：
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="username" name="courseTypeName" required="" lay-verify="required"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="phone" class="layui-form-label">
                    <span class="x-red">*</span>说明：
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="phone" name="remark" required="" lay-verify="required"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                </label>
                <button  class="layui-btn" lay-filter="add" lay-submit lay-filter="add">
                    增加
                </button>
            </div>
        </form>
    </div>
<script>
    layui.use('laydata',function () {
        var laydata=layui.laydate;
    })

    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;
        //监听提交
        form.on('submit(add)', function(data){
            $.ajax({
                url:'${pageContext.request.contextPath}/coursetype/addcurriculum',
                type:'post',
                data:data.field,
                dataType:'json',
                success:function(data){
                    console.log(data);
                    //发异步，把数据提交给php
                    layer.alert("增加成功", {icon: 6},function () {
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                    });
                }
            });
            return false;
        });
    });



    //批量删除
    function delAll (argument) {
        var data = tableCheck.getData();
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            $.post("${pageContext.request.contextPath}/dept/deletes",data
                ,function (data) {
                    layer.msg('删除成功', {icon: 1});
                    $(".layui-form-checked").not('.header').parents('tr').remove();
                });
        });
    };
</script>
<%--<script>
    var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>--%>
</body>
</html>
