
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
          <div class="layui-form-item">
              <label for="depName" class="layui-form-label">
                  <span class="x-red">*</span>部门名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="depName" name="depName" required="" lay-verify="depName"
                  autocomplete="off" class="layui-input">
              </div>
              <%--<div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>将会成为您唯一的登入名
              </div>--%>
          </div>
          <div class="layui-form-item">
              <label for="deptType" class="layui-form-label">
                  <span class="x-red">*</span>部门类别
              </label>
              <div class="layui-input-inline">
                  <select id="deptType"  name="deptType" lay-verify="required">
                      <option value="">不选择</option>
                      <option value="后勤部">后勤部</option>
                      <option value="人事部">人事部</option>
                      <option value="财务部">财务部</option>
                  </select>
              </div>
          </div>
        <div class="layui-form-item">
            <label for="parentId" class="layui-form-label">
                <span class="x-red">*</span>上级部门名称
            </label>
            <div class="layui-input-inline">
                <select id="parentId"  name="parentId" lay-verify="required">
                    <option value=""></option>
                    <option value="宏图软件" selected>宏图软件</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <%--从后台查询员工表,然后遍历出来--%>
            <label for="chairman" class="layui-form-label">
                <span class="x-red">*</span>部门负责人
            </label>
            <div class="layui-input-inline">
                <select id="chairman"  name="chairman" lay-verify="required">
                    <c:forEach items="${empList}" var="e">
                        <option value="${e.empName}">${e.empName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
          <div class="layui-form-item">
              <label for="remark" class="layui-form-label">
                  <span class="x-red">*</span>备注
              </label>
              <div class="layui-input-inline">
                  <textarea name="remark"  id="remark" placeholder="请输入内容" class="layui-textarea"></textarea>
              </div>
          </div>
          <div class="layui-form-item" style="margin-left: 100px;">
              <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
              <button type="reset" class="layui-btn layui-btn-primary">重置</button>
          </div>
      </form>
    </div>
    <script>
        layui.use(['form','layer'], function(){
          var form = layui.form;
          var layer = layui.layer;

          //表单校验

            form.verify({
                //value：表单的值，item表单的dom对象
                depName:function (value,item) {
                    if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                        return '部门名称不能有特殊字符';
                    }
                    if (/(^\_)|(\__)|(\_+$)/.test(value)){
                        return '部门名称首尾不能出现下划线\'_\'';
                    }
                    if (/^\d+\d+\d$/.test(value)){
                        return '部门名称不能为全数字';
                    }
                    if (value.length<5){
                        return '部门名称至少得5个字符';
                    }
                }
            });
          //监听提交
          form.on('submit(formDemo)',function(data){
            //发异步，把数据提交给后台
              $.ajax({
                  url:'${pageContext.request.contextPath}/dept/add',
                  type:'post',
                  data:data.field,
                  dataType:'json',
                  success:function (data){
                      layer.alert("增加成功", {icon: 6},function(){
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