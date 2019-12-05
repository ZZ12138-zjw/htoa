
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
    <jsp:include page="top.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css">
  </head>

  <body>
  <div class="layuimini-container">
      <div class="layuimini-main">

          <fieldset class="layui-elem-field layuimini-search">
              <legend>搜索信息</legend>
              <div style="margin: 10px 10px 10px 10px">
                  <form class="layui-form layui-form-pane" action="">
                      <div class="layui-form-item">
                          <div class="layui-inline">
                              <label class="layui-form-label">员工姓名</label>
                              <div class="layui-input-inline">
                                  <input type="text" name="username" autocomplete="off" class="layui-input">
                              </div>
                          </div>
                          <div class="layui-inline">
                              <label class="layui-form-label">员工性别</label>
                              <div class="layui-input-inline">
                                  <input type="text" name="sex" autocomplete="off" class="layui-input">
                              </div>
                          </div>
                          <div class="layui-inline">
                              <label class="layui-form-label">员工城市</label>
                              <div class="layui-input-inline">
                                  <input type="text" name="city" autocomplete="off" class="layui-input">
                              </div>
                          </div>
                          <div class="layui-inline">
                              <label class="layui-form-label">员工职务</label>
                              <div class="layui-input-inline">
                                  <input type="text" name="classify" autocomplete="off" class="layui-input">
                              </div>
                          </div>
                          <div class="layui-inline">
                              <a class="layui-btn" lay-submit="" lay-filter="data-search-btn">搜索</a>
                          </div>
                      </div>
                  </form>
              </div>
          </fieldset>

          <div class="layui-btn-group">
              <button class="layui-btn data-add-btn">添加</button>
              <button class="layui-btn layui-btn-danger data-delete-btn">删除</button>
          </div>
          <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>
          <script type="text/html" id="currentTableBar">
              <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
              <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
          </script>
          <script type="text/html" id="toolbarDemo">
              <div class="layui-btn-container">
                  <button class="layui-btn layui-btn-sm" lay-event="add">添加</button>
              </div>
          </script>
      </div>
  </div>

  <script>
      layui.use(['form', 'table'], function () {
          var $ = layui.jquery,
              form = layui.form,
              table = layui.table;

          table.render({
              elem: '#currentTableId',
              url: '${pageContext.request.contextPath}/emp/empList',
              height:450,
              cols: [[
                  {checkbox:true, width:150},
                  {field: 'empId', width:150, title: 'ID', sort: true},
                  {field: 'empName', width:150, title: '员工姓名'},
                  {field: 'deptId', width:150, title: '部门'},
                  {field: 'postName', width:150, title: '职务'},
                  {field: 'sex', width:150, title: '性别'},
                  {field: 'phone', width:150, title: '手机号码', sort: true},
                  {field: 'address', width:150, title: '家庭地址'},
                  {field: 'left', title: '设置状态', width:150},
                  {field: 'left', width:150, title: '重置密码'},
                  {field: 'right', width:250, title: '操作',templet: '#currentTableBar'}
              ]],
              limits: [10, 15, 20, 25, 50, 100],
              limit: 15,
              page: true,
          });

          // 监听搜索操作
          form.on('submit(data-search-btn)', function (data) {
              var result = JSON.stringify(data.field);
              layer.alert(result, {
                  title: '最终的搜索信息'
              });

              //执行搜索重载
              table.reload('currentTableId', {
                  page: {
                      curr: 1
                  }
                  , where: {
                      searchParams: result
                  }
              }, 'data');

              return false;
          });

          // 监听添加操作
          $(".data-add-btn").on("click", function () {
              layer.msg('添加数据');
          });

          // 监听删除操作
          $(".data-delete-btn").on("click", function () {
              var checkStatus = table.checkStatus('currentTableId')
                  , data = checkStatus.data;
              layer.alert(JSON.stringify(data));
          });

          //监听表格复选框选择
          table.on('checkbox(currentTableFilter)', function (obj) {
              console.log(obj)
          });

          table.on('tool(currentTableFilter)', function (obj) {
              var data = obj.data;
              if (obj.event === 'edit') {
                  layer.alert('编辑行：<br>' + JSON.stringify(data))
              } else if (obj.event === 'delete') {
                  layer.confirm('真的删除行么', function (index) {
                      obj.del();
                      layer.close(index);
                  });
              }
          });

      });
  </script>

    <script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>
  </body>


</html>