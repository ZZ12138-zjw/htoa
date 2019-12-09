<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/6
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>维修管理</title>
    <jsp:include page="top.jsp"></jsp:include>
</head>
<body>
    <table id="demo" lay-filter="test"></table>

    <%--定义头部按钮--%>
    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-normal" lay-event="add">添加</button>
            <button  class="layui-btn layui-btn-warm" id="allDelete">批量删除</button>
        </div>
    </script>

    <%--定义行按钮--%>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>

    <script>

        layui.use(['table','layer','jquery'], function(){
            var table = layui.table;

            //第一个实例
            table.render({
                elem: '#demo'
                ,height: 460
                ,url: '${pageContext.request.contextPath}/repaircontro/listrepair' //数据接口
                ,page: true //开启分页
                ,cols: [[ //表头
                    {type:'checkbox'}
                    ,{field: 'repairID', title: 'ID', width:80, sort: true}
                    ,{field: 'repairMan', title: '报修人', width:80}
                    ,{field: 'repairName', title: '报修名称', width: 120}
                    ,{field: 'repairSort', title: '报修类别', width:90, sort: true}
                    ,{field: 'repairStatus', title: '报修状态', width:90, sort: true}
                    ,{field: 'repairAddress', title: '报修地址', width: 100}
                    ,{field: 'repairDept', title: '部门或班级', width: 100}
                    ,{field: 'startDate', title: '申请时间', width: 100, sort: true}
                    ,{field: 'endDate', title: '结束时间', width: 100, sort: true}
                    ,{field: 'repairIndex', title: '备注', width: 100}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:110}
                ]],
                toolbar:'#toolbarDemo'
            });

            //批量删除
            $('#allDelete').on('click',function(){
                var checkStatus=table.checkStatus('demo'),
                    //返回的val ue
                    data=checkStatus.data;
                var ids=[];
                $(data).each(function (i,val) { //o即为表格中一行的数据
                    ids.push(val.repairID);
                });
                if(data.length>0){
                    layer.confirm('确定要删除选中的部门吗?',{icon:3,title:'提示信息'},function (index) {
                        //layui中找到Checkbox所在的行,并遍历行的顺序
                        $("div.layui-table-body table tbody input[name='layTableCheckbox']:checked").each(function () { //遍历选中的checkbox
                            $.post("${pageContext.request.contextPath}/repaircontro/alldelete",{
                                repairID:ids.toString()
                            },function(data){
                                if ('success'==data){
                                    var n=$(this).parents("tbody tr").index();  //获取checkBox所在行的顺序
                                    //移除行
                                    $("div.layui-table-body table tbody").find("tr:eq("+n+")").remove();
                                    //如果是全选移除，就将全选CheckBox还原为未选中状态
                                    $("div.layui-table-header table thead div.layui-unselect.layui-form-checkbox").removeClass("layui-form-checked");
                                    layer.alert("删除成功", {
                                        icon: 6
                                    });
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
                        //关闭弹窗
                        layer.close(index);
                    });
                }else {
                    layer.msg('请选择需要删除的行');
                }
            });

            table.on('toolbar(test)',function(obj){
               if (obj.event == "add"){
                   layer.open({
                       type: 2,
                       title: '新增维修管理',
                       shadeClose: true,
                       shade: 0.8,
                       area: ['600px', '90%'],
                       content: '${pageContext.request.contextPath}/repaircontro/to_addrepairmanage' //iframe的url
                   })
               }
            });



            table.on('tool(test)',function(obj2){
                var data = obj2.data;
                if(obj2.event == "edit"){
                    var index = layer.open({
                        type: 2,
                        title: "编辑维修管理",
                        area: ['600px', '90%'],
                        fix: false, //不固定
                        maxmin: true,
                        shadeClose: true,
                        shade: 0.4,
                        skin: 'layui-layer-rim',
                        content: ["${pageContext.request.contextPath}/repaircontro/to_editrepairmanage?repairid="+data.repairID],
                    });
                }else if(obj2.event == "del"){
                    var delIndex = layer.confirm('真的删除id为' + data.repairID + "的信息吗?", function(delIndex) {
                        $.ajax({
                            url: '${pageContext.request.contextPath}/repaircontro/delrepairmanage',
                            data:{repairID:data.repairID},
                            type: "post",
                            success: function(suc) {
                                obj2.del(); //删除对应行（tr）的DOM结构，并更新缓存
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
                }
            });

        });
    </script>
</body>
</html>
