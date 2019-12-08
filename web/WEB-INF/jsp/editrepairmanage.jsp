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
    <title>添加维修管理</title>
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
                <label class="layui-form-label">报修人</label>
                <div class="layui-input-inline">
                    <input type="text" value="${listRepair.repairMan}" id="repairMan" name="repairMan" required  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">故障报修类别</label>
                <div class="layui-input-inline">
                    <select name="repairSort" id="repairSort" lay-verify="required">
                        <c:forEach items="${repairSortList}" var="e">
                            <option value="${e.repairSort}"  ${listRepair.repairSort==e.repairSort? 'selected' : ''}>${e.repairSort}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">报修地址</label>
                <div class="layui-input-inline">
                    <input type="text" value="${listRepair.repairAddress}" id="repairAddress" name="repairAddress" required  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">报修名称</label>
                <div class="layui-input-inline">
                    <input type="text" value="${listRepair.repairName}" id="repairName" name="repairName" required  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">部门或班级</label>
                <div class="layui-input-inline">
                    <input type="text" value="${listRepair.repairDept}" id="repairDept" name="repairDept" required  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">选择维修状态</label>
                <div class="layui-input-inline">
                    <select name="repairStatus" id="repairStatus" lay-verify="required">
                        <option value=""></option>
                        <c:forEach items="${repairStatusList}" var="e">
                            <option value="${e.repairStatus}"  ${listRepair.repairStatus==e.repairStatus? 'selected' : ''}>${e.repairStatus}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">开始日期</label>
                <div class="layui-input-inline">
                    <input type="text" value="${listRepair.startDate}" id="startDate" name="startDate" required  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">结束日期</label>
                <div class="layui-input-inline">
                    <input type="text" value="${listRepair.endDate}" placeholder="请选择结束日期" id="endDate" name="endDate" required  lay-verify="required" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">如果结束时间为空则表示维修未完成或未开始</div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">维修备注</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入备注" id="repairIndex" name="repairIndex" lay-verify="required" autocomplete="off" class="layui-textarea"></textarea>
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
    layui.use(['form','layer','laydate'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;

        //监听提交
        form.on('submit(formDemo)', function(data) {
            $.post("${pageContext.request.contextPath}/repaircontro/repairmanage",{
                repairMan:$('#repairMan').val(),
                repairSort:$('#repairSort').val(),
                repairAddress:$('#repairAddress').val(),
                repairDept:$('#repairDept').val(),
                repairName:$('#repairName').val(),
                repairStatus:$('#repairStatus').val(),
                startDate:$('#startDate').val(),
                endDate:$('#endDate').val(),
                repairIndex:$('#repairIndex').val(),
            },function (data) {
                if (data=="success"){
                    layer.alert("增加成功", {icon: 6},function () {
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
        layui.use('laydate', function(){
            var laydate = layui.laydate;
            //执行一个laydate实例
            laydate.render({
                elem: '#startDate' //指定元素
                ,trigger:'click'
            });

            laydate.render({
                elem: '#endDate' //指定元素
                ,trigger:'click'
            });
        });
    });
</script>
</body>
</html>
