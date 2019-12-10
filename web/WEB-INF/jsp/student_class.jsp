<%--
  Created by IntelliJ IDEA.
  User: 小燕
  Date: 2019/12/4
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
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
<label class="layui-form-label">届别</label>
</label>
<div class="layui-input-block">
    <select name="jiebie">
        <option value="" selected>--不选择--</option>
    </select>
</div>
<table id="demo" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" onclick="x_admin_show('添加学生','<%=request.getContextPath()%>/student/toAdd')"><i class="layui-icon"></i>添加</button>
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
            ,url:'<%=request.getContextPath()%>/student/classAll'
            ,toolbar: '#toolbarDemo'//开启头部工具栏，并为其绑定左侧模板
            ,page: true //开启分页
            ,method:'post'
            ,limit:10
            ,cols: [[ //表头
                {checkbox:true}//开启多选框
                ,{field: 'classId', title: '序号', width:70, sort: true}
                ,{field: 'classNo', title: '班级编号', width:90, sort: true}
                ,{field: 'className', title: '班级名称', width:220}
                ,{field: 'classTeacher', title: '班主任', width:100, sort: true}
                ,{field: 'teacher', title: '任课老师', width:100}
                ,{field: 'typeName', title: '班级类别', width: 100}
                ,{field: 'level', title: '届别', width: 100}
                ,{field: 'right', title: '系名称', width: 140,templet:function (d) {
                        return "<span>宏图软件教育中心</span>"
                    }}
                ,{field: 'state', title: '专业名称', width: 140,templet:function (d) {
                        return "<span>计算机程序设计</span>"
                    }}
                ,{field: 'right',align:'center', title:'操作', toolbar: '#barDemo', width:200}
                ,{field: 'remark', title: '说明', width: 100}
            ]],limits: [5,10,20,50]
        });
        table.on('tool(test)',function (obj) {
            var data = obj.data; //获取当前行的数据
            var layEvent =  obj.event; //获取lay-event对应的值
            var tr = obj.tr;//获取当前行

            if(layEvent == 'del'){//删除
                layer.confirm('真的删除么',function (index) {
                    alert(data.stuId);
                    $.ajax({
                        url:'${pageContext.request.contextPath}/student/delCla',
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
        })
    });
</script>
</body>
</html>
