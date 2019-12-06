<%--
  Created by IntelliJ IDEA.
  User: 华
  Date: 2019/12/4
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
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
<div class="x-body">
    <button class="layui-btn layui-btn-danger" id="delSelect"><i class="layui-icon"></i>批量删除</button>
    <button class="layui-btn" onclick="x_admin_show('添加用户','${pageContext.request.contextPath}/coursetype/tocurriculum_add')"><i class="layui-icon"></i>添加</button>
    <span class="x-right" style="line-height:40px">共有数据：${count} 条</span>

    <table class="layui-hide" id="coursetypeTable" lay-filter="coursetypeList" lay-data="id:'info'"></table>

    <script type="text/html" id="complain_toolbar">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-danger layui-btn-sm" lay-event="delBatchAll"><i class="layui-icon"></i>批量删除</button>
            <button class="layui-btn layui-btn-sm" lay-event="add"><i class="layui-icon"></i>添加</button>
        </div>
    </script>

    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit" >  编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" >删除</a>
    </script>
</div>
<script>
    var popForm;
    //laydata日期时间选择器
    layui.use('laydata',function () {
        var laydata=layui.laydate;

        //执行一个laydata实例
        laydata.render({
            elem: '#start' //指定元素
        });
        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });
    //layer弹出层 laypage分页
    layui.use(['table','layer','form','laypage'],function () {
        var table = layui.table,
            layer = layui.layer,
            form = layui.form,
            laypage = layui.laypage;

        table.render({
            elem:'#coursetypeTable',
            url:'${pageContext.request.contextPath}/coursetype/coursetypeList',
            page:true,  //开启分页
            method:'post',  //post请求
            limit:10,   //分页大小
            cols:[
                [
                    {checkbox:true}
                    ,{field:'courseTypeId',width:250,title:'编号'}
                    ,{field:'courseTypeName',width:250,title:'类别名称'}
                    ,{field:'remark',width:250,title:'说明'}
                    ,{fixed: 'right', title:'操作',width:200,toolbar:'#barDemo'}
                ]
            ],
            limits:[5,10,15]  //分页大小
        });


        table.on('tool(coursetypeList)',function (obj) {
            var data = obj.data;
            json = JSON.stringify(data);
            switch (obj.event){
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
                        type: 2,//可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                        title: "编辑课程类别页面",
                        area: [w+'px', h +'px'],
                        fix: false, //不固定
                        maxmin: true,
                        shadeClose: true,
                        shade: 0.4,
                        skin: 'layui-layer-rim',
                        content: ["${pageContext.request.contextPath}/coursetype/tocurriculum_update?courseTypeId="+data.courseTypeId, "no"],
                    });
                    break;
                case 'del':
                    var delIndex = layer.confirm('真的删除id为' + data.courseTypeId + "的信息吗?", function(delIndex) {
                        $.ajax({
                            url: '${pageContext.request.contextPath}/coursetype/delete',
                            data:{courseTypeId:data.courseTypeId},
                            type: "post",
                            success: function(suc) {
                                obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                                layer.close(delIndex);
                                console.log(delIndex);
                                layer.msg("删除成功", {
                                    icon: 1
                                });
                                table.reload("complainTable",{
                                    url:'${pageContext.request.contextPath}/coursetype/coursetypeList',
                                });
                            }
                        });
                        //关闭弹窗
                        layer.close(delIndex);
                    });
                    break;
            }
        });
        /*批量删除*/
        $("#delSelect").on("ckeck",function () {
            //获得表格CheckBox已经选中的行的信息
            var checkStatus = table.checkStatus('info'),
            //返回的value
            data=checkStatus.data;
            if (data.length>0){
                layer.confirm('确定要删除选中的部门吗?',{icon:3,title:'提示信息'},function (index) {
                    //layui中找到Checkbox所在的行,并遍历行的顺序
                    $("div.layui-table-body table tbody input[name='layTableCheckbox']:checked").each(function () { //遍历选中的checkbox
                        var n=$(this).parents("tbody tr").index();  //获取checkBox所在行的顺序
                        //移除行
                        $("div.layui-table-body table tbody").find("tr:eq("+n+")").remove();
                        //如果是全选移除，就将全选CheckBox还原为未选中状态
                        $("div.layui-table-header table thead div.layui-unselect.layui-form-checkbox").removeClass("layui-form-checked");
                    });
                    //关闭弹窗
                    layer.close(index);
                });
            }else{
                layer.msg('请选择需要删除的行');
            }
        });//批量删除操作结束
    });





    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
            $.post("${pageContext.request.contextPath}/coursetype/delete",{
                courseTypeId:id
            },function (data) {
                $(obj).parents("tr").remove();
                layer.msg('已删除!',{icon:1,time:1000});
            });
        });
    }

    /*批量删除*/
    function delAll (argument) {
        var data = tableCheck.getData();
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            $.post("${pageContext.request.contextPath}/coursetype/deletes",data
                ,function (data) {
                    layer.msg('删除成功', {icon: 1});
                    $(".layui-form-checked").not('.header').parents('tr').remove();
                });
        });
    }
</script>

<script>
    var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
</body>
</html>
