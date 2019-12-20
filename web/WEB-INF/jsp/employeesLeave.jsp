<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/12/19
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
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

    <div class="layui-row">
        <div class="layui-tab">
            <ul class="layui-tab-title">
                <li>请假详情</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <table id="kh" lay-filter="em"></table>
                </div>
            </div>
        </div>
    </div>

    <script>
        layui.use(['table','form','layer'],function () {
            var table = layui.table,
                form = layui.form,
                layer = layui.layer;

            table.render({
                id:"idTest"
                ,elem: '#idTest'
                ,url:'${pageContext.request.contextPath}/sysreport/employeesLeavekh'
                ,page: true
                ,method:'post'
                ,limit:10
                ,cols: [
                    [
                        {type:'radio'}//开启单选框
                        ,{field:'empid',title: 'ID'}
                        ,{field:'empName', title: '员工姓名'}
                        ,{field:'qjcs',title: '请假次数'}
                        ,{field:'tshu',title: '天数'}
                    ]
                ]
                ,limits: [5,10,20,50]
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
                        empName:data.field.empName,
                    }
                    ,text:{none:'无数据'}
                }, 'data');
                7
                return false;
            });

            table.on('row(complainList)',function (obj) {
                var data = obj.data;    //当前行数据
                var empid = data.empid;
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');   //选中样式
                obj.tr.find('i[class="layui-anim layui-icon"]').trigger("click");  //单机选中单选框
                addTable(empid);
            });

            function addTable(empid) {
                table.render({
                    elem:'#kh',
                    url:'${pageContext.request.contextPath}/sysreport/empqjxq/?empid=' + empid,
                    method:'post',
                    cols:[
                        [
                            {field:'empName',title: '员工姓名'},
                            {field:'holidayDay',title: '请假天数'},
                            {field:'startTime',title: '开始时间', templet:function (row){
                                    return createTime(row.startTime);
                                }},
                            {field:'endTime',title: '结束时间', templet:function (row){
                                    return createTime(row.endTime);
                                }},
                            {field:'title',title: '类型'},
                            {field:'remark',title: '备注'},
                            {field:'status',title: '状态',templet:function (row) {
                                    if (row.status==1){
                                        return "<span>审批中</span>"
                                    }else if(row.status==2){
                                        return "<span>已完成</span>"
                                    }else if(row.status==3){
                                        return "<span>不批准</span>"
                                    }
                                }}
                        ]
                    ]
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

            }
        });
    </script>
</body>
</html>
