<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/12/17
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE HTML>
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
                            <label class="layui-form-label">部门名称</label>
                            <div class="layui-input-inline"  >
                                <select name="depid" id="selectDep">
                                    <option value="">请选择</option>
                                    <c:forEach items="${depVos}" var="deps">
                                        <option value="${deps.depid}">${deps.depName}</option>
                                    </c:forEach>
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

    <div class="layui-row">
        <div class="layui-tab">
            <ul class="layui-tab-title">
                <li>员工考核各项得分详情</li>
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
                ,url:'${pageContext.request.contextPath}/sysreport/empassess'
                ,page: true
                ,method:'post'
                ,limit:10
                ,cols: [
                    [
                        {type:'radio'}//开启单选框
                        ,{field:'empID',title: '员工编号'}
                        ,{field:'empName', title: '员工名称'}
                        ,{field:'depName', title: '部门名称'}
                        ,{field:'sex',title: '性别'}
                        ,{field:'phone',title: '手机号码'}
                        ,{field:'ascore',title: '考核总分'}
                    ]
                ]
                ,limits: [5,10,20,50]
            });

            table.on('row(complainList)',function (obj) {
                var data = obj.data;    //当前行数据
                var empID = data.empID;
                obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');   //选中样式
                obj.tr.find('i[class="layui-anim layui-icon"]').trigger("click");  //单机选中单选框
                addTable(empID);
            });
            
            function addTable(empID) {
                table.render({
                    elem:'#kh',
                    url:'${pageContext.request.contextPath}/sysreport/xq/?empID=' + empID,
                    method:'post',
                    cols:[
                        [
                            {field:'checkContent',title: '考核内容'},
                            {field:'empName',title: '员工姓名'},
                            {field:'checkScore',title: '考核分数'},
                            {field:'checkDate',title: '考核时间', templet:function (row){
                                    return createTime(row.checkDate);
                                }},
                            {field:'imageName',title: '图片'},
                            {field:'inputEmp',title: '录入人员'},
                            {field:'checkExplain',title: '说明'}
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
