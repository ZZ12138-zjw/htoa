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
          <input type="hidden" value="${jobVo.jobid}" name="jobid">
          <input type="hidden" value="${jobVo.empid}" name="empid">
          <div class="layui-form-item">
              <label for="companyName" class="layui-form-label">
                  <span class="x-red">*</span>公司名称
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="companyName" value="${jobVo.companyName}" name="companyName" required="" lay-verify="companyName"
                  autocomplete="off" class="layui-input">
              </div>
              <%--<div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>将会成为您唯一的登入名
              </div>--%>
          </div>
          <div class="layui-form-item">
              <label for="degree" class="layui-form-label">
                  <span class="x-red">*</span>岗位
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="degree" name="degree" value="${jobVo.degree}"  required="" lay-verify="degree"
                          class="layui-input">
              </div>
          </div>
        <div class="layui-form-item">
            <label for="startDate" class="layui-form-label">
                <span class="x-red">*</span>入职时间
            </label>
            <div class="layui-input-inline">
                <input type="text" id="startDate" name="beginDate"  value="${jobVo.startDate}"  lay-verify="startDate"
                        class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <%--从后台查询员工表,然后遍历出来--%>
            <label for="endDate" class="layui-form-label">
                <span class="x-red">*</span>离职时间
            </label>
            <div class="layui-input-inline">
                <input type="text" id="endDate" name="endTime" value="${jobVo.endDate}"  lay-verify="endDate"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <%--从后台查询员工表,然后遍历出来--%>
            <label for="reason" class="layui-form-label">
                <span class="x-red"></span>离职原因
            </label>
            <div class="layui-input-inline">
                <input type="text" id="reason" name="reason" required="" value="${jobVo.reason}" lay-verify="reason"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
          <div class="layui-form-item">
              <label for="remark" class="layui-form-label">
                  <span class="x-red"></span>说明
              </label>
              <div class="layui-input-inline">
                  <textarea name="remark"  id="remark" placeholder="请输入内容" class="layui-textarea">${jobVo.remark}</textarea>
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

            //执行laydate
            var startTime = laydate.render({
                elem:"#startDate",//指定元素
                isInitValue: false //是否允许填充初始值,默认为true
            });


           var endTime=laydate.render({
                elem:"#endDate",//指定元素
               isInitValue: false //是否允许填充初始值,默认为true
        });
          //表单校验

            form.verify({
                //value：表单的值，item表单的dom对象
                companyName:function (value,item) {
                    if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                        return '公司名称不能有特殊字符';
                    }
                    if (/(^\_)|(\__)|(\_+$)/.test(value)){
                        return '公司名称首尾不能出现下划线\'_\'';
                    }
                    if (/^\d+\d+\d$/.test(value)){
                        return '公司名称不能为全数字';
                    }
                },
                degree:function (value,item) {
                    if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                        return '岗位名称不能有特殊字符';
                    }
                    if (/(^\_)|(\__)|(\_+$)/.test(value)){
                        return '岗位名称首尾不能出现下划线\'_\'';
                    }
                    if (/^\d+\d+\d$/.test(value)){
                        return '岗位名称不能为全数字';
                    }
                },
                startDate:function (value,item) {
                    if (value>new Date()){
                        return '入职时间不能大于现在';
                    }
                },
                endDate:function (value,item) {
                    if (value<$("#startDate").val()){
                        return '离职日期不能大于入职时间'
                    }
                },
                reason:function (value,item) {
                    if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                        return '离职原因不能有特殊字符';
                    }
                    if (/(^\_)|(\__)|(\_+$)/.test(value)){
                        return '离职原因首尾不能出现下划线\'_\'';
                    }
                    if (/^\d+\d+\d$/.test(value)){
                        return '离职原因不能为全数字';
                    }
                }

            });
          //监听提交
          form.on('submit(formDemo)',function(data){
            //发异步，把数据提交给后台
              $.ajax({
                  url:'${pageContext.request.contextPath}/emp/jobUpdate',
                  type:'post',
                  data:data.field,
                  dataType:'json',
                  success:function (data){
                      layer.alert("修改成功", {icon: 6},function(){
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