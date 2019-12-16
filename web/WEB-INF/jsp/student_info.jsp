<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 小燕
  Date: 2019/12/5
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>所有学生信息</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
</head>
<body>
<div class="layui-row">
    <fieldset class="layui-elem-field layuimini-search">
        <legend>搜索信息</legend>
        <div style="margin: 10px 10px 10px 10px">
            <form class="layui-form layui-form-pane" action="">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">学生姓名</label>
                        <div class="layui-input-inline">
                            <input type="text" name="stuName" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">学生电话</label>
                        <div class="layui-input-inline">
                            <input type="number" name="phone" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">学生班级</label>
                        <div class="layui-input-inline">
                            <select name="classid">
                                <option value="" class="layui-input">--选择班级--</option>
                                <c:forEach items="${requestScope.classes}" var="cla">
                                    <option value="${cla.classId}">${cla.className}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">宿舍房号</label>
                        <div class="layui-input-inline">
                            <select name="hourid">
                                <option value="" class="layui-input">--选择宿舍--</option>
                                <c:forEach items="${requestScope.hours}" var="hour">
                                    <option value="${hour.hourId}">${hour.hourName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">学生状态</label>
                        <div class="layui-input-inline">
                            <select name="state">
                                <option value="" class="layui-input">--选择学生状态--</option>
                                <option value="1">在读</option>
                                <option value="2">休学</option>
                                <option value="3">退学</option>
                                <option value="4">毕业</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <a class="layui-btn" lay-submit="" lay-filter="data-search-btn">搜索</a>
                    </div>
                </div>
            </form>
        </div>
    </fieldset>
</div>
<div class="layui-row">
    <table id="demo" lay-filter="test"></table>
</div>
<div class="layui-row">
    <div class="layui-tab">
        <ul class="layui-tab-title">
            <li>家庭情况</li>
            <li>教育经历</li>
            <li>在校情况</li>
            <li>请假记录</li>
            <li>答辩总成绩资料</li>
            <li>考试成绩</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <xblock>
                    <button class="layui-btn layui-btn-sm layui-btn-primary" id="jtxxAdd">
                        <i class="layui-icon">&#xe654;</i>
                        添加
                    </button>
                </xblock>
                <table id="fal" lay-filter="other1"></table>
            </div>
            <div class="layui-tab-item">
                <xblock>
                    <button class="layui-btn layui-btn-sm layui-btn-primary" id="jyjlAdd">
                        <i class="layui-icon">&#xe654;</i>
                        添加
                    </button>
                </xblock>
                <table id="edu" lay-filter="other2"></table>
            </div>
            <div class="layui-tab-item">
                <xblock>
                    <button class="layui-btn layui-btn-sm layui-btn-primary" id="zxqkAdd">
                        <i class="layui-icon">&#xe654;</i>
                        添加
                    </button>
                </xblock>
                <table id="stuHap" lay-filter="other3"></table>
            </div>
            <div class="layui-tab-item">
                <xblock>
                    <button class="layui-btn layui-btn-sm layui-btn-primary" id="xsqjAdd">
                        <i class="layui-icon">&#xe654;</i>
                        添加
                    </button>
                </xblock>
                <table id="holiday" lay-filter="other4"></table>
            </div>
            <div class="layui-tab-item">
                <xblock>
                    <button class="layui-btn layui-btn-sm layui-btn-primary" id="xmdbAdd">
                        <i class="layui-icon">&#xe654;</i>
                        添加
                    </button>
                </xblock>
                <table id="replyScore" lay-filter="other5"></table>
            </div>
            <div class="layui-tab-item">
                <xblock>
                    <button class="layui-btn layui-btn-sm layui-btn-primary" id="kscjAdd">
                        <i class="layui-icon">&#xe654;</i>
                        添加
                    </button>
                </xblock>
                <table id="score" lay-filter="other6"></table>
            </div>
        </div>
    </div>
</div>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" onclick="x_admin_show('添加学生','<%=request.getContextPath()%>/student/toAdd')"><i class="layui-icon"></i>添加</button>
    </div>
</script>
<script type="text/html" id="falbar">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" onclick="x_admin_show('添加学生家庭亲属信息','<%=request.getContextPath()%>/student/stuFal/toAdd')"><i class="layui-icon"></i>添加</button>
        <button class="layui-btn layui-btn-sm" ><i class="layui-icon layui-icon-delete"></i>删除</button>
    </div>
</script>
<script type="text/html" id="edubar">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" onclick="x_admin_show('添加学生教育经历','<%=request.getContextPath()%>/student/stuEdu/toAdd')"><i class="layui-icon"></i>添加</button>
        <button class="layui-btn layui-btn-sm" ><i class="layui-icon layui-icon-delete"></i>删除</button>
    </div>
</script>
<script type="text/html" id="hapbar">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" onclick="x_admin_show('添加学生在校情况','<%=request.getContextPath()%>/student/stuHap/toAdd')"><i class="layui-icon"></i>添加</button>
        <button class="layui-btn layui-btn-sm" ><i class="layui-icon layui-icon-delete"></i>删除</button>
    </div>
</script>
<script type="text/html" id="holidaybar">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" onclick="x_admin_show('添加学生请假信息','<%=request.getContextPath()%>/student/holiday/toAdd')"><i class="layui-icon"></i>添加</button>
        <button class="layui-btn layui-btn-sm" ><i class="layui-icon layui-icon-delete"></i>删除</button>
    </div>
</script>
<script type="text/html" id="replybar">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" onclick="x_admin_show('添加学生项目答辩成绩','<%=request.getContextPath()%>/student/replyScore/toAdd')"><i class="layui-icon"></i>添加</button>
        <button class="layui-btn layui-btn-sm" ><i class="layui-icon layui-icon-delete"></i>删除</button>
    </div>
</script>
<script type="text/html" id="scorebar">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" onclick="x_admin_show('添加学生学科成绩','<%=request.getContextPath()%>/student/score/toAdd')"><i class="layui-icon"></i>添加</button>
        <button class="layui-btn layui-btn-sm" ><i class="layui-icon layui-icon-delete"></i>删除</button>
    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script type="text/html" id="otherbar1">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit" >编辑</a>
</script>
<script type="text/html" id="otherbar2">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
</script>
<script type="text/html" id="otherbar3">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
</script>
<script type="text/html" id="otherbar4">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
</script>
<script type="text/html" id="otherbar5">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
</script>
<script type="text/html" id="otherbar6">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
</script>

<script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;
        var form = layui.form;
        //第一个实例
        table.render({
            elem: '#demo'
            ,height: 500
            ,url:'<%=request.getContextPath()%>/student/selectAll'
            ,toolbar: '#toolbarDemo'//开启头部工具栏，并为其绑定左侧模板
            ,page: true //开启分页
            ,method:'post'
            ,limit:10
            ,cols: [[ //表头
                {type:'radio',width:50}//开启多选框
                ,{field: 'stuId', title: '学生编号', width:100, sort: true}
                ,{field: 'stuName', title: '学生姓名', width:100, sort: true}
                ,{field: 'stuno', title: '学号', width:70}
                ,{field: 'sex', title: '性别', width:70, sort: true}
                ,{field: 'cardid', title: '身份证', width:180}
                ,{field: 'phone', title: '联系方式', width: 140}
                ,{field: 'className', title: '班级名称', width: 250, sort: true}
                ,{field: 'hourName', title: '宿舍房号', width: 140, sort: true}
                ,{field: 'state', title: '学生状态', width: 100,templet:function (d) {
                        if(d.state=="1"){
                            return "在读";
                        }else if(d.state=="2"){
                            return "休学";
                        }else if(d.state=="3"){
                            return "退学";
                        }else if(d.state=="4"){
                            return "毕业";
                        }
                    }}
                ,{field: 'collar', title: '是否领用电脑', width: 135, sort: true}
                ,{field: 'grants', title: '享受助学金', width: 100}
                ,{field: 'computer', title: '是否送电脑', width: 135, sort: true}
                ,{field: 'parents', title: '家长姓名', width: 135, sort: true}
                ,{field: 'parentsphone', title: '家长电话', width: 135, sort: true}
                ,{field: 'qkMoney', title: '欠款金额', width: 135, sort: true}
                ,{field: 'right',align:'center', title:'操作', toolbar: '#barDemo', width:200}
            ]]
            ,id:'stuReload'
            ,limits: [5,10,20,50]
        });
        
        $("#jtxxAdd").on("click",function () {
            var checkStatus = table.checkStatus('stuReload');
            var data=checkStatus.data;
            if(data==""){
                layer.msg("请选择学生");
            }else {
                var stuId = "";
                $.each(data,function (i,val) {
                    stuId=val.stuId;
                });
                x_admin_show("添加学生家庭信息","<%=request.getContextPath()%>/student/stuFal/toAdd?stuId="+stuId);
            }
        });

        $("#jyjlAdd").on("click",function () {
            var checkStatus = table.checkStatus('stuReload');
            var data=checkStatus.data;
            if(data==""){
                layer.msg("请选择学生");
            }else {
                var stuId = "";
                $.each(data,function (i,val) {
                    stuId=val.stuId;
                });
                x_admin_show("添加学生教育经历","<%=request.getContextPath()%>/student/stuEdu/toAdd?stuId="+stuId);
            }
        });

        $("#zxqkAdd").on("click",function () {
            var checkStatus = table.checkStatus('stuReload');
            var data=checkStatus.data;
            if(data==""){
                layer.msg("请选择学生");
            }else {
                var stuId = "";
                $.each(data,function (i,val) {
                    stuId=val.stuId;
                });
                x_admin_show("添加学生在校情况","<%=request.getContextPath()%>/student/stuHap/toAdd?stuId="+stuId);
            }
        });

        $("#xmdbAdd").on("click",function () {
            var checkStatus = table.checkStatus('stuReload');
            var data=checkStatus.data;
            if(data==""){
                layer.msg("请选择学生");
            }else {
                var stuId = "";
                $.each(data,function (i,val) {
                    stuId=val.stuId;
                });
                x_admin_show("添加学生项目答辩成绩","<%=request.getContextPath()%>/student/replyScore/toAdd?stuId="+stuId);
            }
        });

        $("#kscjAdd").on("click",function () {
            var checkStatus = table.checkStatus('stuReload');
            var data=checkStatus.data;
            if(data==""){
                layer.msg("请选择学生");
            }else {
                var stuId = "";
                $.each(data,function (i,val) {
                    stuId=val.stuId;
                });
                x_admin_show("添加学生考试成绩","<%=request.getContextPath()%>/student/score/toAdd?stuId="+stuId);
            }
        });

        $("#xsqjAdd").on("click",function () {
            var checkStatus = table.checkStatus('stuReload');
            var data=checkStatus.data;
            if(data==""){
                layer.msg("请选择学生");
            }else {
                var stuId = "";
                $.each(data,function (i,val) {
                    stuId=val.stuId;
                });
                x_admin_show("添加学生请假信息","<%=request.getContextPath()%>/student/holiday/toAdd?stuId="+stuId);
            }
        });




        form.on('submit(data-search-btn)',function (data) {
            table.reload('stuReload',{
                page:{
                    curr:1
                }
                ,where:{

                    stuName:data.field.stuName,
                    phone:data.field.phone,
                    classid:data.field.classid,
                    hourid:data.field.hourid,
                    state:data.field.state,
                }
                ,text:{none:'无数据'}
            },'data');
            return false;
        })
        table.on('tool(test)',function (obj) {
            var data = obj.data; //获取当前行的数据
            var layEvent =  obj.event; //获取lay-event对应的值
            var tr = obj.tr;//获取当前行

            if(layEvent == 'del'){//删除
                layer.confirm('真的删除么',function (index) {
                    alert(data.stuId);
                    $.ajax({
                        url:'${pageContext.request.contextPath}/student/delStu',
                        type:'post',
                        data:{
                            stuId:data.stuId
                        },
                        dataType:'json',
                        success:function (data){
                            layer.alert("删除成功", {icon: 6});
                        }
                    });
                    obj.del(); //删除对应行（tr）的DOM结构，并更新 缓存
                    layer.close(index);
                });
            }else if(layEvent == 'edit'){//编辑
                x_admin_show('修改学生信息','<%=request.getContextPath()%>/student/toUpdate?stuId='+data.stuId);
            }
        });
        table.on('row(test)',function(obj){
            var oo = obj.tr; //得到当前行元素对象
            var data = obj.data; //得到当前行数据
            var stuId = data.stuId;
            var stuName = data.stuName;
            selected =  data;
            //选中行样式
            obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
            //选中radio样式
            obj.tr.find('i[class="layui-anim layui-icon"]').trigger("click");
            addTable(stuId,stuName);
        });
        function addTable(studentId,studentName){
            table.render({
                elem:"#fal"
                ,url: '<%=request.getContextPath()%>/student/stuFal/select?stuId='+studentId
                ,method:'post'
                ,cols: [[
                    {field: 'familyid', title: '亲属姓名', width:100,hide:true}
                    ,{field: 'stuName', title: '学生姓名', width:100, sort: true,templet:function (d) {
                            return studentName+""
                        }}
                    ,{field: 'familyname', title: '亲属姓名', width:100, sort: true}
                    ,{field: 'relation', title: '与学生关系', width:120}
                    ,{field: 'familyphone', title: '亲属电话', width:120, sort: true}
                    ,{field: 'right',align:'center', title:'操作', toolbar: '#otherbar1', width:200}
                ]]
            });
            table.render({
                elem:'#edu'
                ,url:'<%=request.getContextPath()%>/student/stuEdu/select?stuId='+studentId
                ,method:'post'
                ,cols:[[
                    {field: 'eduid', width:100,hide:true}
                    ,{field: 'stuName', title: '学生姓名', width:100, sort: true,templet:function (d) {
                            return studentName+""
                        }}
                    ,{field: 'school', title: '就读学校', width:100, sort: true}
                    ,{field: 'begindate', title: '开始时间',width:120,templet:function (d) {
                            return createTime(d.begindate);
                        }}
                    ,{field: 'enddate', title: '结束时间', width:120, sort: true,templet:function (d) {
                            return createTime(d.enddate);
                        }}
                    ,{field: 'right',align:'center', title:'操作', toolbar: '#otherbar2', width:200}
                ]]
            });
            table.render({
                elem:'#stuHap'
                ,url:'<%=request.getContextPath()%>/student/stuHap/select?stuId='+studentId
                ,method:'post'
                ,cols:[[
                    {field: 'happenid', width:200,hide:true}
                    ,{field: 'stuName', title: '学生姓名', width:100, sort: true,templet:function (d) {
                            return studentName+""
                        }}
                    ,{field: 'happening', title: '情况记录', width:200, sort: true}
                    ,{field: 'optime', title: '记录时间', width:120, templet:function (d){
                            return createTime(d.optime);
                        }}
                    ,{field: 'empName', title: '记录人', width:100, sort: true}
                    ,{field: 'right',align:'center', title:'操作', toolbar: '#otherbar3', width:200}
                ]]
            });
            /*table.render({
                elem:'#holiday'
                ,toolbar:'#holidaybar'
                ,url:'<%=request.getContextPath()%>/student/holiday/select?studentId='+studentId
                ,method:'post'
                ,cols:[[
                    {field: 'stuName', title: '学生姓名', width:100, sort: true}
                    ,{field: 'holidayDay', title: '假期天数', width:100, sort: true}
                    ,{field: 'startTime', title: '开始时间', width:70}
                    ,{field: 'endTime', title: '结束时间', width:70, sort: true}
                    ,{field: 'Remark', title: '请假原因', width:70, sort: true}
                    ,{field: 'right',align:'center', title:'操作', toolbar: '#otherbar4', width:200}
                ]]
            })*/
            table.render({
                elem:'#replyScore'
                ,method:'post'
                ,url:'<%=request.getContextPath()%>/student/replyScore/select?stuId='+studentId
                ,cols:[[
                    {field: 'replyId', width:100,hide:true}
                    ,{field: 'proName', title: '项目答辩名称', width:120, sort: true}
                    ,{field: 'empName', title: '打分老师', width:100, sort: true}
                    ,{field: 'score1', title: '功能完善(满分50)', width:150}
                    ,{field: 'score2', title: '技术难度(满分10)', width:150, sort: true}
                    ,{field: 'score3', title: '界面完美(满分10)', width:150, sort: true}
                    ,{field: 'score4', title: '回答问题(满分10)', width:150, sort: true}
                    ,{field: 'score5', title: '演示方法(满分10)', width:150, sort: true}
                    ,{field: 'score6', title: '语言表达(满分10)', width:150, sort: true}
                    ,{field: 'score7', title: '总分(满分100)', width:150, sort: true}
                    ,{field: 'remark', title: '备注', width:100, sort: true}
                    ,{field: 'right',align:'center', title:'操作', toolbar: '#otherbar5', width:200}
                ]]
            });
            table.render({
                elem:'#score'
                ,method:'post'
                ,url:'<%=request.getContextPath()%>/student/score/select?stuId='+studentId
                ,cols:[[
                    {field: 'scoreId', width:100,hide:true}
                    ,{field: 'stu', title: '学生姓名', width:100, sort: true,templet:function (d) {
                            return studentName+""}}
                    ,{field: 'score', title: '学生成绩', width:100, sort: true}
                    ,{field: 'courseName', title: '课程名称', width:100}
                    ,{field: 'typeName', title: '考试类别', width:120, sort: true}
                    ,{field: 'termName', title: '在读学期', width:120, sort: true}
                    ,{field: 'scoreTime', title: '考试时间', width:150, sort: true,templet:function (d) {
                            return getNowFormatDate(d.scoreTime);
                        }}
                    ,{field: 'remark', title: '备注', width:150, sort: true}
                    ,{field: 'right',align:'center', title:'操作', toolbar: '#otherbar6', width:200}
                ]]
            });
            table.on('tool(other1)',function (obj) {
                var data = obj.data; //获取当前行的数据
                var layEvent =  obj.event; //获取lay-event对应的值
                var tr = obj.tr;//获取当前行

                if(layEvent == 'del'){//删除
                    layer.confirm('真的删除么',function (index) {
                        alert(data.stuId);
                        $.ajax({
                            url:'${pageContext.request.contextPath}/other/stuFal/del',
                            type:'post',
                            data:{
                                familyid:data.familyid
                            },
                            dataType:'json',
                            success:function (data){
                                layer.alert("删除成功", {icon: 6});
                            }
                        });
                        obj.del(); //删除对应行（tr）的DOM结构，并更新 缓存
                        layer.close(index);
                    });
                }else if(layEvent == 'edit'){//编辑
                    x_admin_show('修改学生家庭信息','<%=request.getContextPath()%>/other/stuFal/toUpdate?familyid='+data.familyid);
                }
            })
            table.on('tool(other2)',function (obj) {
                var data = obj.data; //获取当前行的数据
                var layEvent =  obj.event; //获取lay-event对应的值
                var tr = obj.tr;//获取当前行

                if(layEvent == 'del'){//删除
                    layer.confirm('真的删除么',function (index) {
                        alert(data.stuId);
                        $.ajax({
                            url:'${pageContext.request.contextPath}/other/stuEdu/del',
                            type:'post',
                            data:{
                                Eduid:data.Eduid
                            },
                            dataType:'json',
                            success:function (data){
                                layer.alert("删除成功", {icon: 6});
                            }
                        });
                        obj.del(); //删除对应行（tr）的DOM结构，并更新 缓存
                        layer.close(index);
                    });
                }else if(layEvent == 'edit'){//编辑
                    x_admin_show('修改教育经历','<%=request.getContextPath()%>/other/stuEdu/toUpdate?Eduid='+data.eduid);
                }
            })
            table.on('tool(other3)',function (obj) {
                var data = obj.data; //获取当前行的数据
                var layEvent =  obj.event; //获取lay-event对应的值
                var tr = obj.tr;//获取当前行

                if(layEvent == 'del'){//删除
                    layer.confirm('真的删除么',function (index) {
                        alert(data.stuId);
                        $.ajax({
                            url:'${pageContext.request.contextPath}/other/stuHap/del',
                            type:'post',
                            data:{
                                happenid:data.happenid
                            },
                            dataType:'json',
                            success:function (data){
                                layer.alert("删除成功", {icon: 6});
                            }
                        });
                        obj.del(); //删除对应行（tr）的DOM结构，并更新 缓存
                        layer.close(index);
                    });
                }else if(layEvent == 'edit'){//编辑
                    x_admin_show('修改学生信息','<%=request.getContextPath()%>/other/stuHap/toUpdate?happenid='+data.happenid);
                }
            })
            table.on('tool(other4)',function (obj) {
                var data = obj.data; //获取当前行的数据
                var layEvent =  obj.event; //获取lay-event对应的值
                var tr = obj.tr;//获取当前行

                if(layEvent == 'del'){//删除
                    layer.confirm('真的删除么',function (index) {
                        alert(data.stuId);
                        $.ajax({
                            url:'${pageContext.request.contextPath}/other/holiday/del',
                            type:'post',
                            data:{
                                holidayId:data.holidayId
                            },
                            dataType:'json',
                            success:function (data){
                                layer.alert("删除成功", {icon: 6});
                            }
                        });
                        obj.del(); //删除对应行（tr）的DOM结构，并更新 缓存
                        layer.close(index);
                    });
                }else if(layEvent == 'edit'){//编辑
                    x_admin_show('修改学生信息','<%=request.getContextPath()%>/other/holiday/toUpdate?holidayId='+data.holidayId);
                }
            })
            table.on('tool(other5)',function (obj) {
                var data = obj.data; //获取当前行的数据
                var layEvent =  obj.event; //获取lay-event对应的值
                var tr = obj.tr;//获取当前行

                if(layEvent == 'del'){//删除
                    layer.confirm('真的删除么',function (index) {
                        alert(data.stuId);
                        $.ajax({
                            url:'${pageContext.request.contextPath}/other/replyScore/del',
                            type:'post',
                            data:{
                                replyId:data.replyId
                            },
                            dataType:'json',
                            success:function (data){
                                layer.alert("删除成功", {icon: 6});
                            }
                        });
                        obj.del(); //删除对应行（tr）的DOM结构，并更新 缓存
                        layer.close(index);
                    });
                }else if(layEvent == 'edit'){//编辑
                    x_admin_show('修改学生信息','<%=request.getContextPath()%>/other/replyScore/toUpdate?replyId='+data.replyId);
                }
            })
            table.on('tool(other6)',function (obj) {
                var data = obj.data; //获取当前行的数据
                var layEvent =  obj.event; //获取lay-event对应的值
                var tr = obj.tr;//获取当前行

                if(layEvent == 'del'){//删除
                    layer.confirm('真的删除么',function (index) {
                        alert(data.stuId);
                        $.ajax({
                            url:'${pageContext.request.contextPath}/other/score/del',
                            type:'post',
                            data:{
                                scoreId:data.scoreId
                            },
                            dataType:'json',
                            success:function (data){
                                layer.alert("删除成功", {icon: 6});
                            }
                        });
                        obj.del(); //删除对应行（tr）的DOM结构，并更新 缓存
                        layer.close(index);
                    });
                }else if(layEvent == 'edit'){//编辑
                    x_admin_show('修改学生信息','<%=request.getContextPath()%>/other/score/toUpdate?scoreId='+data.scoreId);
                }
            })
        }
    });

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
</script>
</body>
</html>
