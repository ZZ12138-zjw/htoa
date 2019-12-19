<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/12
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="top.jsp"></jsp:include>
    <title>添加教师考评</title>
</head>
<body id="evaluationContent2">
    <div class="layui-container" style="padding: 20px 0;">
        <form class="layui-form" id="layuiform">
            <input type="hidden" id="evaluationType" name="evaluationType">
            <div class="layui-form-item">
                <label class="layui-form-label">选择员工</label>
                <div class="layui-input-inline">
                    <select name="deptName" lay-filter="dept" id="dept" lay-search="">
                        <option value="">请选择部门</option>
                        <c:forEach items="${allDeptList}" var="e">
                            <option value="${e.depid}" ${empEvaluationList.depID == e.depid ? 'selected' : ''}>${e.depName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <select name="empName" lay-filter="emp" lay-filter="emp" id="empId" lay-search="">
                        <option value="${empEvaluationList.empID}" >${empEvaluationList.empName}</option>
                        <option value="">请选择员工</option>

                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">员工类型</label>
                <div class="layui-input-block">
                    <input type="radio" name="evaluationType" value="1" title="专业老师" ${empEvaluationList.evaluationType==1 ? 'checked' : ''} lay-filter="evaluationType">
                    <input type="radio" name="evaluationType" value="2" title=专职班主任 ${empEvaluationList.evaluationType==1 ? '' : 'checked'} lay-filter="evaluationType">
                </div>
            </div>
            <div class="layui-form-item" id="test">
                <label class="layui-form-label">考评内容</label>
                <div class="layui-input-block" id="evaluationContent">
                    <%
                        List evaluationContentList = (List) request.getAttribute("evaluationContent");
                        List evaluationContentIDList = (List) request.getAttribute("evaluationContentID");
                    %>
                    <%
                        for (int i=0;i<evaluationContentIDList.size();i++){
                    %>
                        <input type="checkbox" value="<%=evaluationContentIDList.get(i)%>" title="<%=evaluationContentList.get(i)%>" checked>
                    <%
                        }
                    %>
                </div>
                <div class="layui-form-mid layui-word-aux">根据部门名称与员工类型来筛选考评内容</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">开始日期</label>
                <div class="layui-input-inline">
                    <input type="text" id="startDate" value="${empEvaluationList.startDate}" name="startDate" required  lay-verify="required" placeholder="请选择开始日期" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">结束日期</label>
                <div class="layui-input-inline">
                     <input type="text" id="endDate" value="${empEvaluationList.endDate}" name="endDate" required  lay-verify="required" placeholder="请选择结束日期" autocomplete="off" class="layui-input">
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
        function checkContent(){
            layui.use(['layer','form'],function () {
               var layer = layui.layer;
               layer.msg("点击了添加考核内容按钮");
            });
        }

        var evaluationType="";

        layui.use(['form','layer','laydate'], function(){
            var $ = layui.jquery;
            var form = layui.form
                ,layer = layui.layer;
            var laydate = layui.laydate;
            var emp = $('#empId option:selected');


            //监听提交
            form.on('submit(formDemo)', function(data) {
                //获取checkbox[name='like']的值
                var evaluationContent = "";
                var evaluationContentID = "";
                $("input:checkbox[name='evaluationContent']:checked").each(function(i){
                    evaluationContent += $(this).attr('title') + ',';
                    evaluationContentID += $(this).val() + ',';
                });
                // data.field.evaluationContent = arr.join(",");//将数组合并成字符串
                data.field.depName = $('#dept option:selected').text();
                data.field.empID = $('#empId option:selected').val();
                data.field.depID = $('#dept option:selected').val();
                data.field.empName = $('#empId option:selected').text();
                data.field.evaluationContent = evaluationContent;
                data.field.evaluationContentID = evaluationContentID;
                $.ajax({
                    url:'${pageContext.request.contextPath}/evaluationcontro/addempevaluation',
                    type:'post',
                    data:data.field,
                    dataType:'json',
                    success:function (obj) {
                        layer.alert("添加成功", {icon: 6},function () {
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

                /*$.post("${pageContext.request.contextPath}/evaluationcontro/addempevaluation",{
                    data:data.field
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
                },'json');
                return false;*/
            });

            form.on('select(dept)',function (data){
                var load = layer.load(1);
                $('#empId').empty();
                $.get('${pageContext.request.contextPath}/evaluationcontro/listemp',{
                    depid:data.value
                },function (data2) {
                    // console.log(data2);
                    $('#empId').html('<option value="">请选择员工</option>');
                    for(var a=0;a<data2.evaluationContentList.length;a++){
                        $('#empId').append("<option value='"+data2.evaluationContentList[a].empId+"'>"+data2.evaluationContentList[a].empName+"</option>");
                    }
                    layer.close(load);
                    form.render('select');
                },"json");
            })

            form.on('select(emp)',function (data){
                $.post('${pageContext.request.contextPath}/evaluationcontro/listevaluationtype',{
                    empId:data.value
                },function (data2) {
                },"text");
            });

            form.on('radio(evaluationType)',function (data) {
                $('#evaluationContent').empty();
                $.post('${pageContext.request.contextPath}/evaluationcontro/evaluationcontent',{
                    depID:$('#dept option:selected').val(),
                    evaluationType:data.value
                },function (map) {
                    for (var i=0;i<map.evaluationContentList.length;i++){
                        $('#evaluationContent').append("<input type='checkbox' value='"+map.evaluationContentList[i].evaluationID+"' title='"+map.evaluationContentList[i].evaluationName+"' name='evaluationContent'>");
                    }
                    form.render("checkbox");
                },"json");
            });

            laydate.render({
                elem:'#startDate',
                trigger:'click',
                type:'datetime',
                format:'yyyy-MM-dd HH'
            })

            laydate.render({
                elem:'#endDate',
                trigger:'click',
                type:'datetime',
                format:'yyyy-MM-dd HH'
            })
        });
    </script>
</body>
</html>