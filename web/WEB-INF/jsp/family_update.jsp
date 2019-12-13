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
          <input type="hidden" value="${f.familyid}" name="familyid">
          <input type="hidden" value="${f.empId}" name="empId">
          <div class="layui-form-item">
              <label for="contactName" class="layui-form-label">
                  <span class="x-red">*</span>联系人名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="contactName" value="${f.contactName}" name="contactName" required="" lay-verify="contactName"
                  autocomplete="off" class="layui-input">
              </div>
              <%--<div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>将会成为您唯一的登入名
              </div>--%>
          </div>
          <div class="layui-form-item">
              <label for="relationship" class="layui-form-label">
                  <span class="x-red">*</span>与员工的关系
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="relationship" value="${f.relationship}" name="relationship" required="" lay-verify="relationship"
                         autocomplete="off" class="layui-input">
              </div>
          </div>
        <div class="layui-form-item">
            <label for="phone" class="layui-form-label">
                <span class="x-red">*</span>联系电话
            </label>
            <div class="layui-input-inline">
                <input type="number" id="phone" value="${f.phone}" name="phone" required="" lay-verify="phone"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
          <div class="layui-form-item">
              <label for="remark" class="layui-form-label">
                  <span class="x-red"></span>说明
              </label>
              <div class="layui-input-inline">
                  <textarea name="remark"  id="remark"  placeholder="请输入内容" class="layui-textarea">${f.remark}</textarea>
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

          //表单校验
            form.verify({
                //value：表单的值，item表单的dom对象
                contactName:function (value,item) {
                    if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                        return '联系人名称不能有特殊字符';
                    }
                    if (/(^\_)|(\__)|(\_+$)/.test(value)){
                        return '联系人名称首尾不能出现下划线\'_\'';
                    }
                    if (/^\d+\d+\d$/.test(value)){
                        return '联系人名称不能为全数字';
                    }
                },
                relationship:function (value,item) {
                    if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                        return '与员工的关系不能有特殊字符';
                    }
                    if (/(^\_)|(\__)|(\_+$)/.test(value)){
                        return '与员工的关系名称首尾不能出现下划线\'_\'';
                    }
                    if (/^\d+\d+\d$/.test(value)){
                        return '与员工的关系名称不能为全数字';
                    }
                }
            });
          //监听提交
          form.on('submit(formDemo)',function(data){
            //发异步，把数据提交给后台
              $.ajax({
                  url:'${pageContext.request.contextPath}/emp/familyUpdate',
                  type:'post',
                  data:data.field,
                  dataType:'json',
                  success:function (data){
                      layer.alert("修改成功", {icon: 6},function(){
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