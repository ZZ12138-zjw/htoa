
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

  <head>
    <meta charset="UTF-8">
    <title></title>
    <jsp:include page="top.jsp"/>
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form" lay-filter="add">
            <%--一些隐藏的值，但一定得有--%>
            <input type="hidden" value="${attVo.attId}" name="attId">
            <input type="hidden" value="${attVo.empName}" name="empName">
            <input type="hidden" value="${attVo.notTime}" name="notTime">
            <input type="hidden" value="${attVo.explanation}" name="explanation">
            <input type="hidden" value="${attVo.auditor}" name="auditor">
          <div class="layui-form-item">
              <label for="auditorEx" class="layui-form-label">
                  <span class="x-red"></span>审核说明
              </label>
              <div class="layui-input-inline">
                  <textarea name="auditorEx"  id="auditorEx" placeholder="请输入内容" class="layui-textarea"></textarea>
              </div>
          </div>
        <div class="layui-form-item">
            <label  class="layui-form-label">
                <span class="x-red"></span>审核结果
            </label>
            <div class="layui-input-inline">
                <select name="status" >
                    <option value="2" >同意</option>
                    <option value="3">不同意</option>
                </select>
            </div>
        </div>
          <div class="layui-form-item" style="margin-left: 100px;">
              <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
              <button type="reset" class="layui-btn layui-btn-primary">重置</button>
          </div>
      </form>
    </div>
    <script>
        layui.use(['form','layer','laydate'], function(){
          var form = layui.form;
          var layer = layui.layer,
              laydate=layui.laydate;

            //常规用法
            laydate.render({
                elem: '#notTime'
            });
            //表单监听
          //监听提交
          form.on('submit(formDemo)',function(data){
            //发异步，把数据提交给后台
              $.ajax({
                  url:'${pageContext.request.contextPath}/attendance/attendanceUpdate',
                  type:'post',
                  data:data.field,
                  dataType:'json',
                  success:function (data){
                      layer.alert("操作成功", {icon: 6},function(){
                          // 获得frame索引
                          var index = parent.layer.getFrameIndex(window.name);
                          //关闭当前frame
                          parent.layer.close(index);
                          setTimeout(function () {
                              window.parent.location.reload(); //修改成功后刷新父界面
                          })
                      });
                  }
              });
              return false;
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