
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
                  <label for="courseName" class="layui-form-label">
                      <span class="x-red">*</span>课程名称
                  </label>
                  <div class="layui-input-inline">
                      <input type="text" id="courseName" name="courseName" required="" lay-verify="depName"
                      autocomplete="off" class="layui-input">
                  </div>
                  <%--<div class="layui-form-mid layui-word-aux">
                      <span class="x-red">*</span>将会成为您唯一的登入名
                  </div>--%>
              </div>
              <div class="layui-form-item">
                  <label for="isobligatory" class="layui-form-label">
                      <span class="x-red">*</span>是否必修
                  </label>
                  <div class="layui-input-inline">
                      <select id="isobligatory"  name="isobligatory" lay-verify="required">
                          <option value="是">是</option>
                          <option value="否">否</option>
                      </select>
                  </div>
              </div>
            <div class="layui-form-item">
                <label for="courseTypeId" class="layui-form-label">
                    <span class="x-red">*</span>课程类别
                </label>
                <div class="layui-input-inline">
                    <select id="courseTypeId"  name="courseTypeId" lay-verify="required">
                        <c:forEach items="${courseTypeList}" var="cou">
                            <option value="${cou.courseTypeId}">${cou.courseTypeName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
          <div class="layui-form-item">
              <label for="remark" class="layui-form-label">
                  <span class="x-red">*</span>说明
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
                }
            });
          //监听提交
          form.on('submit(formDemo)',function(data){
            //发异步，把数据提交给后台
              $.ajax({
                  url:'${pageContext.request.contextPath}/course/courseadd',
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