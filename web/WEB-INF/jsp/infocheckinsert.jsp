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
        <%--<input type="hidden" id="checkScore" name="checkScore" value="${checkInsert.checkScore}"/>--%>
        <div class="layui-form-item">
            <label class="layui-form-label">部门名称</label>
            <div class="layui-input-inline">
                <input type="text" disabled="disabled" id="depName" value="${checkInsert.depName}" name="depName" required  lay-verify="required" placeholder="请输入被考核员工姓名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">员工姓名</label>
            <div class="layui-input-inline">
                <input type="text" disabled="disabled" id="empName" value="${checkInsert.empName}" name="empName" required  lay-verify="required" placeholder="请输入被考核员工姓名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">考核内容</label>
            <div class="layui-input-inline">
                <input type="text" disabled="disabled" id="checkContent" value="${checkInsert.checkContent}" name="checkContent" required  lay-verify="required" placeholder="请输入被考核员工姓名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">考核日期</label>
            <div class="layui-input-inline">
                <input type="text" disabled="disabled" id="checkDate" value="${checkInsert.checkDate}" name="checkDate" required  lay-verify="required" placeholder="请选择考核日期" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">录入人员</label>
            <div class="layui-input-inline">
                <input type="text" disabled="disabled" id="inputEmp" value="${checkInsert.inputEmp}" name="inputEmp" required  lay-verify="required" placeholder="请输入录入人员姓名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">考核说明</label>
            <div class="layui-input-inline">
                <textarea name="checkExplain" id="checkExplain" disabled="disabled" placeholder="请输入内容" class="layui-textarea">${checkInsert.checkExplain}</textarea>
            </div>
        </div>

        <%--<div id="layer-photos-demo" class="layer-photos-demo" style="display: block;">
            <img layer-pid="123" layer-src="${pageContext.request.contextPath}/images/bg.png" src="${pageContext.request.contextPath}/images/bg.png" alt="图片名">
            <img layer-pid="123" layer-src="${pageContext.request.contextPath}/images/bg.png" src="${pageContext.request.contextPath}/images/bg.png" alt="图片名">
        </div>--%>
            
        <div class="layui-form-item">
            <label class="layui-form-label">图片展示</label>
            <div class="layui-input-inline">
                <img src="${pageContext.request.contextPath}/images/bg.png" onclick="img_click()" style="width: 100px;height: 100px;">
            </div>
            <div class="layui-form-mid layui-word-aux">点击查看大图</div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" type="button" onclick="formDemo()">确定</button>
            </div>
        </div>
    </form>
</div>

<script>

    function img_click(){
      layui.use('layer',function () {
          var layer = layui.layer;
          $.post('${pageContext.request.contextPath}/checkinsertcontro/getcheckinsertphoto',{},function(data){
              layer.photos({
                  photos: data //格式见API文档手册页
                  ,anim: 2 //0-6的选择，指定弹出图片动画类型，默认随机
              });
          },"json")
      });
    };

    function formDemo(){
        layui.use(['laydate','table','form','layer'],function () {
            var laydate = layui.laydate;
            var table = layui.table;
            var form = layui.form;
            var layer = layui.layer;
            var index = parent.layer.getFrameIndex(window.name);
            //关闭当前frame
            parent.layer.close(index);
        });
    };


</script>
</body>
</html>
