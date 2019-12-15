
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>考勤审核</title>
    <jsp:include page="top.jsp"/>
  </head>

  <body>

  <div class="x-body">
      <script type="text/html" id="barDemo2">
          <a class="layui-btn layui-btn-sm" onclick="javascript:location.replace('${pageContext.request.contextPath}/attendance/to_attendanceList')">返回</a>
      </script>
      <table class="layui-hide" id="attendanceTable" lay-filter="attendanceTableFilter" ></table>
      <script type="text/html" id="barDemo">
          <a class="layui-btn layui-btn-xs" lay-event="edit" >审批</a>
      </script>
  </div>

    <script>
      layui.use('laydate', function(){
        var laydate = layui.laydate;

      });

      layui.use(['table','layer','form','laypage','jquery'], function(){
          var table = layui.table,
              layer = layui.layer,
              form = layui.form,
              laypage = layui.laypage,
              $ =layui.jquery;


          table.render({
              id:"attendanceTableId"
              ,elem: '#attendanceTable'  //指定原始表格元素选择器(推荐id选择器)
              ,url:'${pageContext.request.contextPath}/attendance/attendanceListByEmp'
              ,page: true   //开启分页
              ,method:'post'  //请求方式
              ,limit:10   //分页默认大小
              ,height:450
              ,toolbar:"#barDemo2" //开启头部工具栏，并为其绑定左侧模板
              ,cols: [   //标题栏
                  [

                      {field:'attId', width:100,title: '编号',sort:true}
                      ,{field:'empName',width:100, title: '员工姓名'}
                      ,{field:'notTime',width:150, title: '未打卡时间'}
                      ,{field:'explanation',width:250, title: '原因说明'}
                      ,{field:'auditor',width:150,title: '审核人'}
                      ,{field:'auditorTime',width:150,title: '审核时间',templet:function (d) {
                          if (d.auditorTime==null){
                                return "<span>审批中</span>"
                          }else {
                              return createDate(d.auditorTime);
                          }
                      }}
                      ,{field:'auditorEx',width:250,title: '审核说明'}
                      ,{field:'status',width:100,title: '状态',templet:function(d){
                               if (d.status==1){
                                   return '<span>审批中</span>'
                               }else if (d.status==2){
                                    return '<span>已完成</span>'
                               }else if (d.status==3){
                                   return '<span>不批准</span>'
                               }
                      }},
                      {field:"right",title:'操作',toolbar:'#barDemo'}
                  ]
              ]
              ,limits: [5,10,20,50]
          });


          //监听工具条
          table.on('tool(attendanceTableFilter)', function(obj) {
              var data = obj.data;
              if (obj.event='edit'){
                  x_admin_show('审核','${pageContext.request.contextPath}/attendance/to_attendanceUpdate?attId='+data.attId)
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