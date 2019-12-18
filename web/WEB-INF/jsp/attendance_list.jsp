
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>考勤管理</title>
    <jsp:include page="top.jsp"/>
  </head>

  <body>

  <div class="x-body">
      <script type="text/html" id="barDemo2">
          <button class="layui-btn" onclick="x_admin_show('添加考勤','${pageContext.request.contextPath}/attendance/to_attendanceAdd')"><i class="layui-icon"></i>添加</button>
          <a class="layui-btn" href="javascript:location.replace('${pageContext.request.contextPath}/attendance/to_attendanceAuditorList');">我的审批</a>
      </script>
      <table class="layui-hide" id="attendanceTable" lay-filter="attendanceTableFilter" ></table>
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
              ,url:'${pageContext.request.contextPath}/attendance/attendanceList'
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
                      }}
                  ]
              ]
              ,limits: [5,10,20,50]
          });

      });
    </script>

  </body>


</html>