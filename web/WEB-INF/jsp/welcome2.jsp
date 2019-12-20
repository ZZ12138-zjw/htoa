<%--
  Created by IntelliJ IDEA.
  User: LaIWeiChun
  Date: 2019/12/10
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>主页</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" media="all">
    <style>
        .layui-card {border:1px solid #f2f2f2;border-radius:5px;}
        .icon {margin-right:10px;color:#1aa094;}
        .icon-cray {color:#ffb800!important;}
        .icon-blue {color:#1e9fff!important;}
        .icon-tip {color:#ff5722!important;}
        .layuimini-qiuck-module {text-align:center;margin-top: 10px}
        .layuimini-qiuck-module a i {display:inline-block;width:100%;height:60px;line-height:60px;text-align:center;border-radius:2px;font-size:30px;background-color:#F8F8F8;color:#333;transition:all .3s;-webkit-transition:all .3s;}
        .layuimini-qiuck-module a cite {position:relative;top:2px;display:block;color:#666;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;font-size:14px;}
        .welcome-module {width:100%;height:210px;}
        .panel {background-color:#fff;border:1px solid transparent;border-radius:3px;-webkit-box-shadow:0 1px 1px rgba(0,0,0,.05);box-shadow:0 1px 1px rgba(0,0,0,.05)}
        .panel-body {padding:10px}
        .panel-title {margin-top:0;margin-bottom:0;font-size:12px;color:inherit}
        .label {display:inline;padding:.2em .6em .3em;font-size:75%;font-weight:700;line-height:1;color:#fff;text-align:center;white-space:nowrap;vertical-align:baseline;border-radius:.25em;margin-top: .3em;}
        .layui-red {color:red}
        .main_btn > p {height:40px;}
        .layui-bg-number {background-color:#F8F8F8;}
        .layuimini-notice:hover {background:#f6f6f6;}
        .layuimini-notice {padding:7px 16px;clear:both;font-size:12px !important;cursor:pointer;position:relative;transition:background 0.2s ease-in-out;}
        .layuimini-notice-title,.layuimini-notice-label {
            padding-right: 70px !important;text-overflow:ellipsis!important;overflow:hidden!important;white-space:nowrap!important;}
        .layuimini-notice-title {line-height:28px;font-size:14px;}
        .layuimini-notice-extra {position:absolute;top:50%;margin-top:-8px;right:16px;display:inline-block;height:16px;color:#999;}
    </style>
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <div class="layui-row layui-col-space15">

            <div class="layui-col-md8">
                <div class="layui-row layui-col-space15">

                    <div class="layui-col-md6">
                        <div class="layui-card">
                            <div class="layui-card-header"><i class="fa fa-credit-card icon icon-blue"></i>快捷入口</div>
                            <div class="layui-card-body">
                                <div class="welcome-module">
                                    <div class="layui-row layui-col-space10 layuimini-qiuck">
                                        <div class="layui-col-xs3 layuimini-qiuck-module">
                                            <a href="javascript:;" data-iframe-tab="page/menu.html" data-title="菜单管理" data-icon="fa fa-window-maximize">
                                                <i class="fa fa-window-maximize"></i>
                                                <cite>员工请假审批</cite>
                                            </a>
                                        </div>
                                        <div class="layui-col-xs3 layuimini-qiuck-module">
                                            <a href="javascript:;" data-iframe-tab="page/setting.html" data-title="系统设置" data-icon="fa fa-gears">
                                                <i class="fa fa-gears"></i>
                                                <cite>学生请假审批</cite>
                                            </a>
                                        </div>
                                        <div class="layui-col-xs3 layuimini-qiuck-module">
                                            <a href="javascript:;" data-iframe-tab="page/table.html" data-title="表格示例" data-icon="fa fa-file-text">
                                                <i class="fa fa-file-text"></i>
                                                <cite>未打卡审批</cite>
                                            </a>
                                        </div>
                                        <div class="layui-col-xs3 layuimini-qiuck-module">
                                            <a href="javascript:;" data-iframe-tab="page/icon.html" data-title="图标列表" data-icon="fa fa-dot-circle-o">
                                                <i class="fa fa-dot-circle-o"></i>
                                                <cite>未读通知公告</cite>
                                            </a>
                                        </div>
                                        <div class="layui-col-xs3 layuimini-qiuck-module">
                                            <a href="javascript:;" data-iframe-tab="page/form.html" data-title="表单示例" data-icon="fa fa-calendar">
                                                <i class="fa fa-calendar"></i>
                                                <cite>本周工作周报</cite>
                                            </a>
                                        </div>
                                        <div class="layui-col-xs3 layuimini-qiuck-module">
                                            <a href="javascript:;" data-iframe-tab="page/404.html" data-title="404页面" data-icon="fa fa-hourglass-end">
                                                <i class="fa fa-hourglass-end"></i>
                                                <cite>月谈心记录</cite>
                                            </a>
                                        </div>
                                        <div class="layui-col-xs3 layuimini-qiuck-module">
                                            <a href="javascript:;" data-iframe-tab="page/button.html" data-title="按钮示例" data-icon="fa fa-snowflake-o">
                                                <i class="fa fa-snowflake-o"></i>
                                                <cite>请假申请</cite>
                                            </a>
                                        </div>
                                        <div class="layui-col-xs3 layuimini-qiuck-module">
                                            <a href="javascript:;" data-iframe-tab="page/layer.html" data-title="弹出层" data-icon="fa fa-shield">
                                                <i class="fa fa-shield"></i>
                                                <cite>值班管理</cite>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>


                </div>
            </div>

            <div class="layui-col-md4">

                <div class="layui-card">
                    <div class="layui-card-header"><i class="fa fa-bullhorn icon icon-tip"></i>系统公告</div>
                    <div class="layui-card-body layui-text">
                    <c:forEach items="${EmpNoticeList}" var="list">
                        <div class="layuimini-notice" id="noticeList">
                            <input type="hidden" class="layuimini-notice-noticeId" value="${list.noticeId}">
                            <div class="layuimini-notice-title">${list.title}   <c:if test="${list.isRead==1}">已读</c:if><c:if test="${list.isRead==2}">未读</c:if></div>
                            <div class="layuimini-notice-extra">${list.noticeTime}</div>
                            <div class="layuimini-notice-content layui-hide">
                                ${list.content}
                            </div>
                        </div>
                    </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>
    layui.use(['layer', 'layuimini','echarts'], function () {
        var $ = layui.jquery,
            layer = layui.layer,
            layuimini = layui.layuimini,
            echarts = layui.echarts;

        $('body').on('click', '.layuimini-notice', function () {
            var noticeId = $(this).children('.layuimini-notice-noticeId').val();
            var title = $(this).children('.layuimini-notice-title').text(),
                noticeTime = $(this).children('.layuimini-notice-extra').text(),
                content = $(this).children('.layuimini-notice-content').html();
            var html = '<div style="padding:15px 20px;text-align:justify; line-height: 22px;border-bottom:1px solid #e2e2e2;background-color: #2f4056;color: #ffffff">\n' +
                '<div style="text-align: center;margin-bottom: 20px;font-weight: bold;border-bottom:1px solid #718fb5;padding-bottom: 5px"><h4 class="text-danger">' + title + '</h4></div>\n' +
                '<div style="font-size: 12px">' + content + '</div>\n' +
                '</div>\n';
            parent.layer.open({
                type: 1,
                title: '系统公告'+'<span style="float: right;right: 1px;font-size: 12px;color: #b1b3b9;margin-top: 1px">'+noticeTime+'</span>',
                area:["1000px","500px"],
                closeBtn:false,
                shade: 0.8,
                id: 'layuimini-notice',
                btnAlign: 'c',
                moveType: 1,
                btn:'返回',
                content:html,
                success: function (layero) {
                    $.ajax({
                        url: '${pageContext.request.contextPath}/notice/updateType',
                        data:{noticeId:noticeId},
                        type: "post",
                        success: function(data) {
                        }
                    });
                    var btn = layero.find('.layui-layer-btn');
                    btn.find('.layui-layer-btn0').on('click',function () {
                        setTimeout(function () {
                            window.location.reload(); //修改成功后刷新父界面
                        });
                        location.reload();
                    });
                }
            });
        });

    });
</script>
</body>

</html>
