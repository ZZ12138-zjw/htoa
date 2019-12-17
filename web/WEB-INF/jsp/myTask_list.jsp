
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>我的任务</title>
    <jsp:include page="top.jsp"/>
  </head>

  <body>
  <div class="x-body">

      <table class="layui-hide" id="complainTable" lay-filter="complainList" ></table>

      <script type="text/html" id="barDemo2">
          <button class="layui-btn" onclick="javascript:location.replace('${pageContext.request.contextPath}/empLeave/to_holidayList')">返回</button>
      </script>

      <script type="text/html" id="barDemo">
          <a class="layui-btn layui-btn-xs" lay-event="edit" >审批</a>
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
              ,url:'${pageContext.request.contextPath}/empLeave/myTack'
              ,page: true   //开启分页
              ,method:'post'  //请求方式
              ,limit:10   //分页默认大小
              ,height:450
              ,toolbar:"#barDemo2" //开启头部工具栏，并为其绑定左侧模板
              ,cols: [   //标题栏
                  [
                      {field:'holidayid', width:100,title: '编号',sort:true}
                      ,{field:'empName',width:100, title: '请假人'}
                      ,{field:'holidayDay',width:100, title: '请假时长'}
                      ,{field:'startTime',width:150, title: '开始时间',templet:function (d) {
                          return createDate(d.startTime)
                      }}
                      ,{field:'endTime',width:150,title: '结束时间',templet:function (d) {
                          return createDate(d.endTime)
                      }}
                      ,{field:'status',width:100,title: '状态',templet:function (d) {
                          if (d.status==1){
                              return "<span>审批中</span>"
                          }else if(d.status==2){
                              return "<span>已完成</span>"
                          }else if(d.status==3){
                              return "<span>不批准</span>"
                          }
                      }}
                      ,{field:'remark',width:250,title: '备注'}
                      ,{field: 'right', title:'操作',width:100,toolbar: '#barDemo'}
                  ]
              ]
              ,limits: [5,10,20,50]
          });

          //监听工具条
          table.on('tool(complainList)', function(obj) {
              var data = obj.data;
              json = JSON.stringify(data);
              if(obj.event=='edit'){
                x_admin_show('审批','${pageContext.request.contextPath}/empLeave/to_empLeaveAdult');
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