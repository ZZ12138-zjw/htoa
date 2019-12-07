<%@ page import="com.ht.vo.employee.PostName" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>员工列表</title>
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
                          <label class="layui-form-label">部门名称</label>
                          <div class="layui-input-inline">
                              <select name="depName">
                                <option value="" class="layui-input">未选择</option>
                                <option value="宏图软件教育" class="layui-input">宏图软件教育</option>
                              </select>
                          </div>
                      </div>
                          <div class="layui-inline">
                              <label class="layui-form-label">员工姓名</label>
                              <div class="layui-input-inline">
                                  <input type="text" name="empName" autocomplete="off" class="layui-input">
                              </div>
                          </div>
                          <div class="layui-inline">
                              <label class="layui-form-label">手机号码</label>
                              <div class="layui-input-inline">
                                  <input type="number" name="phone" autocomplete="off" class="layui-input">
                              </div>
                          </div>
                          <div class="layui-inline">
                              <label class="layui-form-label">员工状态</label>
                              <div class="layui-input-inline">
                                  <select name="status">
                                      <option value="" class="layui-input">未选择</option>
                                      <option value="1" class="layui-input">启用</option>
                                      <option value="0" class="layui-input">禁用</option>
                                  </select>
                              </div>
                          </div>
                          <div class="layui-inline">
                              <label class="layui-form-label">员工职务</label>
                              <div class="layui-input-inline">
                                  <select name="postName">
                                      <option value="" class="layui-input">未选择</option>
                                 <% for(int i=0;i<PostName.postNames().size();i++){%>
                                      <option value="<%=PostName.postNames().get(i)%>" class="layui-input"><%=PostName.postNames().get(i)%></option>
                                <%}%>
                                  </select>
                              </div>
                          </div>
                          <div class="layui-inline">
                              <a class="layui-btn" lay-submit="" lay-filter="data-search-btn">搜索</a>
                          </div>
                      </div>
                  </form>
              </div>
          </fieldset>

          <xblock>
              <button class="layui-btn layui-btn-danger" id="delSelect" ><i class="layui-icon"></i>批量删除</button>
              <button class="layui-btn" onclick="x_admin_show('添加用户','${pageContext.request.contextPath}/dept/to_deptAdd')"><i class="layui-icon"></i>添加</button>
          </xblock>
          <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>
          <script type="text/html" id="currentTableBar">
              <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
              <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
          </script>
          <script type="text/html" id="toolbarDemo">
              <div class="layui-btn-container">
                  <button class="layui-btn layui-btn-xs" lay-event="add">添加</button>
              </div>
          </script>

          <script type="text/html" id="reset-btn">
               <a class="layui-btn layui-btn-xs" >
                   <i class="layui-icon  layui-icon-refresh"></i>
                    重置密码
               </a>
          </script>
          <script type="text/html" id="prohibit">
              <a class="layui-btn layui-btn-xs layui-btn-danger" >
                  <i class="layui-icon layui-icon-password"></i>
                  禁用
              </a>
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
                  {field: 'depName', width:150, title: '部门'},
                  {field: 'postName', width:150, title: '职务'},
                  {field: 'sex', width:150, title: '性别'},
                  {field: 'phone', width:150, title: '手机号码'},
                  {field: 'address', width:100, title: '家庭地址'},
                  {field: 'center', title: '设置状态', width:150,toolbar:'#prohibit'},
                  {field: 'center', width:150, title: '重置密码',toolbar:'#reset-btn'},
                  {field: 'right', width:250, title: '操作',toolbar: '#currentTableBar'}
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
                      depName:data.field.depName,
                      postName:data.field.postName,
                      status:data.field.status,
                      phone:data.field.phone,
                      empName:data.field.empName
                  }
                  ,text:{none:'无数据'}
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