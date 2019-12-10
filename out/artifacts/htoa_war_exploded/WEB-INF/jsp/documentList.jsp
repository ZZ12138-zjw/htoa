<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/12/5
  Time: 9:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>资料文档</title>
    <jsp:include page="top.jsp"></jsp:include>
</head>
<body>
<div class="x-nav">
    <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:38px">ဂ</i></a>
</div>
<div class="x-body">
    <script type="text/html" id="barDemo2">
        <button class="layui-btn layui-btn-danger" id="delsel"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加用户','${pageContext.request.contextPath}/doc/uploadoc')"><i class="layui-icon"></i>添加资料</button>
    </script>
    <table class="layui-hide" id="idTest" lay-filter="complainList"></table>

    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" >删除</a>
        <a class="layui-btn layui-btn-xs"  lay-event="download">下载</a>
    </script>
</div>
<script>
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

    layui.use(['table','layer','form','laypage'], function(){
        var table = layui.table,
            layer = layui.layer,
            form = layui.form,
            laypage = layui.laypage;

        table.render({
            id:"provinceReload"
            ,elem: '#idTest'
            ,url:'${pageContext.request.contextPath}/doc/docList'
            ,page: true
            ,method:'post'
            ,toolbar:"#barDemo2"
            ,limit:10
            ,cols: [
                [
                    {checkbox:true}//开启多选框
                    ,{field:'docId', width:100,title: '编号'}
                    ,{field:'dataName',width:150, title: '资料名'}
                    ,{field:'url',width:150, title: '资料地址'}
                    ,{field:'optime',width:150, title: '上传时间', templet:function (row){
                        return createTime(row.optime);
                    }}
                    ,{field:'remark',width:100,title: '备注'}
                    ,{field:'empId',width:150,title: '上传人员'}
                    ,{fixed: 'right', title:'操作',width:300,toolbar: '#barDemo'}
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
                case 'download':
                    //获取xmlhttprequest
                    var xmlRequest = new XMLHttpRequest();
                    //发起请求
                    xmlRequest.open("post","${pageContext.request.contextPath}/doc",true);
                    //设置请求头类型
                    xmlRequest.setRequestHeader("Content-type","application/json");
                    xmlRequest.setRequestHeader("id",data.docId);
                    xmlRequest.responseType = "blob";
                    //返回
                    xmlRequest.onload = function (ev) {
                        var content = xmlRequest.response;
                        //组装a标签
                        var elink = document.createElement("a");

                        //获取文件文件格式,截取文件后缀
                        var fileaddr = data.file
                    }
            }
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
