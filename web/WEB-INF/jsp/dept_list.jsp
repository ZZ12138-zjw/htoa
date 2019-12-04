
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
          <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
          <button class="layui-btn" onclick="x_admin_show('添加用户','${pageContext.request.contextPath}/dept/to_dept_add')"><i class="layui-icon"></i>添加</button>
          <span class="x-right" style="line-height:40px">共有数据：${deptCount} 条</span>
      </xblock>
      <table class="layui-table">
          <thead>
          <tr>
              <th>
                  <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
              </th>
              <th>ID</th>
              <th>部门名称</th>
              <th>父部门名称</th>
              <th>部门负责人</th>
              <th>备注</th>
              <th>操作</th>
          </thead>
          <tbody>
          <c:forEach items="${deptList}" var="d" >
              <tr>
                  <td>
                      <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
                  </td>
                  <td>${d.depid}</td>
                  <td>${d.depName}</td>
                  <td>${d.parentId}</td>
                  <td>${d.chairman}</td>
                  <td>${d.remark}</td>
                  <td>
                      <a title="编辑"  onclick="x_admin_show('编辑','admin-edit.html')" href="javascript:;">
                          <i class="layui-icon">&#xe642;</i>
                      </a>
                      <a title="删除" onclick="member_del(this,'${d.depid}')" href="javascript:;">
                          <i class="layui-icon">&#xe640;</i>
                      </a>
                  </td>
              </tr>
          </c:forEach>
          </tbody>
      </table>
      <div class="page">
          <div>
              <a class="prev" href="">首页</a>
              <a class="prev" href="">上一页</a>
              <a class="next" href="">下一页</a>
              <a class="next" href="">尾页</a>
          </div>
      </div>
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



      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              $(obj).parents("tr").remove();
              layer.msg('已删除!',{icon:1,time:1000});
          });
      }



      function delAll (argument) {

        var data = tableCheck.getData();
  
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
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