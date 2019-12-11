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
            <input type="hidden" name="courseTypeId" value="${courseTypeVo.courseTypeId}">
            <div class="layui-form-item">
                <label for="courseTypeName" class="layui-form-label">
                    <span class="x-red">*</span>类别名称：
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="courseTypeName" name="courseTypeName" required="" value="${courseTypeVo.courseTypeName}" lay-verify="courseTypeName"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="remark" class="layui-form-label">
                    <span class="x-red">*</span>说明：
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="remark" name="remark" required="" value="${courseTypeVo.remark}" lay-verify="required"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 100px;">
                <button  class="layui-btn" lay-submit lay-filter="formDemo">立刻提交</button>
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
            courseTypeName:function (value,item) {
                if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                    return '类别名称不能有特殊字符';
                }
                if (/(^\_)|(\__)|(\_+$)/.test(value)){
                    return '类别名称首尾不能出现下划线\'_\'';
                }
                if (/^\d+\d+\d$/.test(value)){
                    return '类别名称不能为全数字';
                }
                if (value.length<3){
                    return '类别名称至少得3个字符';
                }
            }
        });
        //监听提交
       form.on('submit(formDemo)',function(data){
            //发异步，把数据提交给php
            $.ajax({
                url:'${pageContext.request.contextPath}/coursetype/update',
                type:'post',
                data:data.field,
                dataType:'json',
                success:function(data){
                    var lindex = layer.load();
                    if ('success'==data){
                        layer.alert("修改成功", {icon: 6},function () {
                            layer.close(lindex);
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                            setTimeout(function () {
                                window.parent.location.reload();
                            });
                        });
                    }else {
                        layer.alert("修改失败",{icon:1},function () {

                        });
                    }
                }
            });
            return false;
        });
    });
</script>
<script>
    var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
</body>
</html>
