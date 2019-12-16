
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
        <form class="layui-form" lay-filter="update">
            <input type="hidden" id="noticeId" name="noticeId" value="${noticeList.noticeId}">
            <input type="hidden" id="noticeType" name="noticeType" value="${noticeList.noticeType}">
            <input type="hidden" id="empid" name="empid" value="${noticeList.empid}">
            <input type="hidden" id="noticeTime" name="noticeTime" value="${noticeList.noticeTime}">
            <input type="hidden" id="trueConut" name="trueConut" value="${noticeList.trueConut}">
            <input type="hidden" id="falseCount" name="falseCount" value="${noticeList.falseCount}">
              <div class="layui-form-item">
                  <label for="title" class="layui-form-label">
                      <span class="x-red">*</span>标题
                  </label>
                  <div class="layui-input-inline">
                      <input type="text" id="title" name="title" required="" value="${noticeList.title}" lay-verify="courseName"
                      autocomplete="off" class="layui-input">
                  </div>
              </div>
          <div class="layui-form-block">
              <label for="noticeContent" class="layui-form-label">
                  <span class="x-red">*</span>内容
              </label>
              <div class="layui-input-inline">
                  <textarea id="noticeContent" style="display: none;">${noticeList.content}</textarea>
              </div>
          </div>
          <div class="layui-form-item" style="margin-left: 100px;">
              <button class="layui-btn" lay-submit lay-filter="formDemo">发布</button>
              <button type="reset" class="layui-btn layui-btn-primary">重置</button>
          </div>
      </form>
    </div>
    <script>
        layui.use(['form','layer','layedit'], function(){
          var form = layui.form;
          var layer = layui.layer;
            var layedit = layui.layedit;
            var content = layedit.build('noticeContent'); //建立编辑器
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
                  url:'${pageContext.request.contextPath}/notice/update',
                  type:'post',
                  data:{noticeId:$('#noticeId').val(),empid:$('#empid').val(),noticeTime:$('#noticeTime').val(),trueConut:$('#trueConut').val(),falseCount:$('#falseCount').val(),title:$('#title').val(),content:layedit.getContent(content),noticeType:$('#noticeType').val()},
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