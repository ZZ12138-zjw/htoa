<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/12/19
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="top.jsp"></jsp:include>
</head>
<body>
    <div class="layui-row">
        <fieldset class="layui-elem-field layuimini-search">
            <legend>搜素信息</legend>
            <div style="margin: 10px">
                <form class="layui-form layui-form-pane">
                    <div class="layui-form-item">
                        <label class="layui-form-label">楼栋</label>
                        <div class="layui-input-inline">
                            <select name="floorName" id="floor" lay-filter="floor">
                                <option value="">请选择楼栋</option>
                                <c:forEach items="${floorList}" var="flot">
                                    <option value="${flot.floorId}">${flot.floorName}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <label class="layui-form-label">宿舍房号</label>
                        <div class="layui-input-inline">
                            <select name="hourName" id="hourName">
                                <option value="">请选择宿舍房号</option>
                            </select>
                        </div>

                        <div class="layui-inline">
                            <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>
    </div>

    <div class="layui-row">
        <table class="layui-hide" id="idTest" lay-filter="complainList"></table>
    </div>

    <script>
        layui.use(['table','form','layer'],function () {
            var table = layui.table,
                form = layui.form,
                layer = layui.layer;

            table.render({
                id:"idTest"
                ,elem: '#idTest'
                ,url:'${pageContext.request.contextPath}/sysreport/dormitorycount'
                ,page: true
                ,method:'post'
                ,limit:10
                ,cols: [
                    [
                        {field:'floorName',title: '宿舍楼栋'}
                        ,{field:'hourName', title: '宿舍房号'}
                        ,{field:'addr',title: '宿舍地址'}
                        ,{field:'stucount',title: '录入学生数'}
                        ,{field:'numberBeds',title: '床位数'}
                        ,{field:'kws',title: '空位数'}
                    ]
                ]
                ,limits: [5,10,20,50]
            });

            form.on('select(floor)',function (data) {
                $('#hourName').empty();
                $.get('${pageContext.request.contextPath}/sysreport/hourNameList',{
                    floorId:data.value
                },function (data2) {
                    $('#hourName').html('<option value="">请选择宿舍房号</option>');
                    for(var i=0;i<data2.hourNameList.length;i++){
                        $('#hourName').append("<option value='"+data2.hourNameList[i].hourName+"'>"+data2.hourNameList[i].hourName+"</option>");
                    }
                    form.render('select');
                },"json");
            });

            // 监听搜索操作
            form.on('submit(sreach)', function (data) {
                var result = JSON.stringify(data.field);
                alert(result);
                //执行搜索重载
                table.reload('idTest', {
                    page: {
                        curr: 1
                    }
                    , where: {
                        hourName:data.field.hourName,
                    }
                    ,text:{none:'无数据'}
                }, 'data');

                return false;
            });

        });
    </script>

</body>
</html>
