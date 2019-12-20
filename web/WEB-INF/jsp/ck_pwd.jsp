<%--
  Created by IntelliJ IDEA.
  User: LaIWeiChun
  Date: 2019/12/19
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>验证旧密码</title>
    <jsp:include page="top.jsp"></jsp:include>
</head>
<body>
<div class="x-body">
    <form class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">验证旧号码
            </label>
            <div class="layui-input-inline">
            <input type="password" class="layui-input" lay-verify="required" name="password"/>
            </div>
        </div>
        <div class="layui-form-item" style="margin-left: 100px;">
            <button class="layui-btn" lay-submit lay-filter="formDemo">验证旧密码</button>
        </div>
    </form>
</div>
</body>
    <script type="text/javascript">

        layui.use('form',function () {
            var form= layui.form;

            //监听提交
            form.on('submit(formDemo)',function(data){
                //发异步，把数据提交给后台
                $.ajax({
                    url:'${pageContext.request.contextPath}/checkOldPwd',
                    type:'post',
                    data:data.field,
                    dataType:'json',
                    success:function (data){
                        if ('success'==data){
                            layer.alert("验证成功！", {icon: 6},function(){
                                // 获得frame索引
                                var index = parent.layer.getFrameIndex(window.name);
                                //关闭当前frame
                                location.replace('${pageContext.request.contextPath}/toChangePwd');
                            });
                        }else {
                            layer.msg('验证密码错误！',{icon:2});
                        }

                    }
                });
                return false;
            });
        });


    </script>
</html>
