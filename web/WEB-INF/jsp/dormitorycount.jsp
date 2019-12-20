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
    <div class="x-nav">
        <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
            <i class="layui-icon" style="line-height:38px">ဂ</i></a>
    </div>

    <div class="layui-row">
        <fieldset class="layui-elem-field layuimini-search">
            <legend>搜素信息</legend>
            <div style="margin: 10px">
                <form class="layui-form layui-form-pane">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">部门名称</label>
                            <div class="layui-input-inline"  >
                                <select name="depid" id="selectDep">
                                    <option value="">请选择</option>

                                </select>
                            </div>
                        </div>

                        <div class="layui-inline">
                            <label class="layui-form-label">部门名称</label>
                            <div class="layui-input-inline"  >
                                <select name="depid" id="selectDep1">
                                    <option value="">请选择</option>

                                </select>
                            </div>
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
                        ,{field:'status',title: '空位数'}
                    ]
                ]
                ,limits: [5,10,20,50]
            });

        });
    </script>

</body>
</html>
