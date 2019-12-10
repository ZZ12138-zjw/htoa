<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/12/9
  Time: 19:45
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
        <div class="layui-row">
            <form class="layui-form layui-col-md12 x-so">
                <input class="layui-input" placeholder="开始日" name="start" id="start">
                <input class="layui-input" placeholder="截止日" name="end" id="end">
                <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
            </form>
        </div>

        <script type="text/html" id="barDemo2">
            <button class="layui-btn layui-btn-danger" id="delsel"><i class="layui-icon"></i>批量删除</button>
            <button class="layui-btn" onclick="x_admin_show('添加用户','${pageContext.request.contextPath}/doc/uploadoc')"><i class="layui-icon"></i>添加资料</button>
        </script>
        <table class="layui-hide" id="idTest" lay-filter="complainList"></table>

        <script type="text/html" id="barDemo">
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" >删除</a>
            <a class="layui-btn layui-btn-xs"  lay-event="edit">编辑</a>
            <a href="" class="layui-btn layui-btn-normal">查看周报</a>
        </script>
    </div>
    <script>
        layui.use(['table','layer','form','laypage'], function(){
            var table = layui.table,
                layer = layui.layer,
                form = layui.form,
                laypage = layui.laypage;

            table.render({
                id:"provinceReload"
                ,elem: '#idTest'
                ,url:'${pageContext.request.contextPath}/myweek/myweekList'
                ,page: true
                ,method:'post'
                ,toolbar:"#barDemo2"
                ,limit:10
                ,cols: [
                    [
                        {checkbox:true}//开启多选框
                        ,{field:'worklogid', width:100,title: '编号'}
                        ,{field:'empid',width:150, title: '员工名称'}
                        ,{field:'workday',width:150, title: '填写日期', templet:function (row){
                            return createTime(row.workday);
                        }}
                        ,{field:'weekCur',width:200, title: '本周情况描述'}
                        ,{field:'studentQuestion',width:200,title: '问题学生情况反馈'}
                        ,{field:'idea',width:150,title: '意见建议'}
                        ,{field:'weekNext',width:200,title: '下周工作计划'}
                        ,{fixed: 'right', title:'操作',width:200,toolbar: '#barDemo'}
                    ]
                ]
                ,limits: [5,10,20,50]
            });

            //批量删除
            $("#delsel").on("click",function () {
                var checkStatus=table.checkStatus('provinceReload'),
                    data=checkStatus.data;
                var ids=[];
                $(data).each(function (i,val) { //o即为表格中一行的数据
                    ids.push(val.docId);
                });

                if (data.length > 0){
                    layer.confirm('确定要删除选中的资料?',{icon:3,title:'提示信息'},function (index) {

                        //layui中找到Checkbox所在的行,并遍历行的顺序
                        $("div.layui-table-body table tbody input[name='layTableCheckbox']:checked").each(function () { //遍历选中的checkbox
                            $.post("${pageContext.request.contextPath}/doc/deletes",{
                                id:ids.toString()
                            },function(data){
                                if ('success'==data){
                                    var n=$(this).parents("tbody tr").index();  //获取checkBox所在行的顺序
                                    //移除行
                                    $("div.layui-table-body table tbody").find("tr:eq("+n+")").remove();
                                    //如果是全选移除，就将全选CheckBox还原为未选中状态
                                    $("div.layui-table-header table thead div.layui-unselect.layui-form-checkbox").removeClass("layui-form-checked");
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
            });

            table.on('tool(complainList)', function(obj) {
                var data = obj.data;
                json = JSON.stringify(data);
                switch(obj.event) {
                    case 'del':
                        var delIndex = layer.confirm('确定删除id为' + data.docId + "的信息吗?", function(delIndex) {
                            $.ajax({
                                url: '${pageContext.request.contextPath}/doc/delete',
                                data:{docId:data.docId},
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
                            layer.close(delIndex);
                        });
                        break;
                }
            });

        });
    </script>
</body>
</html>
