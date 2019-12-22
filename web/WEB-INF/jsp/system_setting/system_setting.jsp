<%--
  Created by IntelliJ IDEA.
  User: 小燕
  Date: 2019/12/21
  Time: 8:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../top.jsp"/>
</head>
<body>
<table style="align-content: center;height: 550px;width: 1140px" align="center">
    <tbody>
        <tr>
            <td style="text-align: center;vertical-align: middle">
                <a style="cursor: pointer"  href="javascript:void(0);" class="site-demo-active" data-type="tabAdd"
                   data-url="${pageContext.request.contextPath}/system_setting/jiebie_setting"
                   data-id="届别设置" data-title="届别设置">
                    <i class="layui-icon layui-icon-set-fill" style="font-size: 60px; color: #c2c2c2;"></i>
                    <br>
                    <label style="font-size: 18px">届别设置</label>
                </a>
            </td>
            <td style="text-align: center;vertical-align: middle">
                <a style="cursor: pointer" href="javascript:void(0);" class="site-demo-active" data-type="tabAdd"
                   data-url="${pageContext.request.contextPath}/system_setting/clatype_setting"
                   data-id="班级类别" data-title="班级类别">
                    <i class="layui-icon layui-icon-set-fill" style="font-size: 60px; color: #c2c2c2;"></i>
                    <br>
                    <label style="font-size: 18px">班级类别</label>
                </a>
            </td>
            <td style="text-align: center;vertical-align: middle">
                <a style="cursor: pointer" href="javascript:void(0);" class="site-demo-active" data-type="tabAdd"
                   data-url="${pageContext.request.contextPath}/system_setting/dept_setting"
                   data-id="部门管理" data-title="部门管理">
                    <i class="layui-icon layui-icon-set-fill" style="font-size: 60px; color: #c2c2c2;"></i>
                    <br>
                    <label style="font-size: 18px">部门管理</label>
                </a>
            </td>
        </tr>
        <tr>
            <td style="text-align: center;vertical-align: middle">
                <a style="cursor: pointer" href="javascript:void(0);" class="site-demo-active" data-type="tabAdd"
                   data-url="${pageContext.request.contextPath}/system_setting/jiebie_setting"
                   data-id="专业设置" data-title="专业设置">
                    <i class="layui-icon layui-icon-set-fill" style="font-size: 60px; color: #c2c2c2;"></i>
                    <br>
                    <label style="font-size: 18px">专业设置</label>
                </a>
            </td>
            <td style="text-align: center;vertical-align: middle">
                <a style="cursor: pointer" href="javascript:void(0);" class="site-demo-active" data-type="tabAdd"
                   data-url="${pageContext.request.contextPath}/system_setting/jiebie_setting"
                   data-id="学期设置" data-title="学期设置">
                    <i class="layui-icon layui-icon-set-fill" style="font-size: 60px; color: #c2c2c2;"></i>
                    <br>
                    <label style="font-size: 18px">学期设置</label>
                </a>
            </td>
            <td style="text-align: center;vertical-align: middle">
                <a style="cursor: pointer" href="javascript:void(0);" class="site-demo-active" data-type="tabAdd"
                   data-url="${pageContext.request.contextPath}/system_setting/jiebie_setting"
                   data-id="流程设置" data-title="流程设置">
                    <i class="layui-icon layui-icon-set-fill" style="font-size: 60px; color: #c2c2c2;"></i>
                    <br>
                    <label style="font-size: 18px">流程设置</label>
                </a>
            </td>
        </tr>
        <tr>
            <td style="text-align: center;vertical-align: middle">
                <a style="cursor: pointer" href="javascript:void(0);" class="site-demo-active" data-type="tabAdd"
                   data-url="${pageContext.request.contextPath}/system_setting/jiebie_setting"
                   data-id="答辩项目" data-title="答辩项目">
                    <i class="layui-icon layui-icon-set-fill" style="font-size: 60px; color: #c2c2c2;"></i>
                    <br>
                    <label style="font-size: 18px">答辩项目</label>
                </a>
            </td>
            <td style="text-align: center;vertical-align: middle">
                <a style="cursor: pointer" href="javascript:void(0);" class="site-demo-active" data-type="tabAdd"
                   data-url="${pageContext.request.contextPath}/system_setting/jiebie_setting"
                   data-id="工作时间" data-title="工作时间">
                    <i class="layui-icon layui-icon-set-fill" style="font-size: 60px; color: #c2c2c2;"></i>
                    <br>
                    <label style="font-size: 18px">工作时间</label>
                </a>
            </td>
            <td style="text-align: center;vertical-align: middle">
                <a style="cursor: pointer" href="javascript:void(0);" class="site-demo-active" data-type="tabAdd"
                   data-url="${pageContext.request.contextPath}/system_setting/jiebie_setting"
                   data-id="APP设置" data-title="APP设置">
                    <i class="layui-icon layui-icon-set-fill" style="font-size: 60px; color: #c2c2c2;"></i>
                    <br>
                    <label style="font-size: 18px">APP设置</label>
                </a>
            </td>
        </tr>
    </tbody>
</table>
<script>
    layui.use([ 'element', 'table', 'layer', 'form' ,'laydate'],function() {
        var element = layui.element;
        var $ = layui.jquery;
        //触发事件
        var active = {
            //在这里给active绑定几项事件，后面可通过active调用这些事件
            tabAdd: function (url, id, name) {
                //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
                //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
                parent.layui.element.tabAdd('xbs_tab', {
                    title: name,
                    content: '<iframe data-frameid="' + id + '" frameborder="0" src="' + url + '" style="width:100%;height: 100%" id="test"></iframe>',
                    id: id //规定好的id
                });
                parent.layui.element.render('tab');

            },
            tabChange: function (id) {
                //切换到指定Tab项
                parent.layui.element.tabChange('xbs_tab', id); //根据传入的id传入到指定的tab项
            }
        };

        $('.site-demo-active').on('click', function() {
            var dataid = $(this);

            //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li   的数目，即已经打开的tab项数目
            if ($(".layui-tab-title li[lay-id]",window.parent.document).length <= 0) {
                //如果比零小，则直接打开新的tab项
                active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"),dataid.attr("data-title"));
            } else {
                //否则判断该tab项是否以及存在

                var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                $.each($(".layui-tab-title li[lay-id]",window.parent.document), function () {
                    //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                    if ($(this).attr("lay-id") == dataid.attr("data-id")) {
                        isData = true;
                    }
                });
                if (isData == false) {
                    //标志为false 新增一个tab项
                    active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"),dataid.attr("data-title"));
                }
            }
            //最后不管是否新增tab，最后都转到要打开的选项页面上
            active.tabChange(dataid.attr("data-id"));
        });
    });
</script>
</body>
</html>
