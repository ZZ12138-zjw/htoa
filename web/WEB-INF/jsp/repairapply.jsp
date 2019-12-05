<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/4
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>维修申请</title>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>

</head>
<body>
    <div class="layui-container" style="padding: 20px 0;">
        <form class="layui-form" id="layuiform">
            <div class="layui-form-item">
                <label class="layui-form-label">报修人</label>
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
                <label class="layui-form-label">部门或班级</label>
                <div class="layui-input-inline">
                    <input type="text" name="repairDept" id="repairDept" required lay-verify="required" placeholder="请输入部门或班级" autocomplete="off" class="layui-input">
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
            $.post("${pageContext.request.contextPath}/contro/repairmanage",{
                repairMan:$('#repairMan').val(),
                repairSort:$('#repairSort').val(),
                repairAddress:$('#repairAddress').val(),
                startDate:$('#startDate').val(),
                repairDept:$('#repairDept').val(),
                repairName:$('#repairName').val()
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
