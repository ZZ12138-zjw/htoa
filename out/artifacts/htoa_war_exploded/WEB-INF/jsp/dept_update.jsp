
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
            <input type="hidden" name="depid" value="${deptVo.depid}">
          <div class="layui-form-item">
              <label for="depName" class="layui-form-label">
                  <span class="x-red">*</span>部门名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="depName" name="depName" required="" value="${deptVo.depName}"  lay-verify="depName"
                  autocomplete="off" class="layui-input">
              </div>
              <%--<div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>将会成为您唯一的登入名
              </div>--%>
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
                        <option value="${e.empName}"  ${deptVo.depName==e.empName ? 'selected' : ''}>${e.empName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
          <div class="layui-form-item">
              <label for="remark" class="layui-form-label">
                  <span class="x-red">*</span>备注
              </label>
              <div class="layui-input-inline">
                  <textarea name="remark"  id="remark"  placeholder="请输入内容" class="layui-textarea">${deptVo.remark}</textarea>
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
            var form = layui.form
                ,layer = layui.layer
                ,$=layui.jquery,
                table= layui.table
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
                    if (value.length<2){
                        return '部门名称至少得2个字符';
                    }
                }
            });
          //监听提交
          form.on('submit(formDemo)',function(data){
            //发异步，把数据提交给后台
              $.ajax({
                  url:'${pageContext.request.contextPath}/dept/update',
                  type:'post',
                  data:data.field,
                  dataType:'json',
                  success:function (data){
                      var lindex = layer.load();
                      if ('success'==data){
                          layer.alert("修改成功", {icon: 6},function(){
                              layer.close(lindex);
                              // 获得frame索引
                              var index = parent.layer.getFrameIndex(window.name);
                              //关闭当前frame
                              parent.layer.close(index);
                              setTimeout(function () {
                                  window.parent.location.reload(); //修改成功后刷新父界面
                              });
                          });
                      }else {
                          layer.alert("修改失败",{icon: 1},function(){
                          });
                      }

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