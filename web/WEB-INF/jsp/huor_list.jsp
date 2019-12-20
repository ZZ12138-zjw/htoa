<%--
  Created by IntelliJ IDEA.
  User: 华
  Date: 2019/12/6
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="top.jsp"></jsp:include>
</head>
<body>
    <div class="x-body">
        <script type="text/html" id="toobalDemo">
            <button class="layui-btn layui-btn-danger" id="delSelect"><i class="layui-icon"></i>批量删除</button>
            <button class="layui-btn" onclick="x_admin_show('添加用户','${pageContext.request.contextPath}/huor/tohuor_add')"><i class="layui-icon"></i>添加</button>
        </script>

        <table class="layui-hide" id="huorTable" lay-filter="huorList" ></table>

        <script type="text/html" id="complain_toolbar">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-danger layui-btn-sm" lay-event="delBatchAll"><i class="layui-icon"></i>批量删除</button>
                <button class="layui-btn layui-btn-sm" lay-event="add"><i class="layui-icon"></i>添加</button>
            </div>
        </script>

        <script type="text/html" id="barDemo">
            <a class="layui-btn layui-btn-xs" lay-event="edit" >编辑</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" >删除</a>
            <a class="layui-btn layui-btn-xs" lay-event="see" >查看宿舍人员</a>
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
                ,elem: '#huorTable'  //指定原始表格元素选择器(推荐id选择器)
                ,url:'${pageContext.request.contextPath}/huor/huorList'
                ,page: true   //开启分页
                ,method:'post'  //请求方式
                ,limit:10   //分页默认大小
                ,height:400
                ,toolbar:"#toobalDemo"
                ,cols: [   //标题栏
                    [
                        {checkbox:true}//开启多选框
                        ,{field:'hourId', width:100,title: '编号'}
                        ,{field:'hourIddsc',width:100, title: '排序编号'}
                        ,{field:'hourName',width:250, title: '宿舍房号'}
                        ,{field:'floorName',width:150, title: '宿舍楼栋'}
                        ,{field:'numberBeds',width:100,title: '床位数'}
                        ,{field:'addr',width:150,title: '宿舍地址'}
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
                    ids.push(val.hourId);
                });
                if(data.length>0){
                    layer.confirm('确定要删除选中的楼栋信息吗?',{icon:3,title:'提示信息'},function (index) {
                        //layui中找到Checkbox所在的行,并遍历行的顺序
                        $("div.layui-table-body table tbody input[name='layTableCheckbox']:checked").each(function () { //遍历选中的checkbox
                            $.post("${pageContext.request.contextPath}/huor/deletes",{
                                hourId:ids.toString()
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
            table.on('tool(huorList)', function(obj) {
                var data = obj.data;
                json = JSON.stringify(data);
                switch(obj.event) {
                    case 'edit':
                        x_admin_show('修改宿舍内容',"${pageContext.request.contextPath}/huor/tohuor_update?huorId="+data.hourId);
                        break;
                    case 'del':
                        var delIndex = layer.confirm('真的删除id为' + data.hourId + "的信息吗?", function(delIndex) {
                            $.ajax({
                                url: '${pageContext.request.contextPath}/huor/delete',
                                data:{hourId:data.hourId},
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
                        x_admin_show('宿舍人员信息',"${pageContext.request.contextPath}/huor/to_hourStudent?huorId="+data.hourId);
                        break;
                }
            });
        });
    </script>
</body>
</html>
