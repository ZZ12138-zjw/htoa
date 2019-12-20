<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/19
  Time: 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../top.jsp"></jsp:include>
    <title>学生报修申请</title>
</head>
<body>
    <div class="layui-container" style="padding: 20px 0;">
    <form class="layui-form" id="layuiform">
        <div class="layui-form-item">
            <label class="layui-form-label">学生姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="studentName" id="studentName" value="${studentRepair.studentName}" disabled="disabled" required lay-verify="required" placeholder="请输入地址" autocomplete="off" class="layui-input">
            </div>
        </div>
            <div class="layui-form-item">
            <label class="layui-form-label">班级名称</label>
            <div class="layui-input-inline">
                <input type="text" name="className" id="className" value="${studentRepair.className}" disabled="disabled" required lay-verify="required" placeholder="请输入地址" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">故障报修类别</label>
            <div class="layui-input-inline">
                <input type="text" name="repairSort" id="repairSort" value="${studentRepair.repairSort}" disabled="disabled" required lay-verify="required" placeholder="请输入地址" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">报修地址</label>
            <div class="layui-input-inline">
                <input type="text" name="repairAddress" id="repairAddress" value="${studentRepair.repairAddress}" disabled="disabled" required lay-verify="required" placeholder="请输入地址" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">报修名称</label>
            <div class="layui-input-inline">
                <input type="text" name="repairName" id="repairName" value="${studentRepair.repairName}" disabled="disabled" required lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">开始日期</label>
            <div class="layui-input-inline">
                <input type="text" name="startDate" id="startDate" value="${studentRepair.startDate}" disabled="disabled" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">结束日期</label>
            <div class="layui-input-inline">
                <input type="text" name="endDate" id="endDate" value="${studentRepair.endDate}" disabled="disabled" required lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">报修状态</label>
            <div class="layui-input-inline">
                <input type="text" name="repairStatus" id="repairStatus" value="${studentRepair.repairStatus}" disabled="disabled" required lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">报修备注</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入报修备注" id="repairExplain" disabled="disabled" name="repairExplain" class="layui-textarea">${studentRepair.repairExplain}</textarea>
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
                $.ajax({
                    url:'${pageContext.request.contextPath}/Stu/studentrepair/add_studentrepair',
                    type:'post',
                    dataType:'text',
                    data:data.field,
                    success:function (data) {
                        layer.alert("增加成功", {icon: 6},function () {
                            document.getElementById("layuiform").reset();
                            var index = layer.alert();
                            layer.close(index);
                        });
                    }
                })
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
