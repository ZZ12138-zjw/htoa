<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 小燕
  Date: 2019/12/5
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增学生</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
</head>
<body>
<div class="x-body">
    <form class="layui-form" lay-filter="formTest">
        <input type="hidden" name="stuId" value="${requestScope.student.stuId}"/>
        <input type="hidden" name="middleschool" value="${requestScope.student.middleschool}"/>
        <input type="hidden" name="age" value="${requestScope.student.age}"/>
        <input type="hidden" name="birthday" value="${requestScope.student.birthday}"/>
        <input type="hidden" name="entertime" value="${requestScope.student.entertime}"/>
        <input type="hidden" name="introduretech" value="${requestScope.student.introduretech}"/>
        <input type="hidden" name="nation" value="${requestScope.student.nation}"/>
        <input type="hidden" name="natives" value="${requestScope.student.natives}"/>
        <input type="hidden" name="residence" value="${requestScope.student.residence}"/>
        <input type="hidden" name="professional" value="${requestScope.student.professional}"/>
        <input type="hidden" name="prolevel" value="${requestScope.student.prolevel}"/>
        <input type="hidden" name="studytype" value="${requestScope.student.studytype}"/>
        <input type="hidden" name="intrphone" value="${requestScope.student.intrphone}"/>
        <input type="hidden" name="audition" value="${requestScope.student.audition}"/>
        <input type="hidden" name="auditionoption" value="${requestScope.student.auditionoption}"/>
        <input type="hidden" name="isvocational" value="${requestScope.student.isvocational}"/>
        <input type="hidden" name="vocationalsch" value="${requestScope.student.vocationalsch}"/>
        <input type="hidden" name="vocationalflag" value="${requestScope.student.vocationalflag}"/>
        <input type="hidden" name="score" value="${requestScope.student.score}"/>
        <input type="hidden" name="dibao" value="${requestScope.student.dibao}"/>
        <input type="hidden" name="sourceType" value="${requestScope.student.sourceType}"/>
        <input type="hidden" name="guarantee" value="${requestScope.student.guarantee}"/>
        <input type="hidden" name="soldier" value="${requestScope.student.soldier}"/>
        <input type="hidden" name="registration" value="${requestScope.student.registration}"/>
        <input type="hidden" name="zhuxiao" value="${requestScope.student.zhuxiao}"/>
        <input type="hidden" name="remart" value="${requestScope.student.remart}"/>
        <input type="hidden" name="tuixue" value="${requestScope.student.tuixue}"/>
        <input type="hidden" name="xiuxue" value="${requestScope.student.xiuxue}"/>
        <div class="layui-form-item">
            <label for="stuName" class="layui-form-label">
                <span class="x-red">*</span>姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="stuName" name="stuName" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>输入学生姓名
            </div>
        </div>
        <div class="layui-form-item">
            <label for="stuno" class="layui-form-label">
                <span class="x-red">*</span>学号
            </label>
            <div class="layui-input-inline">
                <input type="text" id="stuno" name="stuno" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>输入学生学号
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>性别</label>
            <div class="layui-input-block">
                <input type="radio"  name="sex" required="" lay-verify="required"
                       value="男" autocomplete="off" class="layui-input" title="男">
                <input type="radio"  name="sex" required="" lay-verify="required"
                       value="女" autocomplete="off" class="layui-input" title="女">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="cardid" class="layui-form-label">
                <span class="x-red">*</span>身份证
            </label>
            <div class="layui-input-inline">
                <input type="text" id="cardid" name="cardid" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>输入学生身份证号
            </div>
        </div>
        <div class="layui-form-item">
            <label for="phone" class="layui-form-label">
                <span class="x-red">*</span>联系电话
            </label>
            <div class="layui-input-inline">
                <input type="text" id="phone" name="phone" required="" lay-verify="phone"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>输入学生联系电话
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>班级</label>
            </label>
            <div class="layui-input-block">
                <select name="classid" lay-verify="">
                    <option value="" selected>--请选择一个班级--</option>
                    <c:forEach var="studentClass" items="${requestScope.studentClass}">
                        <option value="${studentClass.classId}">${studentClass.className}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>宿舍房号</label>
            <div class="layui-input-block">
                <select name="hourid" lay-verify="">
                    <option value="" selected>--请选择一个宿舍--</option>
                    <c:forEach var="huor" items="${requestScope.huor}">
                        <option value="${huor.hourId}">${huor.hourName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>学生状态</label>
            <div class="layui-input-block">
                <select name="hourid" lay-verify="">
                    <option value="" selected>--请选择学生状态--</option>
                    <option value="1" >在读</option>
                    <option value="2" >休学</option>
                    <option value="3" >退学</option>
                    <option value="4" >毕业</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>是否领用电脑</label>
            <div class="layui-input-block">
                <select name="collar" lay-verify="">
                    <option value="" selected>--请选择--</option>
                    <option value="是" >是</option>
                    <option value="否" >否</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>是否享受助学金</label>
            <div class="layui-input-block">
                <select name="grants" lay-verify="">
                    <option value="" selected>--请选择--</option>
                    <option value="是" >是</option>
                    <option value="否" >否</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>是否送电脑</label>
            <div class="layui-input-block">
                <select name="computer" lay-verify="">
                    <option value="" selected>--请选择--</option>
                    <option value="是" >是</option>
                    <option value="否" >否</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="parents" class="layui-form-label">
                <span class="x-red">*</span>家长姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="parents" name="parents" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>输入学生家长姓名
            </div>
        </div>
        <div class="layui-form-item">
            <label for="parentsphone" class="layui-form-label">
                <span class="x-red">*</span>家长联系电话
            </label>
            <div class="layui-input-inline">
                <input type="text" id="parentsphone" name="parentsphone" required="" lay-verify="phone"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>输入学生家长联系电话
            </div>
        </div>
        <div class="layui-form-item">
            <label for="qkMoney" class="layui-form-label">
                <span class="x-red">*</span>欠款金额
            </label>
            <div class="layui-input-inline">
                <input type="text" id="qkMoney" name="qkMoney" required="" lay-verify="required"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>输入学生欠款金额
            </div>
        </div>
        <div class="layui-form-item">
            <button  class="layui-btn" lay-filter="update" lay-submit="">
                确认修改
            </button>
        </div>
    </form>
</div>
<script>
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;

            form.val("formTest",{//formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                "stuName":"${requestScope.student.stuName}"
                ,"stuno":${requestScope.student.stuno}
                ,"sex":"${requestScope.student.sex}"
                ,"cardid":"${requestScope.student.cardid}"
                ,"phone":"${requestScope.student.phone}"
                ,"classid":${requestScope.student.classid}
                ,"hourid":${requestScope.student.hourid}
                ,"state":${requestScope.student.state}
                ,"collar":"${requestScope.student.collar}"
                ,"grants":"${requestScope.student.grants}"
                ,"computer":"${requestScope.student.computer}"
                ,"parents":"${requestScope.student.parents}"
                ,"parentsphone":"${requestScope.student.parentsphone}"
                ,"qkMoney":${requestScope.student.qkMoney}
            });

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
            form.on('submit(update)', function(data){
                $.ajax({
                    url:'${pageContext.request.contextPath}/student/update',
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
