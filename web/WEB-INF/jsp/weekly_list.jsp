<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/12/9
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>周报管理</title>
    <jsp:include page="top.jsp"></jsp:include>
</head>
<body>

    <div class="x-nav">
        <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
            <i class="layui-icon" style="line-height:38px">ဂ</i></a>
    </div>

    <div class="x-body">
        <div class="layui-row">
            <form class="layui-form layui-col-md12 x-so">
                <div class="layui-inline">
                    <label class="layui-form-label">部门名称</label>
                    <div class="layui-input-inline"  >
                        <select name="depName" id="selectDep">

                        </select>
                    </div>
                </div>
                <input  name="empName" placeholder="员工姓名" class="layui-input">
                <input class="layui-input" placeholder="开始日" name="workday" id="test1">
                <input class="layui-input" placeholder="截止日" name="workday" id="test2">
                <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
            </form>
        </div>

        <table class="layui-hide" id="idTest" lay-filter="complainList"></table>

        <script type="text/html" id="barDemo">
            <a href="" class="layui-btn layui-btn-normal">查看周报</a>
        </script>
    </div>

    <script>
        layui.use('laydate',function () {
           var laydate = layui.laydate;

           laydate.render({
              elem:'#test1,#test2'
           });
        });

        //选择部门下拉框赋值
        $(function () {
            $.get("${pageContext.request.contextPath}/week/deptName",{},function (data) {
                $("#selectDep").prepend("<option value='' class='layui-input'>未选择</option>");
                $.each(JSON.parse(data),function (index,item) {
                    $("#selectDep").append("<option value='"+item+"' >"+item+"</option>")
                });
                //最终的赋值填空是依赖这句话
                layui.form.render("select");
            });
        });

        layui.use(['table','form'],function () {
            var table = layui.table,
                form = layui.form;

            table.render({
                id:"provinceReload"
                ,elem: '#idTest'
                ,url:'${pageContext.request.contextPath}/week/weekLists'
                ,page: true
                ,method:'post'
                ,limit:10
                ,cols: [
                    [
                        {checkbox:false}//开启多选框
                        ,{field:'worklogid', width:100,title: '编号'}
                        ,{field:'empid',width:150, title: '员工名称'}
                        ,{field:'workday',width:150, title: '填写日期', templet:function (row){
                            return createTime(row.workday);
                        }}
                        ,{field:'weekCur',width:200, title: '本周情况描述'}
                        ,{field:'studentQuestion',width:200,title: '问题学生情况反馈'}
                        ,{field:'idea',width:150,title: '意见建议'}
                        ,{field:'weekNext',width:200,title: '下周工作计划'}
                        ,{fixed: 'right', title:'操作',width:100,toolbar: '#barDemo'}
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
                        empid:data.field.empid
                    }
                    ,text:{none:'无数据'}
                }, 'data');

                return false;
            });

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
