<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/19
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../top.jsp"></jsp:include>
    <title>我的报修申请</title>

    <script type="text/javascript">
        /*时间转换格式*/
        function  createTime(v) {
            var date=new Date(v);
            var y=date.getFullYear();
            var m=date.getMonth()+1;
            m = m<10 ? '0'+m : m;
            var d=date.getDate();
            d=d<10 ?("0"+d):d;
            var h=date.getHours();
            h=h<10?("0"+h):h;
            var M = date.getMinutes();
            M = M<10?("0"+M):M;
            var str = y+"-"+m+"-"+d+" "+h;
            return str;
        }
    </script>
</head>
<body>
    <table id="demo" lay-filter="test"></table>

    <%--定义行按钮--%>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="info"><i class="layui-icon">&#xe60b;</i>查看详情</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon">&#xe640;</i>撤销申请</a>
    </script>

    <script>
        layui.use(['table','layer','jquery'], function(){
            var table = layui.table;

            //第一个实例
            table.render({
                elem: '#demo'
                ,height: 460
                ,url: '${pageContext.request.contextPath}/Stu/studentrepair/student_viewrepairapply' //数据接口
                ,page: true //开启分页
                ,cellMinWidth: 80
                ,cols: [[ //表头
                    {field: 'repairID', title: '编号', sort: true}
                    ,{field: 'studentName', title: '学生姓名'}
                    ,{field: 'className', title: '班级名称'}
                    ,{field: 'repairSort', title: '报修类别', sort: true}
                    ,{field: 'repairStatus', title: '报修状态', sort: true}
                    ,{field: 'repairAddress', title: '报修地址'}
                    ,{field: 'startDate',templet:function (data) {
                            return  createTime(data.startDate)
                        }, title: '申请时间',width:120, sort: true}
                    ,{field: 'endDate', title: '结束时间',templet:function (data) {
                            if (data.endDate==null){
                                return "";
                            } else {
                                return createTime(data.endDate);
                            }

                        }, width: 120, sort: true}
                    ,{field: 'repairExplain', title: '备注', width: 100}
                    ,{fixed: 'right', title:'操作',align:'center', toolbar: '#barDemo', width:200}
                ]],
                toolbar:'#toolbarDemo'
            });

            table.on('tool(test)',function(obj2){
                var data = obj2.data;
                if(obj2.event == "info"){
                    var index = layer.open({
                        type: 2,
                        title: "查看详情",
                        area: ['600px', '90%'],
                        fix: false, //不固定
                        maxmin: true,
                        shadeClose: true,
                        shade: 0.4,
                        skin: 'layui-layer-rim',
                        content: ["${pageContext.request.contextPath}/Stu/studentrepair/to_repairapplyinfo?repairID="+data.repairID],
                    });
                }else if(obj2.event == "del"){
                    var delIndex = layer.confirm('真的撤销编号为' + data.repairID + "的信息吗?", function(delIndex) {
                        $.ajax({
                            url: '${pageContext.request.contextPath}/Stu/studentrepair/delrepairapply',
                            data:{repairID:data.repairID},
                            type: "post",
                            success: function(suc) {
                                obj2.del(); //删除对应行（tr）的DOM结构，并更新缓存
                                layer.close(delIndex);
                                console.log(delIndex);
                                layer.msg("撤销成功", {
                                    icon: 1
                                });
                            }
                        });
                        //关闭弹窗
                        layer.close(delIndex);
                    });
                }
            });

        });
    </script>
</body>
</html>