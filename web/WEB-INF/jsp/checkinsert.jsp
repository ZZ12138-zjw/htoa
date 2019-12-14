<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/9
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"></jsp:include>
<html>
<head>
    <title>考核录入</title>
</head>
<body>
    <table id="demo" lay-filter="test"></table>

    <%--定义头部按钮--%>
    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container">
            <button  class="layui-btn layui-btn-warm" id="allDelete"><i class="layui-icon">&#xe640;</i>批量删除</button>
        </div>
    </script>

    <%--定义行按钮--%>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit"><i class="layui-icon">&#xe60b;</i>查看详情</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon">&#xe640;</i>删除</a>
    </script>

    <script>
        layui.use(['table','form','layer'],function () {

            var table = layui.table;
            var form = layui.form;

            table.render({
                elem:'#demo'
                ,height: 460
                ,cellMinWidth: 100 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                ,url: '${pageContext.request.contextPath}/checkinsertcontro/listcheckinsert' //数据接口
                ,page: true //开启分页
                ,cols: [[ //表头
                {type:'checkbox',align:'center'}
                ,{field: 'iD', title: '编号', sort: true,fit:'left',align:'center'}
                ,{field: 'checkContent', title: '考核内容',align:'center'}
                ,{field: 'empName', title: '员工姓名',align:'center'}
                ,{field: 'depName', title: '部门名称',align:'center'}
                ,{field: 'checkDate', title: '考核日期',align:'center',width:150,sort:true}
                ,{field: 'checkScore', title: '考核分数', sort: true,align:'center'}
                ,{field: 'inputEmp', title: '录入人员',align:'center'}
                ,{field: 'checkExplain', title: '考核说明',align:'center'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo',align:'center',width:180}
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
                    ids.push(val.iD);
                });
                if(data.length>0){
                    layer.confirm('确定要删除选中的信息吗?',{icon:3,title:'提示信息'},function (index) {
                        //layui中找到Checkbox所在的行,并遍历行的顺序
                        $("div.layui-table-body table tbody input[name='layTableCheckbox']:checked").each(function () { //遍历选中的checkbox
                            $.post("${pageContext.request.contextPath}/checkinsertcontro/alldelcheckinsert",{
                                iD:ids.toString()
                            },function(data){
                                if ('true'==data){
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
                    layer.msg('请至少选择一条数据后再执行批量删除！');
                }
            });

            table.on('tool(test)',function (obj) {
                var data = obj.data;
                if (obj.event == "del"){
                    var delIndex = layer.confirm('真的删除编号为' + data.iD + "的信息吗?", function(delIndex) {
                        $.ajax({
                            url: '${pageContext.request.contextPath}/checkinsertcontro/delcheckinsert',
                            data:{iD:data.iD},
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
                }else if(obj.event == "edit"){
                    var index = layer.open({
                        type: 2,
                        title: "查看详情",
                        area: ['600px', '90%'],
                        fix: false, //不固定
                        maxmin: true,
                        shadeClose: true,
                        shade: 0.4,
                        skin: 'layui-layer-rim',
                        content: ["${pageContext.request.contextPath}/checkinsertcontro/to_infocheckinsert?iD="+data.iD],
                    });
                }
            });
        })
    </script>
</body>
</html>
