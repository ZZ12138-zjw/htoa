<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/12/16
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>考试成绩</title>
    <jsp:include page="top.jsp"></jsp:include>
</head>
<body>



    <div class="x-nav">
        <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
            <i class="layui-icon" style="line-height:38px">ဂ</i></a>
    </div>
    <div class="layui-row">
        <fieldset class="layui-elem-field layuimini-search">
            <legend>搜索信息</legend>
            <div style="margin: 10px">
                <form class="layui-form layui-form-pane">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">在读学期</label>
                            <div class="layui-input-inline"  >
                                <select name="termid">
                                    <option value="" class="layui-input">请选择</option>
                                    <c:forEach items="${termList}" var="tet">
                                        <option value="${tet.termid}">${tet.termName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="layui-inline">
                            <label class="layui-form-label">班级名称</label>
                            <div class="layui-input-inline"  >
                                <select name="classId">
                                    <option value="">请选择</option>
                                    <c:forEach items="${classList}" var="clt">
                                        <option value="${clt.classId}">${clt.className}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="layui-inline">
                            <label class="layui-form-label">考试类别</label>
                            <div class="layui-input-inline"  >
                                <select name="testType">
                                    <option value="">请选择</option>
                                    <c:forEach items="${testtypeList}" var="ty">
                                        <option value="${ty.typeId}">${ty.typeName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="layui-inline">
                            <label class="layui-form-label">课程名称</label>
                            <div class="layui-input-inline"  >
                                <select name="courseId">
                                    <option value="">请选择</option>
                                    <c:forEach items="${courseList}" var="cour">
                                        <option value="${cour.courseid}">${cour.courseName}</option>
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
    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm" onclick="x_admin_show('添加学生科目成绩','<%=request.getContextPath()%>/testscore/toAddScore')"><i class="layui-icon"></i>批量添加</button>
        </div>
    </script>
    <script>
        layui.use(['table','form','layer'],function () {
            var table = layui.table,
                form = layui.form,
                layer = layui.layer;

            table.render({
                id:"idTest"
                ,elem: '#idTest'
                ,toolbar:'#toolbarDemo'
                ,height:500
                ,url:'${pageContext.request.contextPath}/testscore/tse'
                ,page: true
                ,method:'post'
                ,limit:10
                ,cols:[[
                        {field:'scoreId', width:100,title: '编号'}
                        ,{field:'stuName',width:150, title: '学生姓名'}
                        ,{field:'score',width:150, title: '分数'}
                        ,{field:'rescore',width:150, title: '补考分数'}
                        ,{field:'courseName',width:150, title: '课程名称'}
                        ,{field:'typeName',width:150, title: '考试类别'}
                        ,{field:'termName',width:150, title: '在读学期'}
                        ,{field:'scoreTime',width:150, title: '考试时间', templet:function (row){
                            return getNowFormatDate(row.scoreTime);
                        }}
                        ,{field:'empName',width:200, title: '录用人员'}
                        ,{field:'remark',width:200, title: '备注'}
                ]]
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

            function getNowFormatDate(t) {
                var date = new Date(t);
                var seperator1 = "-";
                var seperator2 = ":";
                var month = date.getMonth() + 1;
                var strDate = date.getDate();
                if (month >= 1 && month <= 9) {
                    month = "0" + month;
                }
                if (strDate >= 0 && strDate <= 9) {
                    strDate = "0" + strDate;
                }
                var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
                    + " " + date.getHours() + seperator2 + date.getMinutes()
                    + seperator2 + date.getSeconds();
                return currentdate;
            }

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
                        termid:data.field.termid,
                        classId:data.field.classId,
                        testType:data.field.testType,
                        courseId:data.field.courseId
                    }
                    ,text:{none:'无数据'}
                }, 'data');
                return false;
            });
        });
    </script>
</body>
</html>
