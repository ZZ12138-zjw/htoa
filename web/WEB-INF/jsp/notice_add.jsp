
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

  <head>
    <meta charset="UTF-8">
    <title></title>
    <jsp:include page="top.jsp"/>
      <script src="${pageContext.request.contextPath}/lib/ckeditor/ckeditor.js"></script>
      <script type="text/javascript">
          window.onload = function()
          {
              CKEDITOR.replace( 'content');
          };
      </script>
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form" lay-filter="add">
              <div class="layui-form-item">
                  <label for="courseName" class="layui-form-label">
                      <span class="x-red">*</span>标题
                  </label>
                  <div class="layui-input-inline">
                      <input type="text" id="courseName" name="courseName" required="" lay-verify="courseName"
                      autocomplete="off" class="layui-input">
                  </div>
                  <label for="isobligatory" class="layui-form-label">
                      <span class="x-red">*</span>类别：
                  </label>
                  <div class="layui-input-inline">
                      <select id="isobligatory"  name="isobligatory" lay-verify="required">
                          <option value="1">全体员工</option>
                          <option value="2">全体学生</option>
                          <option value="3">全体师生</option>
                      </select>
                  </div>
              </div>
          <div class="layui-form-block">
              <label for="content" class="layui-form-label">
                  <span class="x-red">*</span>内容
              </label>
              <div class="layui-input-inline">
                  <textarea name="content" id="content" class="layui-textarea"></textarea>
              </div>
          </div>
          <div class="layui-form-item" style="margin-left: 100px;">
              <button class="layui-btn" lay-submit lay-filter="formDemo">发布</button>
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
                courseName:function (value,item) {
                    if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                        return '课程名称不能有特殊字符';
                    }
                    if (/(^\_)|(\__)|(\_+$)/.test(value)){
                        return '课程名称首尾不能出现下划线\'_\'';
                    }
                    if (/^\d+\d+\d$/.test(value)){
                        return '课程名称不能为全数字';
                    }
                    if (value.length<3){
                        return '课程名称至少得3个字符';
                    }
                }
            });
          //监听提交
          form.on('submit(formDemo)',function(data){
            //发异步，把数据提交给后台
              $.ajax({
                  url:'${pageContext.request.contextPath}/notice/notice_add',
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