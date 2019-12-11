<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/9
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top.jsp"></jsp:include>
<html>
<head>
    <title>编辑考核录入</title>
</head>
<body>
    <div class="layui-container" style="padding: 20px 0;">
    <form class="layui-form" id="layuiform">
        <input type="hidden" id="ID" name="ID" value="${checkInsert.ID}"/>
        <%--<input type="hidden" id="checkScore" name="checkScore" value="${checkInsert.checkScore}"/>--%>
        <div class="layui-form-item">
            <label class="layui-form-label">考核内容</label>
            <div class="layui-input-inline">
                <select name="checkContent" id="checkContent" lay-verify="required">
                    <option value=""></option>
                    <c:forEach items="${allCheckIndex}" var="e">
                        <option value="${e.checkContent}"  ${checkInsert.checkContent==e.checkContent? 'selected' : ''}>${e.checkContent}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">员工姓名</label>
            <div class="layui-input-inline">
                <input type="text" id="empName" value="${checkInsert.empName}" name="empName" required  lay-verify="required" placeholder="请输入被考核员工姓名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">考核日期</label>
            <div class="layui-input-inline">
                <input type="text" id="checkDate" value="${checkInsert.checkDate}" name="checkDate" required  lay-verify="required" placeholder="请选择考核日期" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">录入人员</label>
            <div class="layui-input-inline">
                <input type="text" id="inputEmp" value="${checkInsert.inputEmp}" name="inputEmp" required  lay-verify="required" placeholder="请输入录入人员姓名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">考核说明</label>
            <div class="layui-input-inline">
                <input type="text" id="checkExplain" value="${checkInsert.checkExplain}" name="checkExplain" required  lay-verify="required" placeholder="请输入考核说明" autocomplete="off" class="layui-input">
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
    layui.use(['laydate','table','form','layer'],function () {
        var laydate = layui.laydate;
        var table = layui.table;
        var form = layui.form;
        var layer = layui.layer;

        form.on('submit(formDemo)',function(data){
           $.post('${pageContext.request.contextPath}/checkinsertcontro/editcheckinsert',
               {
                   checkContent:$('#checkContent').val(),
                   empName:$('#empName').val(),
                   checkDate:$('#checkDate').val(),
                   inputEmp:$('#inputEmp').val(),
                   checkExplain:$('#checkExplain').val(),
                   ID:$('#ID').val(),
                   checkScore:$('#checkScore').val()
               },
           function (data) {
               if (data=="true"){
                   layer.alert("编辑成功", {icon: 6},function () {
                       var index = parent.layer.getFrameIndex(window.name);
                       //关闭当前frame
                       parent.layer.close(index);
                       setTimeout(function () {
                           window.parent.location.reload(); //修改成功后刷新父界面
                       })
                   });
               }else{
                   layer.alert("编辑失败！",{icon:0});
                   var index = parent.layer.getFrameIndex(window.name);
                   //关闭当前frame
                   parent.layer.close(index);
                   setTimeout(function () {
                       window.parent.location.reload(); //修改成功后刷新父界面
                   })
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
