<%--
  Created by IntelliJ IDEA.
  User: 小燕
  Date: 2019/12/22
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../top.jsp"></jsp:include>
</head>
<body>
<div class="x-body">
    <form class="layui-form">
        <div class="layui-form-item">
            <label for="typeName" class="layui-form-label">
                <span class="x-red">*</span>类别名称：
            </label>
            <div class="layui-input-inline">
                <input type="text" id="typeName" name="typeName" required="" lay-verify="typeName"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="margin-left: 100px;">
            <button  class="layui-btn" lay-submit lay-filter="formDemo">增加</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </form>
</div>
<script>
    layui.use(['form','layer'], function(){
        var form = layui.form
            ,layer = layui.layer;

        form.verify({
            //value：表单的值，item表单的dom对象
            typeName:function (value,item) {
                if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                    return '届别名称不能有特殊字符';
                }
                if (/(^\_)|(\__)|(\_+$)/.test(value)){
                    return '届别名称首尾不能出现下划线\'_\'';
                }
                if (value.length<1){
                    return '届别名称至少得1个字符';
                }
            }
        });
        //监听提交
        form.on('submit(formDemo)',function(data){
            //发异步，把数据提交给php
            $.ajax({
                url:'${pageContext.request.contextPath}/system_setting/clatype_add',
                type:'post',
                data:data.field,
                dataType:'json',
                success:function(data){
                    layer.alert("增加成功", {icon: 6},function () {
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                        setTimeout(function () {
                            window.parent.location.reload();
                        })
                    });
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
