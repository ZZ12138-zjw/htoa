
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
        <form class="layui-form" lay-filter="update">
            <input type="hidden" name="weekArrangeid" value="${weekarrangeList.weekArrangeid}">
              <div class="layui-form-item">
                  <label for="orderId" class="layui-form-label">
                      <span class="x-red">*</span>排序编号
                  </label>
                  <div class="layui-input-inline">
                      <input type="text" id="orderId" name="orderId" required="" value="${weekarrangeList.orderId}"
                      autocomplete="off" class="layui-input">
                  </div>
              </div>
              <div class="layui-form-item">
                  <label for="week" class="layui-form-label">
                      <span class="x-red">*</span>星期
                  </label>
                  <div class="layui-input-inline">
                      <select id="week"  name="week" lay-verify="required">
                          <option value="星期天" <c:if test="${weekarrangeList.week}">selected</c:if>>星期天</option>
                          <option value="星期一" <c:if test="${weekarrangeList.week}">selected</c:if>>星期一</option>
                          <option value="星期二" <c:if test="${weekarrangeList.week}">selected</c:if>>星期二</option>
                          <option value="星期三" <c:if test="${weekarrangeList.week}">selected</c:if>>星期三</option>
                          <option value="星期四" <c:if test="${weekarrangeList.week}">selected</c:if>>星期四</option>
                          <option value="星期五" <c:if test="${weekarrangeList.week}">selected</c:if>>星期五</option>
                          <option value="星期六" <c:if test="${weekarrangeList.week}">selected</c:if>>星期六</option>
                      </select>
                  </div>
              </div>
            <div class="layui-form-item">
                <label for="weekArrangeName" class="layui-form-label">
                    <span class="x-red">*</span>排班名称
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="weekArrangeName" name="weekArrangeName" required="" value="${weekarrangeList.weekArrangeName}"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="empId" class="layui-form-label">
                    <span class="x-red">*</span>员工
                </label>
                <div class="layui-input-inline">
                    <select id="empId"  name="empId" lay-verify="required">
                        <c:forEach items="${empList}" var="e">
                            <option value="${e.empId}" ${weekarrangeList.empId==e.empId ? 'selected' : ''}>${e.empName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="ranges" class="layui-form-label">
                    <span class="x-red">*</span>排班要求
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="ranges" name="ranges" required="" value="${weekarrangeList.ranges}"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="duty" class="layui-form-label">
                    <span class="x-red">*</span>总值班
                </label>
                <div class="layui-input-inline">
                    <select id="duty"  name="duty" lay-verify="required">
                        <option value="是" <c:if test="${weekarrangeList.duty}">selected</c:if>>是</option>
                        <option value="否" <c:if test="${weekarrangeList.duty}">selected</c:if>>否</option>
                    </select>
                </div>
            </div>
          <div class="layui-form-item">
              <label for="remark" class="layui-form-label">
                  <span class="x-red">*</span>说明
              </label>
              <div class="layui-input-inline">
                  <textarea name="remark"  id="remark" placeholder="请输入内容" class="layui-textarea">${weekarrangeList.remark}</textarea>
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

            /*form.verify({
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
            });*/
            //监听提交
            form.on('submit(formDemo)',function(data){
                //发异步，把数据提交给后台
                $.ajax({
                    url:'${pageContext.request.contextPath}/weekarrange/update',
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