<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/9
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top.jsp"></jsp:include>
<html>
<head>
    <title>添加考核指标</title>
</head>
<body>
<div class="layui-container" style="padding: 20px 0;">
    <form class="layui-form" id="layuiform">
        <input type="hidden" name="ID" value="${checkIndexList.ID}"/>
        <div class="layui-form-item">
            <label class="layui-form-label">考核内容</label>
            <div class="layui-input-inline">
                <input type="text" value="${checkIndexList.checkContent}" id="checkContent" name="checkContent" required  lay-verify="required" placeholder="请输入考核内容" autocomplete="off" class="layui-input">

            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">考核分数</label>
            <div class="layui-input-inline">
                <input type="text" value="${checkIndexList.checkScore}" id="checkScore" name="checkScore" required  lay-verify="required" placeholder="请输入考核分数" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">考核说明</label>
            <div class="layui-input-inline">
                <input type="text" value="${checkIndexList.checkExplain}" id="checkExplain" name="checkExplain" required  lay-verify="required" placeholder="请输入考核说明" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">部门名称</label>
            <div class="layui-input-inline">
                <select name="depName" id="depName" lay-verify="required">
                    <option value=""></option>
                    <c:forEach items="${allDept}" var="e">
                        <option value="${e.depName}"  ${checkIndexList.depName==e.depName? 'selected' : ''}>${e.depName}</option>
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
    layui.use(['form','layer','laydate'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;

        //监听提交
        form.on('submit(formDemo)', function(data) {
            $.ajax({
                url:'${pageContext.request.contextPath}/checkcontro/editcheckindex',
                type:'post',
                data:data.field,
                dataType:'json',
                success:function (data){
                    var lindex = layer.load();
                    if ('success'==data){
                        layer.alert("修改成功", {icon: 6},function(){
                            layer.close(lindex);
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                            setTimeout(function () {
                                window.parent.location.reload(); //修改成功后刷新父界面
                            });
                        });
                    }else {
                        layer.alert("修改失败",{icon: 1},function(){
                        });
                    }

                }
            });
            return false;
        });
    });
</script>
</body>
</html>
