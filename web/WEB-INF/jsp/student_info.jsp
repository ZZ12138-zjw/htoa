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

<xblock>
    <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
</xblock>
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
                <table id="fal" lay-filter="other1"></table>
            </div>
            <div class="layui-tab-item">
                <table id="edu" lay-filter="other2"></table>
            </div>
            <div class="layui-tab-item">
                <table id="stuHap" lay-filter="other3"></table>
            </div>
            <div class="layui-tab-item">
                <table id="holiday" lay-filter="other4"></table>
            </div>
            <div class="layui-tab-item">
                <table id="replyScore" lay-filter="other5"></table>
            </div>
            <div class="layui-tab-item">
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

<script type="text/html" id="otherbar">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
</script>

<script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#demo'
            ,height: 312
            ,url:'<%=request.getContextPath()%>/student/testdata'
            ,toolbar: '#toolbarDemo'//开启头部工具栏，并为其绑定左侧模板
            ,page: true //开启分页
            ,method:'post'
            ,limit:10
            ,cols: [[ //表头
                {checkbox:true}//开启多选框
                ,{field: 'stuId', title: '学生编号', width:100, sort: true}
                ,{field: 'stuName', title: '学生姓名', width:100, sort: true}
                ,{field: 'stuno', title: '学号', width:70}
                ,{field: 'sex', title: '性别', width:70, sort: true}
                ,{field: 'cardid', title: '身份证', width:180}
                ,{field: 'phone', title: '联系方式', width: 140}
                ,{field: 'className', title: '班级名称', width: 250, sort: true}
                ,{field: 'hourName', title: '宿舍房号', width: 140, sort: true}
                ,{field: 'state', title: '学生状态', width: 100}
                ,{field: 'collar', title: '是否领用电脑', width: 135, sort: true}
                ,{field: 'grants', title: '享受助学金', width: 100}
                ,{field: 'computer', title: '是否送电脑', width: 135, sort: true}
                ,{field: 'parents', title: '家长姓名', width: 135, sort: true}
                ,{field: 'parentsphone', title: '家长电话', width: 135, sort: true}
                ,{field: 'qkMoney', title: '欠款金额', width: 135, sort: true}
                ,{field: 'right',align:'center', title:'操作', toolbar: '#barDemo', width:200}
            ]]
            ,limits: [5,10,20,50]
        });
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
        table.on('tool(other1)',function (obj) {
            var data = obj.data;//获取当前数据
            var layevent = obj.event;//获取lay-event对应的值
            var tr = obj.tr;//获取当前行的dom元素
            if(layevent == "edit"){
                x_admin_show('修改学生','<%=request.getContextPath()%>/student/stuFal/toUpdate?stuId='+data.stuId);
            }else if(layevent == "add"){

            }
        })
        table.on('rowDouble(test)',function(obj){
            var oo = obj.tr; //得到当前行元素对象
            var o = obj.data; //得到当前行数据
            var stuId = o.stuId;
            var stuName = o.stuName;
            addTable(stuId,stuName);
        });
        function addTable(studentId,studentName){
            table.render({
                elem:"#fal"
                ,toolbar:'#falbar'
                ,url: '<%=request.getContextPath()%>/student/stuFal/select?stuId='+studentId
                ,method:'post'
                ,cols: [[
                    {field: 'stuName', title: '学生姓名', width:100, sort: true,templet:function (d) {
                            return studentName+""
                        }}
                    ,{field: 'familyname', title: '亲属姓名', width:100, sort: true}
                    ,{field: 'relation', title: '与学生关系', width:120}
                    ,{field: 'familyphone', title: '亲属电话', width:120, sort: true}
                    ,{field: 'right',align:'center', title:'操作', toolbar: '#otherbar', width:200}
                ]]
            });
            table.render({
                elem:'#edu'
                ,toolbar:'#edubar'
                ,url:'<%=request.getContextPath()%>/student/stuEdu/select?stuId='+studentId
                ,method:'post'
                ,cols:[[
                    {field: 'stuName', title: '学生姓名', width:100, sort: true,templet:function (d) {
                            return studentName+""
                        }}
                    ,{field: 'school', title: '就读学校', width:100, sort: true}
                    ,{field: 'begindate', title: '开始时间', width:120}
                    ,{field: 'enddate', title: '结束时间', width:120, sort: true}
                    ,{field: 'right',align:'center', title:'操作', toolbar: '#otherbar', width:200}
                ]]
            });
            table.render({
                elem:'#stuHap'
                ,toolbar:'#hapbar'
                ,url:'<%=request.getContextPath()%>/student/stuHap/select?stuId='+studentId
                ,method:'post'
                ,cols:[[
                    {field: 'stuName', title: '学生姓名', width:100, sort: true,templet:function (d) {
                            return studentName+""
                        }}
                    ,{field: 'happening', title: '情况记录', width:200, sort: true}
                    ,{field: 'optime', title: '记录时间', width:120, templet:function (row){
                            return createTime(row.optime);
                        }}
                    ,{field: 'empName', title: '记录人', width:100, sort: true}
                    ,{field: 'right',align:'center', title:'操作', toolbar: '#otherbar', width:200}
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
                    ,{field: 'right',align:'center', title:'操作', toolbar: '#otherbar', width:200}
                ]]
            })*/
            table.render({
                elem:'#replyScore'
                ,toolbar:'#replybar'
                ,method:'post'
                ,url:'<%=request.getContextPath()%>/student/replyScore/select?stuId='+studentId
                ,cols:[[
                    {field: 'proName', title: '项目答辩名称', width:100, sort: true}
                    ,{field: 'empName', title: '打分老师', width:100, sort: true}
                    ,{field: 'score1', title: '功能完善(满分50)', width:150}
                    ,{field: 'score2', title: '技术难度(满分10)', width:150, sort: true}
                    ,{field: 'score3', title: '界面完美(满分10)', width:150, sort: true}
                    ,{field: 'score4', title: '回答问题(满分10)', width:150, sort: true}
                    ,{field: 'score5', title: '演示方法(满分10)', width:150, sort: true}
                    ,{field: 'score6', title: '语言表达(满分10)', width:150, sort: true}
                    ,{field: 'score7', title: '总分(满分100)', width:150, sort: true}
                    ,{field: 'remark', title: '备注', width:100, sort: true}
                    ,{field: 'right',align:'center', title:'操作', toolbar: '#otherbar', width:200}
                ]]
            });
            table.render({
                elem:'#score'
                ,toolbar:'#scorebar'
                ,method:'post'
                ,url:'<%=request.getContextPath()%>/student/score/select?stuId='+studentId
                ,cols:[[
                    {field: 'stu', title: '学生姓名', width:100, sort: true,templet:function (d) {
                            return studentName+""
                        }}
                    ,{field: 'score', title: '学生成绩', width:100, sort: true}
                    ,{field: 'courseName', title: '课程名称', width:100}
                    ,{field: 'testType', title: '考试类别', width:120, sort: true}
                    ,{field: 'termName', title: '在读学期', width:120, sort: true}
                    ,{field: 'scoreTime', title: '考试时间', width:120, sort: true}
                    ,{field: 'remark', title: '备注', width:70, sort: true}
                    ,{field: 'right',align:'center', title:'操作', toolbar: '#otherbar', width:200}
                ]]
            })
        }
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
</script>
</body>
</html>
