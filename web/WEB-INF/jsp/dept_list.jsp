
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
  <div class="x-nav">
      <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
          <i class="layui-icon" style="line-height:38px">ဂ</i></a>
  </div>
  <div class="x-body">
      <xblock>
          <button class="layui-btn layui-btn-danger" id="delSelect" ><i class="layui-icon"></i>批量删除</button>
          <button class="layui-btn" onclick="x_admin_show('添加用户','${pageContext.request.contextPath}/dept/to_deptAdd')"><i class="layui-icon"></i>添加</button>
      </xblock>
      <table class="layui-hide" id="complainTable" lay-filter="complainList" lay-data="id:'info'"></table>


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

      layui.use(['table','layer','form','laypage'], function(){
          var table = layui.table,
              layer = layui.layer,
              form = layui.form,
              laypage = layui.laypage,
              $=layer.jquery;


          table.render({
              id:"provinceReload"
              ,elem: '#complainTable'  //指定原始表格元素选择器(推荐id选择器)
              ,url:'${pageContext.request.contextPath}/dept/depList'
              ,page: true   //开启分页
              ,method:'post'  //请求方式
              ,limit:10   //分页默认大小
              ,cols: [   //标题栏
                  [
                       {checkbox:true}//开启多选框
                      ,{field:'depid', width:250,title: 'ID'}
                      ,{field:'depName',width:250, title: '部门名称'}
                      ,{field:'parentId',width:250, title: '上级部门'}
                      ,{field:'chairman',width:250, title: '部门负责人'}
                      ,{field:'remark',width:350,title: '备注'}
                      ,{fixed: 'right', title:'操作',width:200,toolbar: '#barDemo'}
                  ]
              ]
              ,limits: [5,10,20,50]
          });

            //监听表格复选框选择
          table.on('checkbox(demo)',function (obj) {
              alert(res);
          });


            //监听工具条
          table.on('tool(complainList)', function(obj) {
              var data = obj.data;
              json = JSON.stringify(data);
              switch(obj.event) {
                  case 'edit':
                      var w;
                      var h;
                      if (w == null || w == '') {
                          w=($(window).width()*0.9);
                      };
                      if (h == null || h == '') {
                          h=($(window).height() - 50);
                      };
                      var index = layer.open({
                          type: 2,
                          title: "编辑部门页面",
                          area: [w+'px', h +'px'],
                          fix: false, //不固定
                          maxmin: true,
                          shadeClose: true,
                          shade: 0.4,
                          skin: 'layui-layer-rim',
                          content: ["${pageContext.request.contextPath}/dept/to_deptUpdate?depId="+data.depid, "no"],
                      });
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
                                      console.log(delIndex);
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

            //批量删除
          $("#delSelect").on('click',function () {
              alert("我进来了");
              //获得表格CheckBox已经选中的行的信息
              //lay-data="id:info"
              var checkStatus=table.checkStatus('info'),
              //返回的value
              data=checkStatus.data;
              if(data.length>0){
                    layer.confirm('确定要删除选中的部门吗?',{icon:3,title:'提示信息'},function (index) {
                        //layui中找到Checkbox所在的行,并遍历行的顺序
                        $("div.layui-table-body table tbody input[name='layTableCheckbox']:checked").each(function () { //遍历选中的checkbox
                               var n=$(this).parents("tbody tr").index();  //获取checkBox所在行的顺序
                                //移除行
                                $("div.layui-table-body table tbody").find("tr:eq("+n+")").remove();
                                //如果是全选移除，就将全选CheckBox还原为未选中状态
                                $("div.layui-table-header table thead div.layui-unselect.layui-form-checkbox").removeClass("layui-form-checked");
                        });
                        //关闭弹窗
                        layer.close(index);
                    });
              }else {
                  layer.msg('请选择需要删除的行');
              }
          }); //批量删除操作结束



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



      function delAll (argument) {
        var data = tableCheck.getData();
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            $.post("${pageContext.request.contextPath}/dept/deletes",data
            ,function (data) {
                layer.msg('删除成功', {icon: 1});
                $(".layui-form-checked").not('.header').parents('tr').remove();
            });
        });
      };




    </script>

    <script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>
  </body>


</html>