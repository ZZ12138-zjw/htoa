
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
        <form class="layui-form">
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>部门名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" required="" lay-verify="required"
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
                      <option value="0">后勤部</option>
                      <option value="1">人事部</option>
                      <option value="2">财务部</option>
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
                    <option value="0" selected>宏图软件</option>
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
                    <option value="0">张嘉文</option>
                    <option value="1">适合话</option>
                    <option value="2">陈茂荣</option>
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
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
        
          //自定义验证规则
          form.verify({
            nikename: function(value){
              if(value.length < 5){
                return '昵称至少得5个字符啊';
              }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
          });

          //监听提交
          form.on('submit(add)', function(data){
            console.log(data);
            //发异步，把数据提交给php
            layer.alert("增加成功", {icon: 6},function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
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