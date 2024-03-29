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
                <label for="floorName" class="layui-form-label">
                    <span class="x-red">*</span>楼栋名称：
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="floorName" name="floorName" required="" lay-verify="floorName"
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
            floorName:function (value,item) {
                if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                    return '楼栋名称不能有特殊字符';
                }
                if (/(^\_)|(\__)|(\_+$)/.test(value)){
                    return '楼栋名称首尾不能出现下划线\'_\'';
                }
                if (/^\d+\d+\d$/.test(value)){
                    return '楼栋名称不能为全数字';
                }
                if (value.length<1){
                    return '楼栋名称至少得1个字符';
                }
            }
        });
        //监听提交
       form.on('submit(formDemo)',function(data){
            //发异步，把数据提交给php
            $.ajax({
                url:'${pageContext.request.contextPath}/floor/flooradd',
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
