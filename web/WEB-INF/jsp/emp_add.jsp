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
          <div class="layui-form-item">
              <label for="empName" class="layui-form-label">
                  <span class="x-red">*</span>员工姓名
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="empName" name="empName" required=""  lay-verify="empName"
                  autocomplete="off" class="layui-input">
              </div>
              <%--<div class="layui-form-mid layui-word-aux">
                  <span class="x-red">*</span>将会成为您唯一的登入名
              </div>--%>
          </div>
          <div class="layui-form-item">
              <label for="selectDep" class="layui-form-label">
                  <span class="x-red">*</span>部门名称
              </label>
              <div class="layui-input-inline">
                  <select id="selectDep"  name="deptId" lay-verify="required">
                      <option value="" >无选择</option>
                  <c:forEach items="${depList}" var="d">
                      <option value="${d.depid}">${d.depName}</option>
                  </c:forEach>
                  </select>
              </div>
          </div>
        <div class="layui-form-item">
            <label for="postName" class="layui-form-label">
                <span class="x-red">*</span>职务名称
            </label>
            <div class="layui-input-inline">
                <select name="postName" id="postName">
                    <option value="" class="layui-input">未选择</option>
                    <% for(int i=0;i<PostName.postNames().size();i++){%>
                    <option value="<%=PostName.postNames().get(i)%>" class="layui-input"><%=PostName.postNames().get(i)%></option>
                    <%}%>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="address" class="layui-form-label">
                <span class="x-red">*</span>家庭住址
            </label>
            <div class="layui-input-inline">
                <input id="address" name="address" class="layui-input" type="text" lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label  class="layui-form-label">
                <span class="x-red">*</span>性别
            </label>
            <div class="layui-input-inline">
                <input type="radio"  name="sex" value="男" checked>男
                <input type="radio"  name="sex" value="女" >女
            </div>
        </div>
        <div class="layui-form-item">
            <label for="cardno" class="layui-form-label">
                <span class="x-red">*</span>身份证号
            </label>
            <div class="layui-input-inline">
                <input id="cardno" name="cardno" class="layui-input"  placeholder="请输入身份证号" type="text">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="birthday" class="layui-form-label">
                <span class="x-red">*</span>出生日期
            </label>
            <div class="layui-input-inline">
                <input placeholder="出生日期" id="birthday" lay-verify="required" class="layui-input"  name="birt">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="nation" class="layui-form-label">
                <span class="x-red">*</span>籍贯
            </label>
            <div class="layui-input-inline">
                <input placeholder="请输入你的籍贯" id="nation" lay-verify="required" class="layui-input" name="nation" type="text">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="phone" class="layui-form-label">
                <span class="x-red">*</span>手机号码
            </label>
            <div class="layui-input-inline">
                <input placeholder="请输入你的手机号码" id="phone"  lay-verify="phone" class="layui-input" name="phone" type="number">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="qqcode" class="layui-form-label">
                <span class="x-red"></span>QQ号码
            </label>
            <div class="layui-input-inline">
                <input placeholder="请输入你的qq号码" id="qqcode" class="layui-input" name="qqCode" type="number">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="weixin" class="layui-form-label">
                <span class="x-red"></span>微信号码
            </label>
            <div class="layui-input-inline">
                <input placeholder="请输入你的微信号码" class="layui-input" id="weixin" name="weiXin" type="number">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="email" class="layui-form-label">
                <span class="x-red"></span>邮箱地址
            </label>
            <div class="layui-input-inline">
                <input placeholder="请输入你的邮箱地址" class="layui-input" id="email" name="email" type="text">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="married" class="layui-form-label">
                <span class="x-red">*</span>婚姻状况
            </label>
            <div class="layui-input-inline">
                <select name="married" id="married">
                    <option value="" >无选择</option>
                    <option value="已婚" >已婚</option>
                    <option value="单身">单身</option>
                    <option value="丧偶">丧偶</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="university" class="layui-form-label">
                <span class="x-red"></span>毕业学校
            </label>
            <div class="layui-input-inline">
                <input type="text" placeholder="请输入你的毕业学校" class="layui-input" id="university" name="university">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="major" class="layui-form-label">
                <span class="x-red"></span>专业
            </label>
            <div class="layui-input-inline">
                <input type="text" placeholder="请输入你的专业"   class="layui-input" id="major" name="major">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="education" class="layui-form-label">
                <span class="x-red">*</span>学历
            </label>
            <div class="layui-input-inline">
                <select name="education" id="education">
                    <option value="">无选择</option>
                    <option value="高中以下">高中以下</option>
                    <option value="专科">专科</option>
                    <option value="本科">本科</option>
                    <option value="本科以上">本科以上</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="bank" class="layui-form-label">
                <span class="x-red"></span>开户银行
            </label>
            <div class="layui-input-inline">
                <input type="text" placeholder="请输入你的开户账号" class="layui-input" id="bank" name="bank">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="alipay" class="layui-form-label">
                <span class="x-red"></span>支付宝账号
            </label>
            <div class="layui-input-inline">
                <input type="text" placeholder="请输入你的支付宝账号" class="layui-input"  id="alipay" name="alipay">
            </div>
        </div>
        <div class="layui-form-item">
            <label  for="hireday" class="layui-form-label">
                <span class="x-red">*</span>入职时间
            </label>
            <div class="layui-input-inline">
                <input  placeholder="入职时间" id="hireDay"  lay-verify="required" class="layui-input" name="hireday">
            </div>
        </div>
        <div class="layui-form-item">
            <label  for="password" class="layui-form-label">
                <span class="x-red"></span>登录密码
            </label>
            <div class="layui-input-inline">
                <input  placeholder="默认密码是123456" class="layui-input"  id="password" name="password" type="text">
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
                elem:"#birthday"//指定元素
            });
            laydate.render({
                elem:"#hireDay" //指定元素
            });

            //表单校验
            form.verify({
                //value：表单的值，item表单的dom对象
                empName:function (value,item) {
                    if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
                        return '员工名称不能有特殊字符';
                    }
                    if (/(^\_)|(\__)|(\_+$)/.test(value)){
                        return '员工名称首尾不能出现下划线\'_\'';
                    }
                    if (/^\d+\d+\d$/.test(value)){
                        return '员工名称不能为全数字';
                    }
                    if (value.length<2){
                        return '员工名称至少得2个字符';
                    }
                },
                phone:function (value,item) {
                    if (value.length>11 || value.length<11){
                        return '手机号码只能是11位数';
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
                  url:'${pageContext.request.contextPath}/emp/empAdd',
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