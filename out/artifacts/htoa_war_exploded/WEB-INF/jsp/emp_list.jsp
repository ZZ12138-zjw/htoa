<%@ page import="com.ht.vo.employee.PostName" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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


          <%--员工表--%>
          <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

          <%--附表选项页--%>
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
                          <button class="layui-btn layui-btn-sm layui-btn-primary" id="gljlAdd" >
                              <i class="layui-icon">&#xe654;</i>
                              添加
                          </button>
                      </xblock>
                      <table class="layui-hide" id="gzjlTable"  lay-filter="gzjlTableFilter" ></table>
                  </div>
                  <div class="layui-tab-item">
                      <xblock>
                          <button   class="layui-btn layui-btn-sm layui-btn-primary"  id="jtbjAdd">
                              <i class="layui-icon">&#xe654;</i>
                              添加
                          </button>
                      </xblock>
                      <table class="layui-hide" id="jiaoyuTable" lay-filter="jiaoyuTableFilter"></table>
                  </div>
                  <div class="layui-tab-item">
                      <xblock>
                          <button   class="layui-btn layui-btn-sm layui-btn-primary" id="jiatingAdd">
                              <i class="layui-icon">&#xe654;</i>
                              添加
                          </button>
                      </xblock>
                      <table class="layui-hide" id="jiatingTable" lay-filter="jiatingTableFilter"></table>
                  </div>
                  <div class="layui-tab-item">
                      <xblock>
                          <button   class="layui-btn layui-btn-sm layui-btn-primary"  id="ygAdd">
                              <i class="layui-icon">&#xe654;</i>
                              添加
                          </button>
                      </xblock>
                      <table class="layui-hide" id="ygTable" lay-filter="ygTableFilter"></table>
                  </div>
                  <div class="layui-tab-item">
                      <xblock>
                          <button   class="layui-btn layui-btn-sm layui-btn-primary"  id="zjAdd">
                              <i class="layui-icon">&#xe654;</i>
                              添加
                          </button>
                      </xblock>
                      <table class="layui-hide" id="zjUpTable" lay-filter="zjUpTableFilter"></table>
                  </div>
              </div>
          </div>

          <%--员工表工具--%>
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
          <script type="text/html" id="currentTableBar2">
              <button class="layui-btn" onclick="x_admin_show('添加员工','${pageContext.request.contextPath}/emp/to_empAdd')"><i class="layui-icon"></i>添加</button>
          </script>
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
              <button class="layui-btn layui-btn-xs layui-btn-primary data-count-edit" lay-event="edit"><i class="layui-icon">&#xe642;</i></button>
              <button class="layui-btn layui-btn-xs layui-btn-primary data-count-delete" lay-event="delete"><i class="layui-icon">&#xe640;</i></button>
          </script>
          <%--教育背景--%>
          <script type="text/html" id="jiaoyuTableBar">
              <button class="layui-btn layui-btn-xs layui-btn-primary data-count-edit" lay-event="edit"><i class="layui-icon">&#xe642;</i></button>
              <button class="layui-btn layui-btn-xs layui-btn-primary data-count-delete" lay-event="delete"><i class="layui-icon">&#xe640;</i></button>
          </script>
          <%--家庭背景--%>
          <script type="text/html" id="jiatingTableBar">
              <button class="layui-btn layui-btn-xs layui-btn-primary data-count-edit" lay-event="edit"><i class="layui-icon">&#xe642;</i></button>
              <button class="layui-btn layui-btn-xs layui-btn-primary data-count-delete" lay-event="delete"><i class="layui-icon">&#xe640;</i></button>
          </script>
          <%--家庭背景--%>
          <script type="text/html" id="ygTableBar">
              <button class="layui-btn layui-btn-xs layui-btn-primary data-count-edit" lay-event="edit"><i class="layui-icon">&#xe642;</i></button>
              <button class="layui-btn layui-btn-xs layui-btn-primary data-count-delete" lay-event="delete"><i class="layui-icon">&#xe640;</i></button>
          </script>
          <%--证件背景--%>
          <script type="text/html" id="zjUpTableBar">
              <button class="layui-btn layui-btn-xs layui-btn-primary " lay-event="download"><i class="layui-icon">&#xe601;</i></button>
              <button class="layui-btn layui-btn-xs layui-btn-primary data-count-delete" lay-event="delete"><i class="layui-icon">&#xe640;</i></button>
          </script>
    </div>
  </div>
  </body>
  <script type="text/javascript">
      layui.use(['form', 'table'], function () {
          var $ = layui.jquery, form = layui.form,table = layui.table,layer=layui.layer;

          /*员工信息*/
          table.render({
              id:"currentTableId",
              elem: '#currentTableId',
              url: '${pageContext.request.contextPath}/emp/empList',
              cols: [[
                  {type:'radio', width:50},
                  {field: 'empId', width:100, title: 'ID', sort: true},
                  {field: 'empName', width:150, title: '员工姓名'},
                  {field: 'depName', width:150, title: '部门'},
                  {field: 'postName', width:150, title: '职务'},
                  {field: 'sex', width:100, title: '性别'},
                  {field: 'phone', width:150, title: '手机号码'},
                  {field: 'address', width:250, title: '家庭地址'},
                  {field: 'center', title: '设置状态', width:150, templet:"#statusBtn"},
                  {field: 'center', width:150, title: '重置密码',toolbar:'#reset-btn'},
                  {field: 'right', width:250, title: '操作',toolbar: '#currentTableBar'}
              ]],
              limits: [10, 15, 20, 25, 50, 100],
              limit: 10,
              page: true,
              toolbar:"#currentTableBar2"
          });


          //监听行单击事件(查看附表信息)
          table.on('row(currentTableFilter)',function (obj) {
              var data=obj.data; //获取当前表格数据
              //选中行样式
              obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
              //选中radio样式
              obj.tr.find('i[class="layui-anim layui-icon"]').trigger("click");
              addSchedule(data.empId,table);

          });

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

          //监听工作经历表格工具栏
          table.on('tool(gzjlTableFilter)',function (obj) {
              var data=obj.data;
              if (obj.event=='edit'){
                  x_admin_show('修改工作经历信息','<%=request.getContextPath()%>/emp/to_jobUpdate?jobid='+data.jobid);
              }else if(obj.event='delete'){
                    layer.confirm("你确定要删除这条信息吗？",{icon:3},function (index) {
                        $.post('${pageContext.request.contextPath}/emp/jobDelete',{jobid:data.jobid},function (data) {
                            if ("success"==data){
                                layer.close(index);
                                layer.msg("删除成功!",{icon:6});
                                obj.del();
                            }else {
                                layer.msg("删除失败！",{icon:2});
                            }
                        },"text");
                    });
              }
          });

          //监听教育背景表格工具栏
          table.on("tool(jiaoyuTableFilter)",function (obj) {
              var data=obj.data;
              if (obj.event=='edit'){
                  x_admin_show('修改教育背景信息','${pageContext.request.contextPath}/emp/to_eduationUpdate?collegeid='+data.collegeid);
              }else if(obj.event='delete'){
                  layer.confirm("你确定要删除这条信息吗？",{icon:3},function (index) {
                      $.post('${pageContext.request.contextPath}/emp/eduationDelete',{collegeid:data.collegeid},function (data) {
                          if ("success"==data){
                              layer.close(index);
                              layer.msg("删除成功!",{icon:6});
                              obj.del();
                          }else {
                              layer.msg("删除失败！",{icon:2});
                          }
                      },"text");
                  });
              }
          });

          //监听证件表格工具栏
          table.on("tool(zjUpTableFilter)",function (obj) {
              var data=obj.data;
              if (obj.event=='download'){
                  layer.confirm("你确定要下载吗",function (index) {
                        layer.msg("好吧");
                  });
              }else if(obj.event='delete'){
                  layer.confirm("你确定要删除这条信息吗？",{icon:3},function (index) {
                      $.post('${pageContext.request.contextPath}/emp/docDelete',{dId:data.dId},function (data) {
                          if ("success"==data){
                              layer.close(index);
                              layer.msg("删除成功!",{icon:6});
                              obj.del();
                          }else {
                              layer.msg("删除失败！",{icon:2});
                          }
                      },"text");
                  });
              }
          });

          //监听家庭表格工具栏
          table.on("tool(jiatingTableFilter)",function (obj) {
              var data=obj.data;
              if (obj.event=='edit'){
                  x_admin_show('修改证件信息','${pageContext.request.contextPath}/emp/to_familyUpdate?familyid='+data.familyid);
              }else if(obj.event='delete'){
                  layer.confirm("你确定要删除这条信息吗？",{icon:3},function (index) {
                      $.post('${pageContext.request.contextPath}/emp/familyDelete',{familyid:data.familyid},function (data) {
                          if ("success"==data){
                              layer.close(index);
                              layer.msg("删除成功!",{icon:6});
                              obj.del();
                          }else {
                              layer.msg("删除失败！",{icon:2});
                          }
                      },"text");
                  });
              }
          });

          //监听员工考核工具栏
          table.on("tool(ygTableFilter)",function (obj) {
              var data=obj.data;
              if (obj.event=='edit'){
                  x_admin_show('修改员工考核信息','${pageContext.request.contextPath}/emp/to_checkInsertUpdate?id='+data.ID);
              }else if(obj.event='delete'){
                  layer.confirm("你确定要删除这条信息吗？",{icon:3},function (index) {
                      $.post('${pageContext.request.contextPath}/emp/checkInsertDalete',{id:data.ID},function (data) {
                          if ("success"==data){
                              layer.close(index);
                              layer.msg("删除成功!",{icon:6});
                              obj.del();
                          }else {
                              layer.msg("删除失败！",{icon:2});
                          }
                      },"text");
                  });
              }
          });
         /* //批量删除
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
                          $.post("/emp/deletes",{
                              empIds:ids.toString()
                          },function(data){
                              if ('success'==data){
                                  var n=$(this).parents("tbody tr").index();  //获取checkBox所在行的顺序
                                  //移除行
                                  $("div.layui-table-body table tbody").find("tr:eq("+n+")").remove();
                                  //如果是全选移除，就将全选CheckBox还原为未选中状态
                                  $("div.layui-table-header table thead div.layui-unselect.layui-form-checkbox").removeClass("layui-form-checked");
                                  /!*setTimeout(function () {
                                      window.location.reload(); //修改成功后刷新父界面
                                  })*!/
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
          });*/

          /*工具经历添加*/
          $('#gljlAdd').on('click',function () {
            var checkStatus = table.checkStatus('currentTableId');
            var data=checkStatus.data;
            if (data==""){
               layer.msg("请选择一个员工");
            }else {
                var empId="";
                $.each(data,function (i,val) {
                    empId=val.empId;
                });
                x_admin_show('添加工作经历','${pageContext.request.contextPath}/emp/to_jobAdd?empId='+empId);
            }
          });

          /*教育背景添加*/
          $("#jtbjAdd").on('click',function () {
              var checkStatus = table.checkStatus('currentTableId');
              var data=checkStatus.data;
              if (data==""){
                  layer.msg("请选择一个员工");
              }else {
                  var empId="";
                  $.each(data,function (i,val) {
                      empId=val.empId;
                  });
                  x_admin_show('添加教育背景','${pageContext.request.contextPath}/emp/to_eduationAdd?empId='+empId);
              }
          });


          /*家庭背景添加*/
          $("#jiatingAdd").on('click',function () {
              var checkStatus = table.checkStatus('currentTableId');
              var data=checkStatus.data;
              if (data==""){
                  layer.msg("请选择一个员工");
              }else {
                  var empId="";
                  $.each(data,function (i,val) {
                      empId=val.empId;
                  });
                  x_admin_show('添加家庭背景','${pageContext.request.contextPath}/emp/to_familyAdd?empId='+empId);
              }
          });

          /*员工考核管理*/
          $("#ygAdd").on('click',function () {
              var checkStatus = table.checkStatus('currentTableId');
              var data=checkStatus.data;
              if (data==""){
                  layer.msg("请选择一个员工");
              }else {
                  var empId="";
                  $.each(data,function (i,val) {
                      empId=val.empId;
                  });
                  x_admin_show('添加员工考核','${pageContext.request.contextPath}/emp/to_checkInsertAdd?empId='+empId);
              }
          });

          /*证件管理*/
          $("#zjAdd").on('click',function () {
              var checkStatus = table.checkStatus('currentTableId');
              var data=checkStatus.data;
              if (data==""){
                  layer.msg("请选择一个员工");
              }else {
                  var empId="";
                  $.each(data,function (i,val) {
                      empId=val.empId;
                  });
                  x_admin_show('添加员工证件','${pageContext.request.contextPath}/emp/to_docAdd?empId='+empId);
              }
          });


          //监听员工表的工具栏
          table.on('tool(currentTableFilter)', function (obj) {
              var data = obj.data;
              if (obj.event == 'edit') {
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

      //附表表格赋值
      function  addSchedule(empId,table){
          /*工作经历*/
          table.render({
              id:"gzjlTableId",
              elem: '#gzjlTable',
              url: '${pageContext.request.contextPath}/emp/jobList?empId='+empId,
              height:300,
              cols: [[
                  {field: 'companyName', width:100, title: '公司名称'},
                  {field: 'degree', width:80, title: '岗位'},
                  {field: 'startDate', width:150, title: '入职时间',templet:function (row) {
                          return  createTime(row.startDate);
                      }},
                  {field: 'endDate', width:200, title: '离职时间',templet:function (row) {
                        return createTime(row.endDate);
                      }},
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
              height:300,
              cols:[[
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
              height:300,
              cols: [[
                  {field: 'contactName', width:150, title: '联系人名称'},
                  {field: 'relationship', width:150, title: '与员工关系'},
                  {field: 'phone', width:150, title: '联系电话'},
                  {field: 'remark', width:250, title: '说明'},
                  {field: 'right', width:150, title: '操作',toolbar: '#jiatingTableBar'}
              ]]
          });
          /*员工考核*/
          /*家庭联系*/
          table.render({
              id:"ygTableId",
              elem: '#ygTable',
              url: '${pageContext.request.contextPath}/emp/checkList?empId='+empId,
              height:300,
              cols: [[
                  {field: 'checkContent', width:150, title: '考核指标'},
                  {field: 'checkScore', width:150, title: '考核分数'},
                  {field: 'checkDate', width:150, title: '考核时间'},
                  {field: 'checkExplain', width:250, title: '说明'},
                  {field: 'inputEmp', width:250, title: '录入人员'},
                  {field: 'right', width:150, title: '操作',toolbar: '#ygTableBar'}
              ]]
          });

          /*证件上传*/
          table.render({
              id:"zjUpTableId",
              elem: '#zjUpTable',
              url: '${pageContext.request.contextPath}/emp/documentList?empId='+empId,
              height:300,
              cols: [[
                  {field: 'empName', width:100, title: '员工名称'},
                  {field: 'dName', width:80, title: '证件名称'},
                  {field: 'dPath', width:150, title: '上传证件',templet:'<div><img src="${pageContext.request.contextPath}/images/{{d.dPath}}"/></div>'},
                  {field: 'uDate', width:150, title: '上传时间'},
                  {field: 'upName', width:150, title: '上传人'},
                  {field: 'remark', width:250, title: '备注'},
                  {field: 'right', width:150, title: '操作',toolbar: '#zjUpTableBar'}
              ]]
          });

      }

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

  </script>
</html>