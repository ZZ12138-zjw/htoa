<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/19
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../top.jsp"></jsp:include>
    <title>教师考评</title>
</head>
<body>
        <form class="layui-form" style="padding: 20px;">
            <div class="layui-input-inline">
                <select name="evaluationType" id="evaluationType" lay-verify="required">
                    <option value="">请选择教师类型</option>
                    <option value="1">专业老师</option>
                    <option value="2">专职班主任</option>
                </select>
            </div>
        </form>
    <table id="demo" lay-filter="test"></table>

    <script>
        layui.use(['table', 'layer', 'jquery','form'], function () {
            var table = layui.table;
            var form = layui.form;

            form.render('select');

            //第一个实例
            table.render({
                elem: '#demo'
                , height: 460
                , url: '${pageContext.request.contextPath}/repaircontro/listrepair' //数据接口
                , page: true //开启分页
                , cols: [[ //表头
                    {type: 'checkbox'}
                    , {field: 'iD', title: '编号', sort: true}
                    , {field: 'empID', title: ''}
                    , {field: 'className', title: '班级名称'}
                    , {field: 'repairSort', title: '报修类别', sort: true}
                    , {field: 'repairStatus', title: '报修状态', sort: true}
                    , {field: 'repairAddress', title: '报修地址'}
                    , {field: 'startDate', templet: function (data) {
                            return createTime(data.startDate)
                        }, title: '申请时间', width: 120, sort: true
                    }
                    , {field: 'endDate', title: '结束时间', templet: function (data) {
                            if (data.endDate == null) {
                                return "";
                            } else {
                                return createTime(data.endDate);
                            }

                        }, width: 120, sort: true
                    }
                    , {field: 'repairExplain', title: '备注', width: 100}
                    , {fixed: 'right', title: '操作', align: 'center', toolbar: '#barDemo', width: 200}
                ]],
                toolbar: '#toolbarDemo'
            });

            //批量删除
            $('#allDelete').on('click', function () {
                var checkStatus = table.checkStatus('demo'),
                    //返回的val ue
                    data = checkStatus.data;
                var ids = [];
                $(data).each(function (i, val) { //o即为表格中一行的数据
                    ids.push(val.repairID);
                });
                if (data.length > 0) {
                    layer.confirm('确定要删除选中的信息吗?', {icon: 3, title: '提示信息'}, function (index) {
                        //layui中找到Checkbox所在的行,并遍历行的顺序
                        $("div.layui-table-body table tbody input[name='layTableCheckbox']:checked").each(function () { //遍历选中的checkbox
                            $.post("${pageContext.request.contextPath}/checkinsertcontro/alldelete", {
                                repairID: ids.toString()
                            }, function (data) {
                                if ('success' == data) {
                                    var n = $(this).parents("tbody tr").index();  //获取checkBox所在行的顺序
                                    //移除行
                                    $("div.layui-table-body table tbody").find("tr:eq(" + n + ")").remove();
                                    //如果是全选移除，就将全选CheckBox还原为未选中状态
                                    $("div.layui-table-header table thead div.layui-unselect.layui-form-checkbox").removeClass("layui-form-checked");
                                    layer.alert("删除成功", {
                                        icon: 6
                                    });
                                    /*setTimeout(function () {
                                        window.location.reload(); //修改成功后刷新父界面
                                    })*/
                                } else {
                                    layer.alert('删除失败', {
                                        icon: 2
                                    });
                                }
                            }, 'text');

                        });
                        //关闭弹窗
                        layer.close(index);
                    });
                } else {
                    layer.msg('请至少选择一条数据后再执行批量删除！');
                }
            });

            table.on('toolbar(test)', function (obj) {
                if (obj.event == "add") {
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

            form.on('select',function (data) {
                $.post('${pageContext.request.contextPath}/Stu/empevaluationcontro/liststudentempevaluation',{
                    evaluationType:data.value
                },function (data) {
                    table.render();
                },"json")
            });

            table.on('tool(test)', function (obj2) {
                var data = obj2.data;
                if (obj2.event == "edit") {
                    var index = layer.open({
                        type: 2,
                        title: "编辑维修管理",
                        area: ['600px', '90%'],
                        fix: false, //不固定
                        maxmin: true,
                        shadeClose: true,
                        shade: 0.4,
                        skin: 'layui-layer-rim',
                        content: ["${pageContext.request.contextPath}/repaircontro/to_editrepairmanage?repairid=" + data.repairID],
                    });
                } else if (obj2.event == "del") {
                    var delIndex = layer.confirm('真的删除编号为' + data.repairID + "的信息吗?", function (delIndex) {
                        $.ajax({
                            url: '${pageContext.request.contextPath}/repaircontro/delrepairmanage',
                            data: {repairID: data.repairID},
                            type: "post",
                            success: function (suc) {
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
