<%--
  Created by IntelliJ IDEA.
  User: LaIWeiChun
  Date: 2019/12/13
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top.jsp"></jsp:include>
<html>
<head>
    <title>考核修改</title>
</head>
<body>
<div class="layui-container" style="padding: 20px 0;">
    <form class="layui-form" id="layuiform">
        <input value="${ckVo.ID}" name="ID" type="hidden">
        <div class="layui-form-item">
            <label class="layui-form-label">考核内容</label>
            <div class="layui-input-inline">
                <select name="checkContent" id="checkContent" lay-verify="required">
                    <option value=""></option>
                    <c:forEach items="${allCheckInsertList}" var="e">
                        <option value="${e.checkContent}" ${e.checkContent==ckVo.checkContent ? 'selected' : ''} >${e.checkContent}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">考核日期</label>
            <div class="layui-input-inline">
                <input type="text" id="checkDate" value="${ckVo.checkDate}" name="checkDate" required  lay-verify="required" placeholder="请选择考核日期" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">考核说明</label>
            <div class="layui-input-inline">
                <textarea  name="checkExplain"  class="layui-textarea">${ckVo.checkExplain}</textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" type="button" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<script>
    layui.use(['laydate','table','form','layer'],function () {
        var laydate = layui.laydate;
        var table = layui.table;
        var form = layui.form;
        var layer = layui.layer;


        form.on('submit(formDemo)',function(data){

            $.post('${pageContext.request.contextPath}/emp/checkInsertUpdate',data.field,
                function (data) {
                    if (data=="success"){
                        layer.alert("修改成功", {icon: 6},function () {
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                        });
                    }else{
                        layer.alert("修改失败！",{icon:0});
                    }
                },"text");

            return false;
        });

        laydate.render({
            elem:'#checkDate',
            trigger:'click',
            type:'datetime'
        });
    });
</script>
</body>
</html>

