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
    <title>编辑考评内容</title>
</head>
<body>
<div class="layui-container" style="padding: 20px 0;">
    <form class="layui-form" id="layuiform">
        <input type="hidden" value="${evaluationList.evaluationID}" id="evaluationID" name="evaluationID">
        <div class="layui-form-item">
            <label class="layui-form-label">部门名称</label>
            <div class="layui-input-inline">
                <select name="depName" id="depName" lay-verify="required">
                    <option value=""></option>
                    <c:forEach items="${allDeptList}" var="e">
                        <option value="${e.depid}"  ${evaluationList.depName==e.depName? 'selected' : ''}>${e.depName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">员工类型</label>
            <div class="layui-input-block">
                <input type="radio" name="evaluationType" value="1" title="专业老师" lay-filter="evaluationType" ${evaluationList.evaluationType==1 ? 'checked' : ''}>
                <input type="radio" name="evaluationType" value="2" title="专职班主任" lay-filter="evaluationType" ${evaluationList.evaluationType==1 ? '' : 'checked'}>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">考评名称</label>
            <div class="layui-input-inline">
                <input type="text" value="${evaluationList.evaluationName}" id="evaluationName" name="evaluationName" required  lay-verify="required" placeholder="请输入考核内容" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">考评分值</label>
            <div class="layui-input-inline">
                <input type="number" value="${evaluationList.evaluationScore}" id="evaluationScore" name="evaluationScore" required  lay-verify="required" placeholder="请输入考评分值" autocomplete="off" class="layui-input">
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
        var depName = $('#depName option:selected');
        var evaluationType = 1;
        form.on('radio',function (data) {
            evaluationType = 0;
            evaluationType+=data.value;
        })

        //监听提交
        form.on('submit(formDemo)', function(data) {
            $.post("${pageContext.request.contextPath}/evaluationcontro/editevaluationcontent",{
                evaluationID:$('#evaluationID').val(),
                evaluationName:$('#evaluationName').val(),
                depName:depName.text(),
                depID:depName.val(),
                evaluationScore:$('#evaluationScore').val(),
                evaluationType:evaluationType
            },function (data) {
                if (data=="success"){
                    layer.alert("编辑成功", {icon: 6},function () {
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
