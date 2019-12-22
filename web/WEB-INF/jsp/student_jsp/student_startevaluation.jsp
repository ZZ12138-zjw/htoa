<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/21
  Time: 10:13
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
    <div class="layui-container" style="padding: 20px 0;">
        <form class="layui-form" id="layuiform" lay-filter="evaluationForm">
            <input type="hidden" id="empEvaluationID" name="empEvaluationID" value="${empEvaluationVo.empEvaluationID}">
            <input type="hidden" name="empName" value="${empEvaluationVo.empName}">
            <input type="hidden" name="empID" value="${empEvaluationVo.empID}">
            <input type="hidden" name="evaluationTotalScore" value="${empEvaluationVo.evaluationTotalScore}">
            <input type="hidden" name="evaluationContentID" value="${empEvaluationVo.evaluationContentID}">
            <input type="hidden" name="evaluationSingleTotalScore" value="${empEvaluationVo.evaluationScore}">
            <input type="hidden" name="evaluationContent" value="${empEvaluationVo.evaluationContent}">
            <input type="hidden" id="evaluationSingleGetScore" name="evaluationContentSingleGetScore">
            <%
                String evaluationContentID[] = (String[]) request.getAttribute("evaluationContentID");
                String evaluationContent[] = (String[]) request.getAttribute("evaluationContent");
                String evaluationScore[] = (String[]) request.getAttribute("evaluationScore");
                for(int i=0;i<evaluationContentID.length;i++){
            %>
                <div class="layui-form-item">
                    <label class="layui-form-label"><%=evaluationContent[i]%></label>
                    <div class="layui-input-inline">
                        <input type="number" id="<%=evaluationContentID[i]%>" name="evlauationScore" required lay-verify="required"
                               placeholder="请输入考评分数" min="1" max="<%=evaluationScore[i]%>" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">分值：<%=evaluationScore[i]%> 分</div>
                </div>
            <%
                }
            %>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" type="submit" lay-submit lay-filter="formDemo">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>

    <script>

        layui.use(['form'],function () {
            var form = layui.form;
            form.on('submit(formDemo)',function (data) {
                var evaluationScore = [];
                    $("input[name='evlauationScore']").each(function () {
                        evaluationScore.push($(this).val());
                    })
                data.field.evaluationSingleGetScore=evaluationScore.toString();
                $.ajax({
                   url:'${pageContext.request.contextPath}/Stu/empevaluationcontro/addempevaluation',
                   type:'post',
                   data:data.field,
                   success:function () {
                       layer.alert("提交成功", {icon: 6}, function () {
                           var index = parent.layer.getFrameIndex(window.name);
                           //关闭当前frame
                           parent.layer.close(index);
                           setTimeout(function () {
                               window.parent.location.reload(); //修改成功后刷新父界面
                           })
                       });
                   }
                });
                return false;
                /*var datas = $(data.form).serialize();
                $.post('${pageContext.request.contextPath}/Stu/empevaluationcontro/addempevaluation',{
                    datas
                },function (obj) {
                    alert("提交成功！");
                })*/
            });
        });

    </script>
</body>
</html>
