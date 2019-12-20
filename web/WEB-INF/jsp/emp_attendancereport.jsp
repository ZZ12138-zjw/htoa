<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/12/18
  Time: 20:33
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
                            <label class="layui-form-label">员工姓名</label>
                            <div class="layui-input-inline">
                                <input name="empName" autocomplete="off" class="layui-input">
                            </div>
                        </div>

                        <div class="layui-inline">
                            <input type="radio" name="month" value="全部月份" title="全部月份">
                            <input type="radio" name="month" value="本月（12月)" title="本月（12月)" checked>
                            <input type="radio" name="month" value="上月（11月)" title="上月（11月)" checked>
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
                ,url:'${pageContext.request.contextPath}/sysreport/empattendance'
                ,page: true
                ,method:'post'
                ,limit:10
                ,cols: [
                    [
                        {field:'attId',title: 'ID'}
                        ,{field:'empName', title: '员工姓名'}
                        ,{field:'notTime', title: '未打卡时间',templet:function (row){
                            return createTime(row.notTime);
                        }}
                        ,{field:'explanation',title: '原因'}
                        ,{field:'auditor',title: '审核人'}
                        ,{field:'auditorEx',title: '审核说明'}
                        ,{field:'auditorTime',title: '审核时间'}
                        ,{field:'status',title: '审核状态'}
                    ]
                ]
                ,limits: [5,10,20,50]
            });

            function createTime(v){
                var date = new Date(v);
                var y = date.getFullYear();
                var m = date.getMonth()+1;
                m = m<10?'0'+m:m;
                var d = date.getDate();
                d = d<10?("0"+d):d;
                var str = y+"-"+m+"-"+d;
                return str;
            }

        });
    </script>
</body>
</html>
