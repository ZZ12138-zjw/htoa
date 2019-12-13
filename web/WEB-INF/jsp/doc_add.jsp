<%@ page import="com.ht.vo.employee.DeptType" %>
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
          <input type="hidden" value="${empId}" name="empId">
          <div class="layui-form-item">
              <label for="docName" class="layui-form-label">
                  <span class="x-red">*</span>证件名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="docName" name="dName" required="" lay-verify="docName"
                  autocomplete="off" class="layui-input">
              </div>
          </div>
            <%--这里添加的隐藏的输入框，用来传递images的参数--%>
          <input class="image" name="dPath" type="hidden">
          <div class="layui-form-item">
              <label  class="layui-form-label">
                  <span class="x-red">*</span>上传文件
              </label>
              <div class="layui-input-inline">
                  <button type="button" class="layui-btn" id="docImage">
                      <i class="layui-icon">&#xe67c;</i>上传图片
                  </button>
              </div>
          </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>图片展示
                </label>
                <div class="layui-input-inline">
                    <img class="layui-upload-img" width="100" height="100" id="showImage">
                    <p id="showImageText"></p>
                </div>
            </div>
          <div class="layui-form-item">
              <label for="remark" class="layui-form-label">
                  <span class="x-red"></span>说明
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
        layui.use(['form','layer','laydate','upload'], function(){
          var form = layui.form;
          var layer = layui.layer,
              laydate=layui.laydate,
              upload=layui.upload;

            //执行laydate
            laydate.render({
                elem:"#startDate"//指定元素
            });
            laydate.render({
                elem:"#endDate" //指定元素
            });

            //执行文件上传
            var uploadInst= upload.render({
                elem:'#docImage',  //绑定元素
                url:'${pageContext.request.contextPath}/emp/doc_upload', //上传接口
                multiple: true,
                accept:'images',
                size:50000,
                before:function (obj) {
                     obj.preview(function (index,file,result) {
                        $("#showImage").attr('src',result);
                     });
                }

                ,done:function (res) {
                    //上传完毕后的回调
                    //如果上传失败
                    if (res.code>0){
                        return layer.msg('上传失败');
                    }
                    //上传成功
                    var showImageText=$('#showImageText');
                    showImageText.html('<span style="color: #4cae4c;">上传成功</span>');
                    var  fileupload=$(".image");
                    //res.data.src 获取后端传过来的图片url，之后给表单的隐藏图片输入框赋值
                    fileupload.attr("value",res.data.src);
                    console.log(fileupload.attr("value"));
                }
                ,error:function () {
                    //请求异常回调
                    //演示失败状态
                    var demoText =$ ('#showImageText');
                    demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                    demoText.find('.demo-reload').on('click',function () {
                        uploadInst.upload();
                    })
                }

            });
          //表单校验

            form.verify({
                //value：表单的值，item表单的dom对象
                docName:function (value,item) {
                    if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                        return '证件名称不能有特殊字符';
                    }
                    if (/(^\_)|(\__)|(\_+$)/.test(value)){
                        return '证件名称首尾不能出现下划线\'_\'';
                    }
                    if (/^\d+\d+\d$/.test(value)){
                        return '证件名称不能为全数字';
                    }
                }
            });
          //监听提交
          form.on('submit(formDemo)',function(data){
            //发异步，把数据提交给后台
              $.ajax({
                  url:'${pageContext.request.contextPath}/emp/docAdd',
                  type:'post',
                  data:data.field,
                  dataType:'text',
                  success:function (data){
                      layer.alert("增加成功", {icon: 6},function(){
                          // 获得frame索引
                          var index = parent.layer.getFrameIndex(window.name);
                          //关闭当前frame
                          parent.layer.close(index);
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