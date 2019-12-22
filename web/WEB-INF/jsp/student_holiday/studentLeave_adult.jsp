<%@ page import="com.ht.vo.employee.DeptType" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title></title>
    <jsp:include page="../top.jsp"/>
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form" lay-filter="add">
            <input type="hidden" name="taskId" value="${taskId}">
            <input type="hidden" name="hid" value="${holiday.holidayId}">
        <div class="layui-form-item">
            <label for="empName" class="layui-form-label">
                <span class="x-red">*</span>请假人
            </label>
            <div class="layui-input-inline">
                <input type="text" id="empName" value="${holiday.stuName}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="day" class="layui-form-label">
                <span class="x-red">*</span>请假天数
            </label>
            <div class="layui-input-inline">
                <input type="text" id="day" value="${holiday.holidayDay}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="title" class="layui-form-label">
                <span class="x-red">*</span>是否批准
            </label>
            <div class="layui-input-inline">
                <select id="title" name="flow">
                    <option value="同意">同意</option>
                    <option value="不同意">不同意</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
          <div class="layui-form-item">
              <label for="remark" class="layui-form-label">
                  <span class="x-red"></span>备注
              </label>
              <div class="layui-input-inline">
                  <textarea name="remark"  id="remark" placeholder="请输入内容" class="layui-textarea"></textarea>
              </div>
          </div>
          <div class="layui-form-item" style="margin-left: 100px;">
              <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
              <button type="reset" class="layui-btn layui-btn-primary">重置</button>
          </div>
        </div>
      </form>
    </div>
    <script>
        layui.use(['form','layer','laydate'], function(){
          var form = layui.form;
          var layer = layui.layer;

          //表单校验
          //监听提交
          form.on('submit(formDemo)',function(data){
            //发异步，把数据提交给后台
              $.ajax({
                  url:'${pageContext.request.contextPath}/stuHoliday/complete',
                  type:'post',
                  data:data.field,
                  dataType:'json',
                  success:function (data){
                      if ("success"==data){
                          layer.alert("审批成功", {icon: 6},function(){
                              // 获得frame索引
                              var index = parent.layer.getFrameIndex(window.name);
                              //关闭当前frame
                              parent.layer.close(index);
                              layer.closeAll();
                              setTimeout(function () {
                                  window.parent.location.reload(); //修改成功后刷新父界面
                              })
                          });
                      }
                  }
              });
              return false;
          });
        });

        //jquery layui 开始请求打开layui加载动画 所有请求结束后关闭layui加载动画
        $.ajaxSetup({
            beforeSend: function () {
                layui.use('layer', function () {
                    layui.layer.load();
                    //console.log(Lodingindex) opacity
                    $(".layui-layer-shade").css('background', '#000000')
                    $(".layui-layer-shade").css('opacity', '0.2')
                    $(".layui-layer-shade").click(function (event) {
                        event.stopPropagation();
                    })
                });
            },
            complete: function () {
                //layui.use('layer', function () {
                //    layui.layer.closeAll();
                //    setTimeout(function () {
                //        layui.layer.closeAll();
                //    }, 2000);
                //});
            },
            error: function () {
                //layui.use('layer', function () {
                //    layui.layer.closeAll();
                //});
            }
        });


        $(document).ajaxStop(function () {

        })

    </script>


    <script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>
  </body>

</html>