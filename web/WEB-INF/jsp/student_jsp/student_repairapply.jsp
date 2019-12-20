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
            <label class="layui-form-label">故障报修类别</label>
            <div class="layui-input-inline">
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
            <label class="layui-form-label">报修备注</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入报修备注" id="repairExplain" name="repairExplain" class="layui-textarea"></textarea>
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
