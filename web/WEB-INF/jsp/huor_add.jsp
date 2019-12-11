
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
                  <label for="hourIddsc" class="layui-form-label">
                      <span class="x-red">*</span>排序编号
                  </label>
                  <div class="layui-input-inline">
                      <input type="text" id="hourIddsc" name="hourIddsc" required="" placeholder="请输入排序编号，例 1" lay-verify="hourIddsc"
                      autocomplete="off" class="layui-input">
                  </div>
              </div>
              <div class="layui-form-item">
                  <label for="hourName" class="layui-form-label">
                      <span class="x-red">*</span>宿舍房号
                  </label>
                  <div class="layui-input-inline">
                      <input type="text" id="hourName" name="hourName" required="" placeholder="请输入宿舍房号"
                      autocomplete="off" class="layui-input">
                  </div>
              </div>
            <div class="layui-form-item">
                <label for="floorId" class="layui-form-label">
                    <span class="x-red">*</span>宿舍楼栋
                </label>
                <div class="layui-input-inline">
                    <select id="floorId"  name="floorId" lay-verify="required">
                        <c:forEach items="${floorList}" var="f">
                            <option value="${f.floorId}">${f.floorName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label for="numberBeds" class="layui-form-label">
                    <span class="x-red">*</span>床位数
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="numberBeds" name="numberBeds" required="" placeholder="请输入床位数，例 1"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="count" class="layui-form-label">
                    <span class="x-red">*</span>宿舍人数
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="count" name="count" required="" placeholder="请输入宿人数"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="addr" class="layui-form-label">
                    <span class="x-red">*</span>宿舍地址
                </label>
                <div class="layui-input-inline">
                    <textarea name="addr"  id="addr" placeholder="请输入宿舍地址" class="layui-textarea"></textarea>
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
                  url:'${pageContext.request.contextPath}/huor/huorAdd',
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