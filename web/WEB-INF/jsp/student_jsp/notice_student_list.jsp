<%--
  Created by IntelliJ IDEA.
  User: 华
  Date: 2019/12/11
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>公告</title>
    <jsp:include page="../top.jsp"></jsp:include>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
    <div class="x-body">
        <table class="layui-hide" id="noticeTable" lay-filter="noticeList"></table>
        <script type="text/html" id="barDemo">
            <a class="layui-btn layui-btn-xs" lay-event="see" >查看</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="details" >审阅详情</a>
        </script>
    </div>
    <script type="text/javascript">
        layui.use('laydate', function(){
            var laydate = layui.laydate;
            //执行一个laydate实例
            laydate.render({
                elem: '#start' //指定元素
            });

            //执行一个laydate实例
            laydate.render({
                elem: '#end' //指定元素
            });
        });

        layui.use(['table','layer','form','laypage','jquery'], function(){
            var table = layui.table,
                layer = layui.layer,
                form = layui.form,
                laypage = layui.laypage,
                $ =layui.jquery;


            table.render({
                id:'provinceReload'
                ,elem: '#noticeTable'  //指定原始表格元素选择器(推荐id选择器)
                ,url:'${pageContext.request.contextPath}/Stu/notice_student/StrudentNoticeList'
                ,page: true   //开启分页
                ,method:'post'  //请求方式
                ,limit:10   //分页默认大小
                ,toolbar:"#toobalDemo"
                ,cols: [   //标题栏
                    [
                        {checkbox:true}//开启多选框
                        ,{field:'noticeId', width:150,title: '编号'}
                        ,{field:'title',width:150, title: '标题'}
                        ,{field:'noticeType',width:150, title: '类别',templet:'#leixing'}
                        ,{field:'empName',width:150, title: '发布人'}
                        ,{field:'noticeTime',width:150,title: '发布时间'}
                        ,{field:'trueConut',width:150,title: '已读人数'}
                        ,{field:'falseCount',width:150,title: '未读人数'}
                        ,{fixed: 'right', title:'操作',width:250,toolbar: '#barDemo'}
                    ]
                ]
                ,limits: [5,10,20,50]
            });

            //监听表格复选框选择
            table.on('checkbox(demo)',function (obj) {
                alert("res");
            });
            //监听工具条
            table.on('tool(noticeList)', function(obj) {
                var data = obj.data;
                json = JSON.stringify(data);
                switch(obj.event) {
                    case 'see':
                        $.ajax({
                            url: '${pageContext.request.contextPath}/Stu/notice_student/updateStudentType',
                            data:{noticeId:data.noticeId},
                            type: "post",
                            success: function(data) {
                            }
                        });
                        var w;
                        var g;
                        if (w == null || w == '') {
                            w=($(window).width()*0.9);
                        };
                        if (h == null || h == '') {
                            h=($(window).height() - 50);
                        };
                        layer.open({
                            type: 2,
                            area: [w+'px', h +'px'],
                            fix: false, //不固定
                            maxmin: true,
                            shadeClose: true,
                            shade:0.4,
                            title: '查看公告',
                            content: '${pageContext.request.contextPath}/Stu/notice_student/tonoticeType?noticeId='+data.noticeId,
                            end:function(){
                                location.reload();//弹出层结束后，刷新主页面
                            }
                        });
                        break;
                    case 'details':
                        x_admin_show('详情',"${pageContext.request.contextPath}/Stu/notice_student/to_noticeStudentReceipt?noticeId="+data.noticeId+"&&noticeType="+data.noticeType+"");
                        break;
                }
            });
        });
    </script>
    <script type="text/html" id="leixing">
        {{# if(d.noticeType == 1){ }}
        员工
        {{# }else if(d.noticeType == 2){ }}
        学生
        {{# }else if(d.noticeType == 3){ }}
        全体
        {{# } }}
    </script>
</body>
</html>
