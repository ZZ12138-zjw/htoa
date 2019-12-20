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
    <title>修改密码</title>
    <jsp:include page="top.jsp"></jsp:include>
</head>
<body>
    <form class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">新密码
            </label>
            <div class="layui-input-inline">
                <input type="password" class="layui-input" id="password" name="password" />
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">重复密码
            </label>
            <div class="layui-input-inline">
                <input type="password" class="layui-input" name="password2" lay-verify="password2"/>
            </div>
        </div>
        <div class="layui-form-item" style="margin-left: 100px;">
            <button class="layui-btn" lay-submit lay-filter="formDemo">确定修改</button>
        </div>
    </form>
</body>
    <script type="text/javascript">

        layui.use('form',function () {
            var form= layui.form;

            //表单验证
            form.verify({
                password2:function(value,item){
                    if (value!=$("#password").val()){
                        return '两次密码不相同';
                    }
                }
            });
            //监听提交
            form.on('submit(formDemo)',function(data){
                //发异步，把数据提交给后台
                $.ajax({
                    url:'${pageContext.request.contextPath}/changePwd',
                    type:'post',
                    data:data.field,
                    dataType:'json',
                    success:function (data){
                        if ('success'==data){
                            layer.alert("修改成功 ", {icon: 6},function(){
                                // 获得frame索引
                                var index = parent.layer.getFrameIndex(window.name);
                                parent.layer.close(index);
                            });
                        }else {
                            layer.msg('修改失败 ',{icon: 1});
                        }

                    }
                });
                return false;
            });
        });
    </script>
</html>
