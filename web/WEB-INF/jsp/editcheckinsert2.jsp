<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %><%--
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
    <title>考核录入</title>
</head>
<body>
    <div class="layui-container" style="padding: 20px 0;">
    <form class="layui-form" id="layuiform">
        <input type="hidden" name="inputEmp" value="${sessionScope.empId}">
        <div class="layui-form-item">
            <label class="layui-form-label">选择员工</label>
            <div class="layui-input-inline">
                <select name="deptName" lay-filter="dept" id="dept" lay-search="">
                    <option value="">请选择部门</option>
                    <c:forEach items="${allDeptList}" var="e">
                        <option value="${e.depid}"  ${checkInsertList.depID==e.depid ? 'selected' : ''}>${e.depName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="empName" lay-filter="emp" id="empId" lay-search="">
                    <%--<option value="">请选择员工</option>
                    <option value="${checkInsertList.empID}">${checkInsertList.empName}</option>--%>
<%--                    <c:forEach items="${checkInsertList}" var="e">--%>
                        <option value="${checkInsertList.depID}">${checkInsertList.empName}</option>
<%--                    </c:forEach>--%>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">考核内容</label>
            <div class="layui-input-inline">
                <select name="checkContent" id="checkContent" lay-verify="required">
                    <option value=""></option>
                    <c:forEach items="${allCheckIndexList}" var="e">
                        <option value="${e.ID}" ${checkInsertList.checkContentID==e.ID ? 'selected' :''}>${e.checkContent}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">考核日期</label>
            <div class="layui-input-inline">
                <input type="text" id="checkDate" value="${checkInsertList.checkDate}" name="checkDate" required  lay-verify="required" placeholder="请选择考核日期" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">考核说明</label>
            <div class="layui-input-inline">
                <input type="text" id="checkExplain" value="${checkInsertList.checkExplain}" name="checkExplain" required  lay-verify="required" placeholder="请输入考核说明" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">图片上传</label>
            <div class="layui-input-inline">
                <div class="layui-upload-drag" id="imgUpload" name="imgUpload">
                    <i class="layui-icon"></i>
                    <p>点击上传，或将文件拖拽到此处</p>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" id="submitBtn" type="submit" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>

<script>
    layui.use(['laydate','table','form','layer','upload'],function () {
        var laydate = layui.laydate;
        var table = layui.table;
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.$;
        var upload = layui.upload;
        var img = "";

        form.on('submit(formDemo)',function(data){
            var dep = $("#dept option:selected");
            var emp = $("#empId option:selected");
           $.post('${pageContext.request.contextPath}/checkinsertcontro/addcheckinsert',
               {
                   checkContent:$('#checkContent').val(),
                   depName:dep.text(),
                   depID:dep.val(),
                   empName:emp.text(),
                   empID:emp.val(),
                   checkDate:$('#checkDate').val(),
                   inputEmp:"张三",
                   inputID:1,
                   checkExplain:$('#checkExplain').val(),
                   checkContentID:$('#checkContent').val(),
                   imageName:img
               },
           function (data) {
               if (data=="true"){
                   layer.alert("添加成功", {icon: 6},function () {
                       var index = parent.layer.getFrameIndex(window.name);
                       //关闭当前frame
                       parent.layer.close(index);
                       setTimeout(function () {
                           window.parent.location.reload(); //修改成功后刷新父界面
                       })
                   });
               }else{
                   layer.alert("添加失败！",{icon:0});
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

        form.on('select(dept)',function (data){
            $('#empId').empty();
            $.get('${pageContext.request.contextPath}/checkinsertcontro/listemp',{
                depid:data.value
            },function (data2) {
                // console.log(data2);
                $('#empId').html('<option value="">请选择员工</option>');
                for(var a=0;a<data2.empList.length;a++){
                    $('#empId').append("<option value='"+data2.empList[a].empId+"'>"+data2.empList[a].empName+"</option>");
                }
                form.render('select');
            },"json");
        })

       laydate.render({
           elem:'#checkDate',
           trigger:'click',
           type:'datetime',
           format:'yyyy-MM-dd HH'
       });

        upload.render({
            elem:'#imgUpload',
            multiple: true,
            accept:'file',
            size:50000,
            auto:false,
            bindAction:'#submitBtn',
            data:{
                checkDate: function(){
                    return $('#checkDate').val();
                }
            },
            url:'${pageContext.request.contextPath}/checkinsertcontro/imgupload',
            choose:function(obj){
                var files = obj.pushFile();

                obj.preview(function (index,file,result) {
                    img = file.name;
                });
            },
            done:function (res) {
                if (res.code == "1"){
                    layer.msg("上传成功！");
                    location.reload();
                }else if(res.code == "2"){
                    layer.msg("上传失败！",function () {
                        location.reload();
                    })
                }
            }
        });
    });
</script>
</body>
</html>
