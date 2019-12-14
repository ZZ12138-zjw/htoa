<%@ page import="com.ht.vo.employee.PostName" %>
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
          <input value="${empId}" name="empId" type="hidden">
          <div class="layui-form-item">
              <label for="collegeName" class="layui-form-label">
                  <span class="x-red">*</span>学校名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="collegeName" name="collegeName" placeholder="学校名称" required=""  lay-verify="collegeName"
                  autocomplete="off" class="layui-input">
              </div>
              <%--<div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>将会成为您唯一的登入名
              </div>--%>
          </div>
        <div class="layui-form-item">
            <label  for="degree" class="layui-form-label">
                <span class="x-red">*</span>学历
            </label>
            <div class="layui-input-inline">
                <input  placeholder="学历" id="degree"  lay-verify="required" class="layui-input" name="degree">
            </div>
        </div>
          <div class="layui-form-item">
              <label for="startDate" class="layui-form-label">
                  <span class="x-red">*</span>入校时间
              </label>
              <div class="layui-input-inline">
                 <input type="text" placeholder="入校时间" name="s" id="startDate" lay-verify="startDate" class="layui-input">
              </div>
          </div>
        <div class="layui-form-item">
            <label for="endDate" class="layui-form-label">
                <span class="x-red">*</span>毕业时间
            </label>
            <div class="layui-input-inline">
                <input type="text" placeholder="毕业时间" name="e" id="endDate" lay-verify="endDate" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label  for="remark" class="layui-form-label">
                <span class="x-red"></span>说明
            </label>
            <div class="layui-input-inline" >
                <textarea id="remark" name="remark" class="layui-textarea"></textarea>
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
          var form = layui.form,
              layer = layui.layer,
              laydate=layui.laydate;

            //执行laydate
            laydate.render({
                elem:"#startDate"//指定元素
            });
            laydate.render({
                elem:"#endDate" //指定元素
            });

            //表单校验
            form.verify({
                //value：表单的值，item表单的dom对象
                collegeName:function (value,item) {
                    if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                        return '学校名称不能有特殊字符';
                    }
                    if (/(^\_)|(\__)|(\_+$)/.test(value)){
                        return '学校名称首尾不能出现下划线\'_\'';
                    }
                    if (/^\d+\d+\d$/.test(value)){
                        return '学校名称不能为全数字';
                    }
                },
                degree:function (value,item) {
                    if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                        return '学校名称不能有特殊字符';
                    }
                    if (/(^\_)|(\__)|(\_+$)/.test(value)){
                        return '学校名称首尾不能出现下划线\'_\'';
                    }
                    if (/^\d+\d+\d$/.test(value)){
                        return '学校名称不能为全数字';
                    }
                },
                /*cardno:function (value,item) {
                    if (/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test(value)){
                        return "身份证输入不合法";
                    }
                }*/
            });
          //监听提交
          form.on('submit(formDemo)',function(data){
              alert(JSON.stringify(data.field));
            //发异步，把数据提交给后台
              $.ajax({
                  url:'${pageContext.request.contextPath}/emp/eduationAdd',
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
                          });
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