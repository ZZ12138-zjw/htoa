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
    <jsp:include page="top.jsp"></jsp:include>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
    <div class="x-body">
        <script type="text/html" id="toobalDemo">
            <button class="layui-btn layui-btn-danger" id="delSelect"><i class="layui-icon"></i>批量删除</button>
            <button class="layui-btn" onclick="x_admin_show('添加用户','${pageContext.request.contextPath}/notice/tonotice_add')"><i class="layui-icon"></i>添加</button>
        </script>

        <table class="layui-hide" id="noticeTable" lay-filter="noticeList"></table>

        <script type="text/html" id="complain_toolbar">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-danger layui-btn-sm" lay-event="delBatchAll"><i class="layui-icon"></i>批量删除</button>
                <button class="layui-btn layui-btn-sm" lay-event="add"><i class="layui-icon"></i>添加</button>
            </div>
        </script>

        <script type="text/html" id="barDemo">
            <a class="layui-btn layui-btn-xs" lay-event="see" >查看</a>
            <a class="layui-btn layui-btn-xs" lay-event="edit" >编辑</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" >删除</a>
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
                ,url:'${pageContext.request.contextPath}/notice/EmpNoticeList'
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


            //批量删除
            $('#delSelect').on('click',function () {
                //获得表格CheckBox已经选中的行的信息
                //lay-data="id:info"
                var checkStatus=table.checkStatus('provinceReload'),
                    //返回的val ue
                    data=checkStatus.data;
                var ids=[];
                $(data).each(function (i,val) { //o即为表格中一行的数据
                    ids.push(val.noticeId);
                });
                if(data.length>0){
                    layer.confirm('确定要删除选中的公告吗?',{icon:3,title:'提示信息'},function (index) {
                        //layui中找到Checkbox所在的行,并遍历行的顺序
                        $("div.layui-table-body table tbody input[name='layTableCheckbox']:checked").each(function () { //遍历选中的checkbox
                            $.post("${pageContext.request.contextPath}/notice/deletes",{
                                noticeId:ids.toString()
                            },function(data){
                                if ('success'==data){
                                    var n=$(this).parents("tbody tr").index();  //获取checkBox所在行的顺序
                                    //移除行
                                    $("div.layui-table-body table tbody").find("tr:eq("+n+")").remove();
                                    //如果是全选移除，就将全选CheckBox还原为未选中状态
                                    $("div.layui-table-header table thead div.layui-unselect.layui-form-checkbox").removeClass("layui-form-checked");
                                    /*setTimeout(function () {
                                     window.location.reload(); //修改成功后刷新父界面
                                     })*/
                                }else {
                                    layer.alert('删除失败',{
                                        icon:2
                                    });
                                }
                            },'text');
                        });
                        layer.alert("删除成功", {
                            icon: 6
                        });
                        //关闭弹窗
                        layer.close(index);
                    });
                }else {
                    layer.msg('请选择需要删除的行');
                }
            }); //批量删除操作结束


            //监听工具条
            table.on('tool(noticeList)', function(obj) {
                var data = obj.data;
                json = JSON.stringify(data);
                switch(obj.event) {
                    case 'edit':
                        var w;
                        var h;
                        if (w == null || w == '') {
                            w=($(window).width()*0.9);
                        };
                        if (h == null || h == '') {
                            h=($(window).height() - 50);
                        };
                        var index = layer.open({
                            type: 2,
                            title: "编辑部门页面",
                            area: [w+'px', h +'px'],
                            fix: false, //不固定
                            maxmin: true,
                            shadeClose: true,
                            shade: 0.4,
                            skin: 'layui-layer-rim',
                            content: ["${pageContext.request.contextPath}/notice/to_noticeupdate?noticeId="+data.noticeId, "no"],
                        });
                        break;
                    case 'del':
                        var delIndex = layer.confirm('真的删除id为' + data.noticeId + "的信息吗?", function(delIndex) {
                            $.ajax({
                                url: '${pageContext.request.contextPath}/notice/delete',
                                data:{noticeId:data.noticeId},
                                type: "post",
                                success: function(suc) {
                                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                                    layer.close(delIndex);
                                    console.log(delIndex);
                                    layer.msg("删除成功", {
                                        icon: 1
                                    });
                                }
                            });
                            //关闭弹窗
                            layer.close(delIndex);
                        });
                        break;
                    case 'see':
                        $.ajax({
                            url: '${pageContext.request.contextPath}/notice/updateType',
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
                            content: '${pageContext.request.contextPath}/notice/tonoticeType?noticeId='+data.noticeId,
                            end:function(){
                                location.reload();//弹出层结束后，刷新主页面
                            }
                        });
                        break;
                    case 'details':
                        x_admin_show('详情',"${pageContext.request.contextPath}/notice/to_noticeReceipt?noticeId="+data.noticeId+"&&noticeType="+data.noticeType+"");
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
