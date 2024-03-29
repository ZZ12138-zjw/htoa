<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/12/10
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="top.jsp"></jsp:include>
</head>
<body>
    <div class="x-body">
        <form class="layui-form" id="userForm">
            <input type="hidden" name="worklogid" value="${weeklyVo.worklogid}">
            <input type="hidden" name="empid" value="${weeklyVo.empid}">
            <input type="hidden" name="workdays" value="${weeklyVo.workday}">
            <div class="layui-form-item">
                <label for="weekCur" class="layui-form-label">
                    <span class="x-red">*</span>本周情况描述
                </label>
                <div class="layui-input-inline">
                    <textarea name="weekCur"  id="weekCur" class="layui-textarea">${weeklyVo.weekCur}</textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <label for="studentQuestion" class="layui-form-label">
                    <span class="x-red">*</span>问题学生情况反馈
                </label>
                <div class="layui-input-inline">
                    <textarea name="studentQuestion"  id="studentQuestion" class="layui-textarea">${weeklyVo.studentQuestion}</textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <label for="idea" class="layui-form-label">
                    <span class="x-red">*</span>意见建议
                </label>
                <div class="layui-input-inline">
                    <textarea name="idea"  id="idea" class="layui-textarea">${weeklyVo.idea}</textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <label for="weekNext" class="layui-form-label">
                    <span class="x-red">*</span>下周工作计划
                </label>
                <div class="layui-input-inline">
                    <textarea name="weekNext"  id="weekNext" class="layui-textarea">${weeklyVo.weekNext}</textarea>
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 100px;">
                <button class="layui-btn" lay-submit lay-filter="formDemo" id="get">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </form>
    </div>

    <script>
        layui.use(['form','layer'],function () {
            var form = layui.form,
                layer = layui.layer;


            //监听提交
            form.on('submit(formDemo)',function(data){
                alert(JSON.stringify(data.field));
                //发异步，把数据提交给后台
                $.ajax({
                    url:'${pageContext.request.contextPath}/myweek/weekupdate',
                    type:'post',
                    data:data.field,
                    dataType:'json',
                    success:function (data){
                        layer.alert("修改成功", {icon: 6},function(){
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                            setTimeout(function () {
                                window.parent.location.reload(); //修改成功后刷新父界面
                            });
                        });
                    }
                });
                return false;
            });
        });
    </script>
</body>
</html>
