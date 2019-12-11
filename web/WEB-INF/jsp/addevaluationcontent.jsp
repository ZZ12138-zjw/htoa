<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/9
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top.jsp"></jsp:include>
<html>
<head>
    <title>添加考评内容</title>
</head>
<body>
<div class="layui-container" style="padding: 20px 0;">
    <form class="layui-form" id="layuiform">
        <div class="layui-form-item">
            <label class="layui-form-label">考评名称</label>
            <div class="layui-input-inline">
                <input type="text" id="evaluationName" name="evaluationName" required  lay-verify="required" placeholder="请输入考核内容" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">部门名称</label>
            <div class="layui-input-inline">
                <select name="depName" id="depName" lay-verify="required">
                    <option value=""></option>
                    <c:forEach items="${allDepName}" var="e">
                        <option value="${e.depName}" >${e.depName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" type="submit" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<script>
    layui.use(['form','layer','laydate'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;

        //监听提交
        form.on('submit(formDemo)', function(data) {
            $.post("${pageContext.request.contextPath}/evaluationcontro/addevaluationcontent",{
                evaluationName:$('#evaluationName').val(),
                depName:$('#depName').val(),
            },function (data) {
                if (data=="success"){
                    layer.alert("添加成功", {icon: 6},function () {
                        var index = parent.layer.getFrameIndex(window.name);
                        //关闭当前frame
                        parent.layer.close(index);
                        setTimeout(function () {
                            window.parent.location.reload(); //修改成功后刷新父界面
                        })
                    });
                }
            },"text");
            return false;
        });
    });
</script>
</body>
</html>
