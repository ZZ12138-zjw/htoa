
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>部门列表</title>
    <jsp:include page="top.jsp"/>
  </head>

  <body>
  <%--<div class="x-nav">
      <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
          <i class="layui-icon" style="line-height:38px">ဂ</i></a>
  </div>--%>
  <div class="x-body">
      <script type="text/html" id="barDemo2">
          <button class="layui-btn layui-btn-danger" id="delSelect" ><i class="layui-icon"></i>批量删除</button>
          <button class="layui-btn" onclick="x_admin_show('添加用户','${pageContext.request.contextPath}/dept/to_deptAdd')"><i class="layui-icon"></i>添加</button>
      </script>
      <table class="layui-hide" id="complainTable" lay-filter="complainList" ></table>

      <script type="text/html" id="barDemo">
          <a class="layui-btn layui-btn-xs" lay-event="edit" >  编辑</a>
          <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" >删除</a>
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

      layui.use(['table','layer','form','laypage','jquery'], function(){
          var table = layui.table,
              layer = layui.layer,
              form = layui.form,
              laypage = layui.laypage,
              $ =layui.jquery;


          table.render({
              id:"provinceReload"
              ,elem: '#complainTable'  //指定原始表格元素选择器(推荐id选择器)
              ,url:'${pageContext.request.contextPath}/dept/depList'
              ,page: true   //开启分页
              ,method:'post'  //请求方式
              ,c:10   //分页默认大小
              ,height:450
              ,toolbar:"#barDemo2", //开启头部工具栏，并为其绑定左侧模板
              defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                  title: '提示',
                  layEvent: 'LAYTABLE_TIPS',
                  icon: 'layui-icon-tips'
              }]
              ,cols: [   //标题栏
                  [
                       {checkbox:true}//开启多选框
                      ,{field:'depid', width:100,title: 'ID',sort:true}
                      ,{field:'depName',width:150, title: '部门名称'}
                      ,{field:'parentId',width:150, title: '上级部门'}
                      ,{field:'empName',width:150, title: '部门负责人'}
                      ,{field:'remark',width:450,title: '备注'}
                      ,{field: 'right', title:'操作',width:200,toolbar: '#barDemo'}
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
                 ids.push(val.depid);
              });
              if(data.length>0){
                  layer.confirm('确定要删除选中的部门吗?',{icon:3,title:'提示信息'},function (index) {

                      //layui中找到Checkbox所在的行,并遍历行的顺序
                      $("div.layui-table-body table tbody input[name='layTableCheckbox']:checked").each(function () { //遍历选中的checkbox
                          $.post("${pageContext.request.contextPath}/dept/deletes",{
                              depids:ids.toString()
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
          table.on('tool(complainList)', function(obj) {
              var data = obj.data;
              json = JSON.stringify(data);
              switch(obj.event) {
                  case 'edit':
                      x_admin_show('修改员工信息',"${pageContext.request.contextPath}/dept/to_deptUpdate?depId="+data.depid);
                      break;
                  case 'del':
                      var delIndex = layer.confirm('真的删除id为' + data.depid + "的信息吗?", function(delIndex) {
                          $.ajax({
                              url: '${pageContext.request.contextPath}/dept/delete',
                              data:{depid:data.depid},
                              type: "post",
                              success: function(suc) {
                                      obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                                      layer.close(delIndex);
                                      layer.msg("删除成功", {
                                          icon: 1
                                      });
                              }
                          });
                          //关闭弹窗
                          layer.close(delIndex);
                      });
                      break;
              }
          });

          //添加采集设备
          $("#bin-add").on('click',function () {
              //打开窗口
              layer.open({
                  type: 2,
                  title: '采集设备添加',
                  maxmin: true,
                  area: ['420px', '330px'],
                  shadeClose: false, //点击遮罩关闭
                  content: 'CollectorAdd-form.html' //你要跳往的地方
              })
          });

          //搜索功能的实现
          $('.demoTable .layui-btn').on('click', function () {
              var type = $(this).data('type');
              active[type] ? active[type].call(this) : '';
          });

          var $=layui.$,active={
              reload:function(){

                  //搜索框对象
                 var demoReload=$("#demoReload");

                 //执行重载
                  table.reload('idTest',{
                     whrer:{
                         key:{
                             //搜索框里面的值
                             field:demoReload.val()
                         }
                     }
                  });
              }
          };

          $('.demoTable .layui-btn').on('click', function () {
              var type = $(this).data('type');
              active[type] ? active[type].call(this) : '';
          });

          //刷新
          $('#btn-refresh').on('click',function () {
              table.reload();
          });


      });

      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              $.post("${pageContext.request.contextPath}/dept/delete",{
                  depid:id
              },function (data) {
                  $(obj).parents("tr").remove();
                  layer.msg('已删除!',{icon:1,time:1000});
              });
          });
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