<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 小燕
  Date: 2019/12/5
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>新增学生</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/xadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="<%=request.getContextPath()%>/laydate/laydate.js"></script> <!-- 改成你的路径 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/laydate/theme/default/laydate.css">
</head>
<body>
<div class="x-body">
    <form class="layui-form" lay-filter="formTest">
        <input type="hidden" name="stuId" value="${student.stuId}" class="layui-input">
        <input type="hidden" name="studytype" value="${student.studytype}" class="layui-input">
        <div class="layui-form-item">
            <label for="stuName" class="layui-form-label">
                <span class="x-red">*</span>姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="stuName" name="stuName" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${student.stuName}">
            </div>
            <label for="stuno" class="layui-form-label">
                <span class="x-red">*</span>学号
            </label>
            <div class="layui-input-inline">
                <input type="text" id="stuno" name="stuno" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${student.stuno}">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>输入学生学号
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>出生日期</label>
            <div class="layui-input-inline">
                <input type="text" id="birthday" name="birthday" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${student.birthday}">
            </div>
            <label class="layui-form-label"><span class="x-red">*</span>性别</label>
            <div class="layui-input-inline">
                <input type="radio"  name="sex" required="" lay-verify="required"
                       value="男" autocomplete="off" class="layui-input" title="男"
                <c:if test="${student.sex eq '男'}">
                       checked
                </c:if>
                >
                <input type="radio"  name="sex" required="" lay-verify="required"
                       value="女" autocomplete="off" class="layui-input" title="女"
                <c:if test="${student.sex eq '女'}">
                       checked
                </c:if>
                >
            </div>
        </div>
        <div class="layui-form-item">
            <label for="age" class="layui-form-label">
                <span class="x-red">*</span>年龄
            </label>
            <div class="layui-input-inline">
                <input type="text" id="age" name="age" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${student.age}">
            </div>
            <label class="layui-form-label">
                <span class="x-red">*</span>身份证
            </label>
            <div class="layui-input-inline">
                <input type="text" id="cardid" name="cardid" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${student.cardid}">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="phone" class="layui-form-label">
                <span class="x-red">*</span>联系电话
            </label>
            <div class="layui-input-inline">
                <input type="text" id="phone" name="phone" required="" lay-verify="phone"
                       autocomplete="off" class="layui-input" value="${student.phone}">
            </div>
            <label for="addr" class="layui-form-label">
                <span class="x-red">*</span>家庭住址
            </label>
            <div class="layui-input-inline">
                <input type="text" id="addr" name="addr" required="" lay-verify="phone"
                       autocomplete="off" class="layui-input" value="${student.addr}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>班级</label>
            </label>
            <div class="layui-input-inline">
                <select name="classid" lay-verify="">
                    <option value="" selected>--请选择一个班级--</option>
                    <c:forEach var="studentClass" items="${requestScope.studentClass}">
                        <option value="${studentClass.classId}"
                                <c:if test="${student.classid eq studentClass.classId}">
                                    selected
                                </c:if>
                        >${studentClass.className}</option>
                    </c:forEach>
                </select>
            </div>
            <label class="layui-form-label"><span class="x-red">*</span>宿舍房号</label>
            <div class="layui-input-inline">
                <select name="hourid" lay-verify="">
                    <option value="" selected>--请选择一个宿舍--</option>
                    <c:forEach var="huor" items="${requestScope.huor}">
                        <option value="${huor.hourId}"
                        <c:if test="${student.hourid eq huor.hourId}">
                            selected
                        </c:if>
                        >${huor.hourName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>入学时间</label>
            <div class="layui-input-inline">
                <input type="text" id="entertime" name="entertime" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${student.entertime}">
            </div>
            <label class="layui-form-label"><span class="x-red">*</span>介绍老师</label>
            <div class="layui-input-inline">
                <select name="introduretech" lay-verify="">
                    <option value="" selected>--请选择一个老师--</option>
                    <c:forEach var="emp" items="${requestScope.emps}">
                        <option value="${emp.empName}"
                                <c:if test="${student.introduretech eq emp.empName}">
                                    selected
                                </c:if>
                        >${emp.empName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>名族</label>
            <div class="layui-input-inline">
                <select name="nation" lay-verify="">
                    <option value="" selected>--请选择名族--</option>
                    <option value="汉族"
                            <c:if test="${student.nation eq '汉族'}">
                                selected
                            </c:if>
                    >汉族</option>
                    <option value="彝族"
                            <c:if test="${student.nation eq '彝族'}">
                                selected
                            </c:if>
                    >彝族</option>
                    <option value="藏族"
                            <c:if test="${student.nation eq '藏族'}">
                                selected
                            </c:if>
                    >藏族</option>
                    <option value="傣族"
                            <c:if test="${student.nation eq '傣族'}">
                                selected
                            </c:if>
                    >傣族</option>
                </select>
            </div>
            <label for="natives" class="layui-form-label">
                <span class="x-red">*</span>籍贯
            </label>
            <div class="layui-input-inline">
                <input type="text" id="natives" name="natives" required="" lay-verify="phone"
                       autocomplete="off" class="layui-input" value="${student.natives}">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>输入学生籍贯
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>户口性质
            </label>
            <div class="layui-input-inline">
                <select name="residence" lay-verify="">
                    <option value="" selected>--请选择户口性质--</option>
                    <option value="1"
                            <c:if test="${student.nation eq 1}">
                                selected
                            </c:if>
                    >农业</option>
                    <option value="2"
                            <c:if test="${student.nation eq 2}">
                                selected
                            </c:if>
                    >城镇</option>
                </select>
            </div>
            <label class="layui-form-label"><span class="x-red">*</span>学生状态</label>
            <div class="layui-input-inline">
                <select name="state" lay-verify="">
                    <option value="" selected>--请选择学生状态--</option>
                    <option value="1"
                    <c:if test="${student.state eq 1}">
                        selected
                    </c:if>
                    >在读</option>
                    <option value="2"
                            <c:if test="${student.state eq 2}">
                                selected
                            </c:if>
                    >休学</option>
                    <option value="3"
                            <c:if test="${student.state eq 3}">
                                selected
                            </c:if>
                    >退学</option>
                    <option value="4"
                            <c:if test="${student.state eq 4}">
                                selected
                            </c:if>
                    >毕业</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="professional" class="layui-form-label">
                <span class="x-red">*</span>就读专业
            </label>
            <div class="layui-input-inline">
                <input type="text" id="professional" name="professional" required="" lay-verify="phone"
                       autocomplete="off" class="layui-input" value="${student.professional}">
            </div>
            <label class="layui-form-label"><span class="x-red">*</span>专业类别</label>
            <div class="layui-input-inline">
                <select name="prolevel" lay-verify="">
                    <option value="" selected>--请选择学生状态--</option>
                    <option value="1"
                            <c:if test="${student.state eq 1}">
                                selected
                            </c:if>
                    >中技</option>
                    <option value="2"
                            <c:if test="${student.state eq 2}">
                                selected
                            </c:if>
                    >高技</option>
                    <option value="3"
                            <c:if test="${student.state eq 3}">
                                selected
                            </c:if>
                    >3+2</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="middleschool" class="layui-form-label">
                <span class="x-red">*</span>毕业学校
            </label>
            <div class="layui-input-inline">
                <input type="text" id="middleschool" name="middleschool" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${student.middleschool}">
            </div>
            <label class="layui-form-label"><span class="x-red">*</span>是否领用电脑</label>
            <div class="layui-input-inline">
                <select name="collar" lay-verify="">
                    <option value="" selected>--请选择--</option>
                    <option value="是"
                    <c:if test="${student.collar eq '是'}">
                        selected
                    </c:if>
                    >是</option>
                    <option value="否"
                            <c:if test="${student.collar eq '否'}">
                                selected
                            </c:if>
                    >否</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>是否享受助学金</label>
            <div class="layui-input-inline">
                <select name="grants" lay-verify="">
                    <option value="" selected>--请选择--</option>
                    <option value="是"
                            <c:if test="${student.grants eq '是'}">
                                selected
                            </c:if>
                    >是</option>
                    <option value="否"
                            <c:if test="${student.grants eq '否'}">
                                selected
                            </c:if>
                    >否</option>
                </select>
            </div>
            <label class="layui-form-label"><span class="x-red">*</span>是否送电脑</label>
            <div class="layui-input-inline">
                <select name="computer" lay-verify="">
                    <option value="" selected>--请选择--</option>
                    <option value="是"
                            <c:if test="${student.grants eq '是'}">
                                selected
                            </c:if>
                    >是</option>
                    <option value="否"
                            <c:if test="${student.grants eq '否'}">
                                selected
                            </c:if>
                    >否</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="parents" class="layui-form-label">
                <span class="x-red">*</span>家长姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="parents" name="parents" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${student.parents}">
            </div>
            <label for="parentsphone" class="layui-form-label">
                <span class="x-red">*</span>家长联系电话
            </label>
            <div class="layui-input-inline">
                <input type="text" id="parentsphone" name="parentsphone" required="" lay-verify="phone"
                       autocomplete="off" class="layui-input" value="${student.parentsphone}">
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
                <input type="number" id="qkMoney" name="qkMoney" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${student.qkMoney}">
            </div>
            <label for="intrphone" class="layui-form-label">
                <span class="x-red">*</span>老师电话
            </label>
            <div class="layui-input-inline">
                <input type="text" id="intrphone" name="intrphone" required="" lay-verify="phone"
                       autocomplete="off" class="layui-input" value="${student.intrphone}">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>输入老师电话
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>面试人
            </label>
            <div class="layui-input-inline">
                <select name="audition">
                    <option value="">--选择介绍老师--</option>
                    <c:forEach items="${requestScope.emps}" var="emp">
                        <option value="${emp.empName}"
                            <c:if test="${student.audition eq emp.stuName}">
                                selected
                            </c:if>
                        ></option>
                    </c:forEach>
                 </select>
            </div>
            <label for="auditionoption" class="layui-form-label">
                <span class="x-red">*</span>面试人意见
            </label>
            <div class="layui-input-inline">
                <input type="text" id="auditionoption" name="auditionoption" required="" lay-verify=""
                       autocomplete="off" class="layui-textarea" value="${student.intrphone}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>是否中专
            </label>
            <div class="layui-input-inline">
                <select name="isvocational" lay-verify="">
                    <option value="" selected>--请选择--</option>
                    <option value="1"
                            <c:if test="${student.isvocational eq 1}">
                                selected
                            </c:if>
                    >否</option>
                    <option value="2"
                            <c:if test="${student.isvocational eq 2}">
                                selected
                            </c:if>
                    >是</option>
                </select>
            </div>
            <label for="vocationalsch" class="layui-form-label">
                <span class="x-red">*</span>中专学校
            </label>
            <div class="layui-input-inline">
                <input type="text" id="vocationalsch" name="vocationalsch" required="" lay-verify=""
                       autocomplete="off" class="layui-input" value="${student.vocationalsch}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>中专学籍
            </label>
            <div class="layui-input-inline">
                <select name="vocationalflag" lay-verify="">
                    <option value="" selected>--请选择--</option>
                    <option value="1"
                            <c:if test="${student.vocationalflag eq 1}">
                                selected
                            </c:if>
                    >已退</option>
                    <option value="2"
                            <c:if test="${student.vocationalflag eq 2}">
                                selected
                            </c:if>
                    >保留</option>
                </select>
            </div>
                <label for="enrollno" class="layui-form-label">
                    <span class="x-red">*</span>录取省号
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="enrollno" name="enrollno" required="" lay-verify=""
                           autocomplete="off" class="layui-input" value="${student.enrollno}">
                </div>
        </div>
        <div class="layui-form-item">
            <label for="score" class="layui-form-label">
                <span class="x-red">*</span>录取成绩
            </label>
            <div class="layui-input-inline">
                <input type="text" id="score" name="score" required="" lay-verify=""
                       autocomplete="off" class="layui-input" value="${student.score}">
            </div>
            <label class="layui-form-label">
                <span class="x-red">*</span>是否低保
            </label>
            <div class="layui-input-inline">
                <select name="dibao" lay-verify="">
                    <option value="" selected>--请选择--</option>
                    <option value="是"
                            <c:if test="${student.dibao eq '是'}">
                                selected
                            </c:if>
                    >是</option>
                    <option value="否"
                            <c:if test="${student.dibao eq '否'}">
                                selected
                            </c:if>
                    >否</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="sourceType" class="layui-form-label">
                <span class="x-red">*</span>生源类型
            </label>
            <div class="layui-input-inline">
                <input type="text" id="sourceType" name="sourceType" required="" lay-verify=""
                       autocomplete="off" class="layui-input" value="${student.sourceType}">
            </div>
            <label for="guarantee" class="layui-form-label">
                <span class="x-red">*</span>担保人
            </label>
            <div class="layui-input-inline">
                <input type="text" id="guarantee" name="guarantee" required="" lay-verify=""
                       autocomplete="off" class="layui-input" value="${student.guarantee}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>是否当兵
            </label>
            <div class="layui-input-inline">
                <select name="soldier" lay-verify="">
                    <option value="" selected>--请选择--</option>
                    <option value="是"
                            <c:if test="${student.soldier eq '是'}">
                                selected
                            </c:if>
                    >是</option>
                    <option value="否"
                            <c:if test="${student.soldier eq '否'}">
                                selected
                            </c:if>
                    >否</option>
                </select>
            </div>
            <label for="registration" class="layui-form-label">
                <span class="x-red">*</span>报名号
            </label>
            <div class="layui-input-inline">
                <input type="text" id="registration" name="registration" required="" lay-verify=""
                       autocomplete="off" class="layui-input" value="${student.registration}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>是否住校
            </label>
            <div class="layui-input-inline">
                <select name="zhuxiao" lay-verify="">
                    <option value="" selected>--请选择--</option>
                    <option value="是"
                            <c:if test="${student.zhuxiao eq '是'}">
                                selected
                            </c:if>
                    >是</option>
                    <option value="否"
                            <c:if test="${student.zhuxiao eq '否'}">
                                selected
                            </c:if>
                    >否</option>
                </select>
            </div>
            <label for="remart" class="layui-form-label">
                <span class="x-red">*</span>备注
            </label>
            <div class="layui-input-inline">
                <input type="text" id="remart" name="remart" required="" lay-verify=""
                       autocomplete="off" class="layui-textarea" value="${student.remart}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>是否退学
            </label>
            <div class="layui-input-inline">
                <select name="tuixue" lay-verify="">
                    <option value="" selected>--请选择--</option>
                    <option value="是"
                            <c:if test="${student.tuixue eq '是'}">
                                selected
                            </c:if>
                    >是</option>
                    <option value="否"
                            <c:if test="${student.tuixue eq '否'}">
                                selected
                            </c:if>
                    >否</option>
                </select>
            </div>
            <label class="layui-form-label">
                <span class="x-red">*</span>是否休学
            </label>
            <div class="layui-input-inline">
                <select name="xiuxue" lay-verify="">
                    <option value="" selected>--请选择--</option>
                    <option value="是"
                            <c:if test="${student.xiuxue eq '是'}">
                                selected
                            </c:if>
                    >是</option>
                    <option value="否"
                            <c:if test="${student.xiuxue eq '否'}">
                                selected
                            </c:if>
                    >否</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>是否送电脑
            </label>
            <div class="layui-input-inline">
                <select name="computer" lay-verify="">
                    <option value="" selected>--请选择--</option>
                    <option value="是"
                            <c:if test="${student.computer eq '是'}">
                                selected
                            </c:if>
                    >是</option>
                    <option value="否"
                            <c:if test="${student.computer eq '否'}">
                                selected
                            </c:if>
                    >否</option>
                </select>
            </div>
            <label class="layui-form-label">
                <span class="x-red">*</span>是否领用电脑
            </label>
            <div class="layui-input-inline">
                <select name="collar" lay-verify="">
                    <option value="" selected>--请选择--</option>
                    <option value="是"
                            <c:if test="${student.collar eq '是'}">
                                selected
                            </c:if>
                    >是</option>
                    <option value="否"
                            <c:if test="${student.collar eq '否'}">
                                selected
                            </c:if>
                    >否</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>是否领用助学金
            </label>
            <div class="layui-input-inline">
                <select name="grants" lay-verify="">
                    <option value="" selected>--请选择--</option>
                    <option value="是"
                            <c:if test="${student.grants eq '是'}">
                                selected
                            </c:if>
                    >是</option>
                    <option value="否"
                            <c:if test="${student.grants eq '否'}">
                                selected
                            </c:if>
                    >否</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <button  class="layui-btn" lay-filter="update" lay-submit="">
                增加
            </button>
        </div>
    </form>
</div>
<script>
    var laydate = layui.laydate;
    laydate.render({
        elem: '#birthday'//指定元素
    });
    laydate.render({
        elem: '#entertime'//指定元素
    })
</script>
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
            form.on('submit(update)', function(data){
                alert(data.field.stuId)
                $.ajax({
                    url:'<%=request.getContextPath()%>/student/update',
                    type:'post',
                    data:data.field,
                    dataType:'json',
                    success:function (data){
                        layer.msg("修改成功", {icon: 6},function(){
                            // 获得frame索引
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                            setTimeout(function () {
                                window.parent.location.reload(); //修改成功后刷新父界面
                            })
                        });
                    },
                    error:function () {
                        layer.msg("修改失败",{icon: 6});
                    }
                });
                return false;
            });
        });
</script>
<script>
    var _hmt = _hmt || []; (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</body>
</html>
