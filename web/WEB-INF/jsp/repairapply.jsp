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
<%--                <div class="layui-form-mid layui-word-aux">辅助文字</div>--%>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">申请时间</label>
                <div class="layui-inline"> <!-- 注意：这一层元素并不是必须的 -->
                    <input type="text" id="startDate" name="startDate" required lay-verify="required" class="layui-input" id="test1" placeholder="请选择报修时间">
                </div>
            </div>




            <%--<div class="layui-form-item">
                <label class="layui-form-label">复选框</label>
                <div class="layui-input-block">
                    <input type="checkbox" name="like[write]" title="写作">
                    <input type="checkbox" name="like[read]" title="阅读" checked>
                    <input type="checkbox" name="like[dai]" title="发呆">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">开关</label>
                <div class="layui-input-block">
                    <input type="checkbox" name="switch" lay-skin="switch">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">单选框</label>
                <div class="layui-input-block">
                    <input type="radio" name="sex" value="男" title="男">
                    <input type="radio" name="sex" value="女" title="女" checked>
                </div>
            </div>--%>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-block">
                    <textarea name="repairIndex" id="repairIndex" placeholder="请输入备注" class="layui-textarea"></textarea>
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
                repairIndex:$('#repairIndex').val()
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
                elem: '#test1' //指定元素
            });
        });
    });
</script>
</body>
</html>
