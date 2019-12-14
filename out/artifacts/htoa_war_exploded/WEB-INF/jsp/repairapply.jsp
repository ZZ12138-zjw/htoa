<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/4
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>维修申请</title>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <jsp:include page="top.jsp"></jsp:include>
</head>
<body>
    <div class="layui-container" style="padding: 20px 0;">
        <form class="layui-form" id="layuiform">
            <div class="layui-form-item">
                <label class="layui-form-label">申请人</label>
                <div class="layui-input-block">
                    <input type="text" id="repairMan" name="repairMan" required  lay-verify="required" placeholder="请输入报修人姓名" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">故障报修类别</label>
                <div class="layui-input-block">
                    <select name="repairSort" id="repairSort" lay-verify="required">
                        <option value=""></option>
                        <option value="水电报修">水电报修</option>
                        <option value="设备报修">设备报修</option>
                        <option value="建筑报修">建筑报修</option>
                        <option value="其他报修">其他报修</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">报修地址</label>
                <div class="layui-input-inline">
                    <input type="text" name="repairAddress" id="repairAddress" required lay-verify="required" placeholder="请输入地址" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">报修名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="repairName" id="repairName" required lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">选择部门</label>
                <div class="layui-input-inline">
                    <select name="depName" id="depName" lay-verify="required">
                        <option value=""></option>
                        <c:forEach items="${allDeptList}" var="e">
                            <option value="${e.depName}">${e.depName}</option>
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
    //Demo
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;

        //监听提交
        form.on('submit(formDemo)', function(data) {
            $.post("${pageContext.request.contextPath}/repaircontro/repairapply",{
                repairMan:$('#repairMan').val(),
                repairSort:$('#repairSort').val(),
                repairAddress:$('#repairAddress').val(),
                repairDept:$('#depName').val(),
                repairName:$('#repairName').val(),
                repairStatus:'待维修'
            },function (data) {
                if (data=="success"){
                    layer.alert("增加成功", {icon: 6},function () {
                        document.getElementById("layuiform").reset();
                        var index = layer.alert();
                        layer.close(index);
                    });
                }
            },"text");
            return false;
        });
        layui.use('laydate', function(){
            var laydate = layui.laydate;
            //执行一个laydate实例
            laydate.render({
                elem: '#startDate' //指定元素
                ,trigger:'click'
            });

        });
    });
</script>
</body>
</html>
