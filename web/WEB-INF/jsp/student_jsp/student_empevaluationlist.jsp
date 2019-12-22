<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/19
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../top.jsp"></jsp:include>
    <title>教师考评</title>
</head>
<body>

    <%--定义行按钮--%>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit"><i class="layui-icon">&#xe642;</i>开始考评</a>
    </script>

    <form class="layui-form" style="padding: 20px;">
        <div class="layui-input-inline">
            <select name="evaluationType" id="evaluationType" lay-verify="required">
                <option value="">请选择教师类型</option>
                <option value="1">专业老师</option>
                <option value="2">专职班主任</option>
            </select>
        </div>
        <div class="layui-form-mid layui-word-aux">如果无数据则表示当前暂无考评项</div>
    </form>

    <table id="demo" lay-filter="test"></table>

    <script>
        layui.use(['table', 'layer', 'jquery','form'], function () {
            var table = layui.table;
            var form = layui.form;

            form.render('select');

            //第一个实例
            table.render({
                elem: '#demo'
                , height: 460
                , url: '${pageContext.request.contextPath}/repaircontro/listrepair' //数据接口
                , cellMinWidth: 100
                , page: true //开启分页
                ,id:'evaluationTable'
                , cols: [[ //表头
                    , {field: 'empEvaluationID', title: '考评编号', sort: true}
                    , {field: 'empName', title: '教师名称'}
                    , {field: 'evaluationContent', title: '考评内容'}
                    , {field: 'evaluationTotalScore', title: '考评总分', sort: true}
                    , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo', width: 200}
                ]]
            });

            form.on('select',function (data) {
                table.reload('evaluationTable',{
                    url: '${pageContext.request.contextPath}/Stu/empevaluationcontro/liststudentempevaluation',
                    where:{
                        evaluation:data.value
                    }
                });
            });

            table.on('tool(test)', function (obj2) {
                var data = obj2.data;
                if (obj2.event == "edit") {
                    var index = layer.open({
                        type: 2,
                        title: "教师考评",
                        area: ['600px', '90%'],
                        fix: false, //不固定
                        maxmin: true,
                        shadeClose: true,
                        shade: 0.4,
                        skin: 'layui-layer-rim',
                        content: ["${pageContext.request.contextPath}/Stu/empevaluationcontro/to_startevaluation?empEvaluationID=" + data.empEvaluationID],
                    });
                }
            });
        });
    </script>
</body>
</html>
