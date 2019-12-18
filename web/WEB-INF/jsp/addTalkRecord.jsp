<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/12/13
  Time: 8:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="top.jsp"></jsp:include>
</head>
<body>
    <div class="x-body">
        <form class="layui-form" id="userForm">
            <div class="layui-form-item">
                <label class="layui-form-label">学生姓名</label>
                <div class="layui-input-inline">
                    <select name="sayface" id="selectDep" lay-filter="classid">
                        <option value="">请选择</option>
                        <c:forEach items="${classList}" var="cla">
                            <option value="${cla.classId}">${cla.className}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label for="addr" class="layui-form-label">
                    <span class="x-red">*</span>地址
                </label>
                <div class="layui-input-inline">
                    <input name="addr"  id="addr" class="layui-input" lay-verify="addr"/>
                </div>
            </div>

            <div class="layui-form-item">
                <label for="sayscon" class="layui-form-label">
                    <span class="x-red">*</span>谈心内容
                </label>
                <div class="layui-input-inline">
                    <textarea name="sayscon"  id="sayscon" class="layui-textarea" lay-verify="sayscon"></textarea>
                </div>
            </div>

            <div class="layui-form-item" style="margin-left: 100px;">
                <button class="layui-btn" lay-submit lay-filter="formDemo" id="get">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </form>
    </div>

    <script>
        layui.use(['form','layer'],function () {
            var form = layui.form,
                layer = layui.layer;

            //监听提交
            form.on('submit(formDemo)',function(data){
                alert(JSON.stringify(data.field));
                //发异步，把数据提交给后台
                $.ajax({
                    url:'${pageContext.request.contextPath}/talk/toaddTalk',
                    type:'post',
                    data:data.field,
                    dataType:'json',
                    success:function (data){
                        layer.alert("增加成功", {icon: 6},function(){
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                            setTimeout(function () {
                                window.parent.location.reload(); //修改成功后刷新父界面
                            });
                        });
                    }
                });
                return false;
            });

            form.on('select(classid)',function () {
                $.ajax({
                   url:
                });
            });

            form.verify({
                addr:function (value) {
                    if (value.length == 0 || value == null){
                        return "不能为空";
                    }
                },sayscon:function (value) {
                    if (value.length == 0 || value == null){
                        return "不能为空";
                    }
                }
            });
        });
    </script>
</body>
</html>
