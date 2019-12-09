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
    <title>table模块快速使用</title>
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

<table id="demo" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-danger" ><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn " onclick="x_admin_show('添加学生','<%=request.getContextPath()%>/student/toAdd')"><i class="layui-icon"></i>添加</button>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
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
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                });
            }else if(layEvent == 'edit'){//编辑
                x_admin_show('修改学生信息','<%=request.getContextPath()%>/student/toUpdate?stuId='+data.stuId);
            }
        })
    });
</script>
</body>
</html>
