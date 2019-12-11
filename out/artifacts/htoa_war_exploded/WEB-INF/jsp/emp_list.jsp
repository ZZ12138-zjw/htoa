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
                          <div class="layui-input-inline"  >
                              <select name="depName" id="selectDep">

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

          <script type="text/html" id="currentTableBar2">
              <button class="layui-btn layui-btn-danger" id="delSelect" ><i class="layui-icon"></i>批量删除</button>
              <button class="layui-btn" onclick="x_admin_show('添加员工','${pageContext.request.contextPath}/emp/to_empAdd')"><i class="layui-icon"></i>添加</button>
          </script>

          <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>
          <div class="layui-tab">
              <ul class="layui-tab-title">
                  <li class="layui-this">学历查看</li>
                  <li>教育背景</li>
                  <li>家庭联系信息</li>
                  <li>员工考核</li>
                  <li>证件上传</li>
              </ul>
              <div class="layui-tab-content" >
                  <div class="layui-tab-item layui-show">
                      <xblock>
                          <button class="layui-btn layui-btn-sm layui-btn-primary" onclick="delAll()">
                              <i class="layui-icon"> &#xe640;</i>批量删除
                          </button>
                          <button type="button" onclick="x_admin_show('添加用户','./admin-add.html')"  class="layui-btn layui-btn-sm layui-btn-primary">
                              <i class="layui-icon">&#xe654;</i>
                              添加
                          </button>
                      </xblock>
                      <table class="layui-hide" id="gzjlTable"></table>
                  </div>
                  <div class="layui-tab-item">
                      <xblock>
                          <button class="layui-btn layui-btn-sm layui-btn-primary" onclick="delAll()">
                              <i class="layui-icon"> &#xe640;</i>批量删除
                          </button>
                          <button type="button" onclick="x_admin_show('添加用户','./admin-add.html')"  class="layui-btn layui-btn-sm layui-btn-primary">
                              <i class="layui-icon">&#xe654;</i>
                              添加
                          </button>
                      </xblock>
                      <table class="layui-hide" id="jiaoyuTable"></table>
                  </div>
                  <div class="layui-tab-item">
                      <xblock>
                          <button class="layui-btn layui-btn-sm layui-btn-primary" onclick="delAll()">
                              <i class="layui-icon"> &#xe640;</i>批量删除
                          </button>
                          <button type="button" onclick="x_admin_show('添加用户','./admin-add.html')"  class="layui-btn layui-btn-sm layui-btn-primary">
                              <i class="layui-icon">&#xe654;</i>
                              添加
                          </button>
                      </xblock>
                      <table class="layui-hide" id="jiatingTable"></table>
                  </div>
                  <div class="layui-tab-item">
                      <xblock>
                          <button class="layui-btn layui-btn-sm layui-btn-primary" onclick="delAll()">
                              <i class="layui-icon"> &#xe640;</i>批量删除
                          </button>
                          <button type="button" onclick="x_admin_show('添加用户','./admin-add.html')"  class="layui-btn layui-btn-sm layui-btn-primary">
                              <i class="layui-icon">&#xe654;</i>
                              添加
                          </button>
                      </xblock>
                      <table class="layui-hide" id="ygTable"></table>
                  </div>
                  <div class="layui-tab-item">
                      <xblock>
                          <button class="layui-btn layui-btn-sm layui-btn-primary" onclick="delAll()">
                              <i class="layui-icon"> &#xe640;</i>批量删除
                          </button>
                          <button type="button" onclick="x_admin_show('添加用户','./admin-add.html')"  class="layui-btn layui-btn-sm layui-btn-primary">
                              <i class="layui-icon">&#xe654;</i>
                              添加
                          </button>
                      </xblock>
                      <table class="layui-hide" id="zjUpTable"></table>
                  </div>
              </div>
          </div>
          <script type="text/html" id="currentTableBar">
                  <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
                  <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
          </script>
          <script type="text/html" id="reset-btn">
               <a class="layui-btn layui-btn-xs" lay-event="resetPwd" >
                   <i class="layui-icon  layui-icon-refresh"></i>
                    重置密码
               </a>
          </script>
          <%--禁用启用--%>
          <script type="text/html" id="statusBtn">
              {{# if(d.status==1){ }}
                <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="prohibit">
                  <i class="layui-icon layui-icon-password"></i>
                  禁用
                </a>
              {{#}}}
              {{# if(d.status==0){}}
              <a class='layui-btn layui-btn-xs ' lay-event="enable">
                  <i class='layui-icon layui-icon-auz'></i>
                  启用
              </a>
              {{# } }}
          </script>

          <%--工作经历--%>
          <script type="text/html" id="gzjlBar">
              <a class="layui-btn layui-btn-xs layui-btn-primary data-count-edit" lay-event="edit"><i class="layui-icon">&#xe642;</i></a>
              <a class="layui-btn layui-btn-xs layui-btn-primary data-count-delete" lay-event="delete"><i class="layui-icon">&#xe640;</i></a>
          </script>
          <%--教育背景--%>
          <script type="text/html" id="jiaoyuTableBar">
              <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
              <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
          </script>
          <%--家庭背景--%>
          <script type="text/html" id="jiatingTableBar">
              <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
              <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
          </script>
          <%--家庭背景--%>
          <script type="text/html" id="jiatingTableBar">
              <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
              <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
          </script>
          <%--家庭背景--%>
          <script type="text/html" id="zjUpTableBar">
              <a class="layui-btn layui-btn-xs data-count-edit" lay-event="edit">编辑</a>
              <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>
          </script>
  </div>

  <script type="text/javascript">

        //选择部门下拉框赋值
        $(function () {
            $.get("${pageContext.request.contextPath}/emp/depName",{},function (data) {
                $("#selectDep").prepend("<option value='' class='layui-input'>未选择</option>");
                $.each(JSON.parse(data),function (index,item) {
                    $("#selectDep").append("<option value='"+item+"' >"+item+"</option>")
                });
                //最终的赋值填空是依赖这句话
                layui.form.render("select");
            });
        });

      layui.use(['form', 'table'], function () {
          var $ = layui.jquery,
              form = layui.form,
              table = layui.table;

          /*员工信息*/
          table.render({
              id:"currentTableId",
              elem: '#currentTableId',
              url: '${pageContext.request.contextPath}/emp/empList',
              cols: [[
                  {checkbox:true, width:50},
                  {field: 'empId', width:100, title: 'ID', sort: true},
                  {field: 'empName', width:150, title: '员工姓名'},
                  {field: 'depName', width:150, title: '部门'},
                  {field: 'postName', width:150, title: '职务'},
                  {field: 'sex', width:100, title: '性别'},
                  {field: 'phone', width:150, title: '手机号码'},
                  {field: 'address', width:100, title: '家庭地址'},
                  {field: 'center', title: '设置状态', width:150, templet:"#statusBtn"},
                  {field: 'center', width:150, title: '重置密码',toolbar:'#reset-btn'},
                  {field: 'right', width:250, title: '操作',toolbar: '#currentTableBar'}
              ]],
              limits: [10, 15, 20, 25, 50, 100],
              limit: 10,
              page: true,
              toolbar:"#currentTableBar2"
          });


          //监听行双击事件
          table.on('rowDouble(currentTableFilter)',function (obj) {
              var data=obj.data; //获取当前表格数据
              addSchedule(data.empId);
          });


          function  addSchedule(empId){

              /*工作经历*/
              table.render({
                  id:"gzjlTableId",
                  elem: '#gzjlTable',
                  url: '${pageContext.request.contextPath}/emp/jobList?empId='+empId,
                  cols: [[
                      {checkbox:true, width:50},
                      {field: 'companyName', width:100, title: '公司名称'},
                      {field: 'degree', width:80, title: '岗位'},
                      {field: 'startDate', width:150, title: '入职时间',templet:function (row) {
                             return  createTime(row.startDate);
                          }},
                      {field: 'endDate', width:200, title: '离职时间'},
                      {field: 'reason', width:250, title: '离职原因'},
                      {field: 'remark', width:250, title: '说明'},
                      {field: 'right', width:150, title: '操作',toolbar: '#gzjlBar'}
                  ]]
              });

              /*教育背景*/
              table.render({
                 id:'jiaoyuTableId',
                  elem:'#jiaoyuTable',
                  url:'${pageContext.request.contextPath}/emp/educationList?empId='+empId,
                  cols:[[
                      {checkbox:true, width:50},
                      {field: 'collegeName', width:100, title: '学校名称'},
                      {field: 'degree', width:80, title: '学历'},
                      {field: 'startDate', width:150, title: '入校时间',templet:function (row) {
                              return createTime(row.startDate);
                          }},
                      {field: 'endDate', width:200, title: '毕业时间',templet:function (row) {

                              return createTime(row.endDate);
                          }},
                      {field: 'remark', width:250, title: '说明'},
                      {field: 'right', width:150, title: '操作',toolbar: '#jiaoyuTableBar'}
                  ]]
              });
              /*家庭联系*/
              table.render({
                  id:"jiatingTableId",
                  elem: '#jiatingTable',
                  url: '${pageContext.request.contextPath}/emp/familylnfoList?empId='+empId,
                  cols: [[
                      {checkbox:true, width:50},
                      {field: 'contactName', width:150, title: '联系人名称'},
                      {field: 'relationship', width:150, title: '与员工关系'},
                      {field: 'Phone', width:150, title: '联系电话'},
                      {field: 'remark', width:250, title: '说明'},
                      {field: 'right', width:150, title: '操作',toolbar: '#jiatingTableBar'}
                  ]]
              });
              /*员工考核*/
              /*证件上传*/
              table.render({
                  id:"zjUpTableId",
                  elem: '#zjUpTable',
                  url: '${pageContext.request.contextPath}/emp/documentList?empId='+empId,
                  cols: [[
                      {checkbox:true, width:50},
                      {field: 'empId', width:100, title: '员工名称'},
                      {field: 'docName', width:80, title: '证件名称'},
                      {field: 'docPath', width:150, title: '上传证件'},
                      {field: 'upDate', width:150, title: '上传时间',templet:function (data) {
                              return createTime(data.upDate);
                          }},
                      {field: 'upEmp', width:150, title: '上传人'},
                      {field: 'remark', width:250, title: '备注'},
                      {field: 'right', width:150, title: '操作',toolbar: '#zjUpTableBar'}
                  ]]
              });

          }

          // 监听搜索操作
          form.on('submit(data-search-btn)', function (data) {
              var result = JSON.stringify(data.field);
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


          //批量删除
          $('#delSelect').on('click',function () {
              //获得表格CheckBox已经选中的行的信息
              //lay-data="id:info"
              var checkStatus=table.checkStatus('currentTableId'),
                  //返回的val ue
                  data=checkStatus.data;
              var ids=[];
              $(data).each(function (i,val) { //o即为表格中一行的数据
                  ids.push(val.empId);
              });
              if(data.length>0){
                  layer.confirm('确定要删除选中的部门吗?',{icon:3,title:'提示信息'},function (index) {
                      //layui中找到Checkbox所在的行,并遍历行的顺序
                      $("div.layui-table-body table tbody input[name='layTableCheckbox']:checked").each(function () { //遍历选中的checkbox
                          $.post("${pageContext.request.contextPath}/emp/deletes",{
                              empIds:ids.toString()
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


          table.on('tool(currentTableFilter)', function (obj) {
              var data = obj.data;
              if (obj.event === 'edit') {
                  x_admin_show('修改员工信息','<%=request.getContextPath()%>/emp/to_empUpdate?empId='+data.empId);
              } else if (obj.event === 'delete') {
                  layer.confirm('真的删除行么', function (index) {
                      $.ajax({
                          url: '${pageContext.request.contextPath}/emp/delete',
                          data:{empId:data.empId},
                          type: "post",
                          success: function(suc) {
                              obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                              layer.close(index);
                              layer.msg("删除成功", {
                                  icon: 1
                              });
                          }
                      });
                  });
              }else if (obj.event =="enable"){
                  layer.confirm('真的启用么', function (index) {
                      $.post("${pageContext.request.contextPath}/emp/udtStatus",{empId:data.empId,status:1},function (callVla) {
                          //表格重载
                          table_reload(data);
                          layer.msg("启用成功！",{icon:6,time:1000});
                      });
                      layer.close(index);
                  });
              }else if (obj.event=="prohibit"){
                  layer.confirm('真的禁用么', function (index) {
                      $.post("${pageContext.request.contextPath}/emp/udtStatus",{empId:data.empId,status:0},function (callVla) {
                          //表格重载
                          table_reload(data);
                          layer.msg("禁用成功！",{icon:6,time:1000});
                      });
                      layer.close(index);
                  });
              }else if (obj.event=="resetPwd"){
                  layer.confirm('确定要重置密码么', function (index) {
                      $.post("${pageContext.request.contextPath}/emp/resetPwd",{empId:data.empId},function (callVla) {
                          //表格重载
                          table_reload();
                          layer.msg("重置密码成功！",{icon:6,time:1000});
                      });
                      layer.close(index);
                  });
              }
          });
          
      });


      //重载表格
      function table_reload(){
          var table=layui.table;
          //执行搜索重载
          table.reload('currentTableId', {
              page: {
                  curr: 1
              }
              , where: {
              }
              ,text:{none:'无数据'}
          }, 'data');
      }

  </script>

    <script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>


  </body>


</html>