<%--
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
<body>
    <div class="layui-container" style="padding: 20px 0;">
        <form class="layui-form" id="layuiform">
            <%--<div class="layui-form-item">
                <label class="layui-form-label">部门名称</label>
                <div class="layui-input-inline">
                    <select name="depName" id="depName" lay-verify="required" lay-search="">
                        <option value=""></option>
                        <c:forEach items="${allDeptList}" var="e">
                            <option value="${e.depName}" >${e.depName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">员工名称</label>
                <div class="layui-input-inline">
                    <select name="empName" id="empName" lay-verify="required" lay-search="">
                        <option value=""></option>
                        <c:forEach items="${allEmpList}" var="e">
                            <option value="${e.empName}" >${e.empName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>--%>
            <div class="layui-form-item">
                <label class="layui-form-label">选择员工</label>
                <div class="layui-input-inline">
                    <select name="dept" lay-filter="dept" id="dept">
                        <option value="">请选择部门</option>
                        <c:forEach items="${allDeptList}" var="e">
                            <option value="${e.depid}">${e.depName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <select name="emp" lay-filter="emp" id="emp">
                        <option value="">请选择员工</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">考核内容</label>
                <div class="layui-input-block">
                    <button class="layui-btn layui-btn-normal" lay-event="add"><i class="layui-icon">&#xe654;</i>点我选择考评内容


                    </button>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">开始日期</label>
                <div class="layui-input-inline">
                    <input type="text" id="startDate" name="startDate" required  lay-verify="required" placeholder="请选择开始日期" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">开始日期</label>
                <div class="layui-input-inline">
                     <input type="text" id="endDate" name="endDate" required  lay-verify="required" placeholder="请选择结束日期" autocomplete="off" class="layui-input">
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
            var laydate = layui.laydate;

            //监听提交
            form.on('submit(formDemo)', function(data) {
                $.post("${pageContext.request.contextPath}/checkcontro/addcheckindex",{
                    checkContent:$('#checkContent').val(),
                    checkScore:$('#checkScore').val(),
                    checkExplain:$('#checkExplain').val(),
                    depName:$('#depName').val()
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

            form.on('select(dept)',function (data){
                if (data.value == "51"){
                    $('#emp').html('<option value="">请选择员工</option>');
                    $('#emp').append(new Option("张三",0));
                    $('#emp').html('<option value="">请选择员工</option>');

                }
                /*layer.msg(data.value);
                var depId=data.value;
                $.post('${pageContext.request.contextPath}/evaluationcontro/listevaluationemp',{
                    depId:depId
                },function (obj) {
                    
                },"json")*/
            })

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
