
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <jsp:include page="top.jsp"/>
</head>

<body>
<div class="x-body">
    <form class="layui-form" id="userForm">
        <div class="layui-form-item">
            <label class="layui-form-label">上传文件</label>
            <div class="layui-input-inline uploadHeadImage">
                <div class="layui-upload-drag" id="uploadFile">
                    <i class="layui-icon"></i>
                    <p>点击上传文件，或将文件拖拽到此处！</p>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="remark" class="layui-form-label">
                <span class="x-red">*</span>备注
            </label>
            <div class="layui-input-inline">
                <textarea name="remark"  id="remark" placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item" style="margin-left: 100px;">
            <button class="layui-btn" lay-submit lay-filter="formDemo" id="get">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </form>
</div>
<script>

    layui.use('upload', function () {
        var upload = layui.upload;
        var $ = layui.jquery;
        upload.render({
            elem: '#uploadFile'
            ,auto: false
            ,bindAction: '#get'
            ,accept:'file'
            ,drag:true
            ,auto: false
            ,done: function(res){
                alert(res);
            }
        });
    });


    layui.use(['form','layer'], function(){
        var form = layui.form;
        var layer = layui.layer;

        //监听提交
        form.on('submit(formDemo)',function(data){
            var fd = new FormData();
            var formData = new FormData($( "#userForm" )[0]);
            //发异步，把数据提交给后台
            $.ajax({
                url:'${pageContext.request.contextPath}/doc/touploadoc',
                type:'post',
                data:formData,
                dataType:'json',
                contentType: false, //jax 中 contentType 设置为 false 是为了避免 JQuery 对其操作，从而失去分界符，而使服务器不能正常解析文件
                processData: false, //当设置为true的时候,jquery ajax 提交的时候不会序列化 data，而是直接使用data
                success:function (data){
                    layer.alert("增加成功", {icon: 6},function(){
                        // 获得frame索引
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                        setTimeout(function () {
                            window.parent.location.reload(); //修改成功后刷新父界面
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