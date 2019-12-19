<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>宏图软件</title>
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
    <!-- 顶部开始 -->
    <div class="container">
        <div class="logo"><a href="index.jsp">宏图软件教育</a></div>
        <div class="left_open">
            <i title="展开左侧栏" class="iconfont">&#xe699;</i>
        </div>
        <ul class="layui-nav left fast-add" lay-filter="">
          <li class="layui-nav-item">
            <a href="javascript:;">+新增</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
              <dd><a onclick="x_admin_show('请假','${pageContext.request.contextPath}/empLeave/to_holidayAdd')"><i class="iconfont">&#xe6a2;</i>请假</a></dd>
              <dd><a onclick="x_admin_show('谈心','http://www.baidu.com')"><i class="iconfont">&#xe6a8;</i>谈心</a></dd>
               <dd><a onclick="x_admin_show('员工','http://www.baidu.com')"><i class="iconfont">&#xe6b8;</i>员工</a></dd>
            </dl>
          </li>
        </ul>
        <ul class="layui-nav right" lay-filter="">
          <li class="layui-nav-item">
            <a href="javascript:;">${empVo.empName}</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
              <dd><a onclick="x_admin_show('个人信息','http://www.baidu.com')">个人信息</a></dd>
              <dd><a onclick="x_admin_show('修改密码','http://www.baidu.com')">切换帐号</a></dd>
              <dd><a href="${pageContext.request.contextPath}/sign_out">退出</a></dd>
            </dl>
          </li>
        </ul>
        
    </div>
    <!-- 顶部结束 -->
    <!-- 中部开始 -->
     <!-- 左侧菜单开始 -->
    <div class="left-nav">
      <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>个人主页</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/empLeave/to_holidayList">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>员工请假</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="${pageContext.request.contextPath}/myweek/myweekly_list">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>我的周报</cite>
                            
                        </a>
                    </li>
                    <li>
                        <a _href="${pageContext.request.contextPath}/attendance/to_attendanceList">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>考勤管理</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="member-del.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>离职申请</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <%--员工管理 begin--%>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe70b;</i>
                    <cite>员工管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/dept/to_depList">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>部门管理</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="${pageContext.request.contextPath}/emp/to_emplist">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>员工列表</cite>

                        </a>
                    </li>
                    <li>
                        <a _href="${pageContext.request.contextPath}/week/weekly_list">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>周报管理</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="${pageContext.request.contextPath}/talk/talkpage">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>谈心记录</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="${pageContext.request.contextPath}/empLeave/to_holidayList">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>请假管理</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="${pageContext.request.contextPath}/attendance/to_attendanceList">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>考勤管理</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <%--员工管理 end--%>
            <%--学生管理 begin--%>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>学生管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="order-list.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>学生请假</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="<%=request.getContextPath()%>/cla/class">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>班级管理</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="${pageContext.request.contextPath}/floor/to_floor_list">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>楼栋管理</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="<%=request.getContextPath()%>/huor/to_huor_list">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>宿舍管理</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="<%=request.getContextPath()%>/student/studentInfo">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>学生列表</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="${pageContext.request.contextPath}/testscore/Test_score">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>考试成绩</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="<%=request.getContextPath()%>/reScore/page">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>答辩成绩</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <%--学生管理 end--%>
            <%--教务管理 begin--%>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>教务管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/coursetype/tocurriculum_list">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>课程类别</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="${pageContext.request.contextPath}/course/tocourse_list">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>课程管理</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="${pageContext.request.contextPath}/trial/to_trial_list">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>试讲培训</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="${pageContext.request.contextPath}/weekarrange/to_weekarrange_list">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>值班管理</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <%--教务管理 end--%>
            <%--后勤管理 begin--%>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>后勤管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/repaircontro/to_repairapply">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>报修申请</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="${pageContext.request.contextPath}/repaircontro/to_repairmanage">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>维修管理</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <%--后勤管理 end--%>
            <%--考核管理 begin--%>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>考核管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/checkcontro/to_checkindex">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>考核指标</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="${pageContext.request.contextPath}/checkinsertcontro/to_checkinsert">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>考核录入</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="order-list.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>考评内容</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="${pageContext.request.contextPath}/evaluationcontro/to_empevaluation">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>教师考评</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <%--考核管理 end--%>
            <%--问题反馈 begin--%>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>问题反馈</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>问题反馈</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <%--问题反馈 end--%>
            <%--文件管理 begin--%>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>文件管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/doc/document_list">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>资料文档</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <%--文件管理 end--%>
            <%--通知公告 begin--%>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>通知公告</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/notice/tonotice_list">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>公告发布</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <%--通知公告 end--%>
            <%--系统设置 begin--%>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe726;</i>
                    <cite>系统设置</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/process/process_list">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>流程列表</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="admin-role.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>角色管理</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="admin-rule.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>权限管理</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <%--系统设置 end--%>
            <%--系统报表 begin --%>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6ce;</i>
                    <cite>系统报表</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="${pageContext.request.contextPath}/sysreport/emp_assessreport">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>员工考核报表</cite>
                        </a>
                    </li >


                    <li>
                        <a _href="${pageContext.request.contextPath}/sysreport/emp_attendancereport">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>未打卡说明</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="echarts3.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>地图</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="echarts4.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>饼图</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="echarts5.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>雷达图</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="echarts6.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>k线图</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="echarts7.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>热力图</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="echarts8.html">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>仪表图</cite>
                        </a>
                    </li>
                </ul>
            </li>
            <%--系统报表 end--%>
        </ul>
      </div>
    </div>
    <!-- <div class="x-slide_left"></div> -->
    <!-- 左侧菜单结束 -->
    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowClose="true">
          <ul class="layui-tab-title">
            <li>我的桌面</li>
          </ul>
          <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='${pageContext.request.contextPath}/to_welcome' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
          </div>
        </div>
    </div>
    <div class="page-content-bg"></div>
    <!-- 右侧主体结束 -->
    <!-- 中部结束 -->
    <!-- 底部开始 -->
    <div class="footer">
        <div class="copyright">Copyright ©2017 x-admin v2.3 All Rights Reserved</div>  
    </div> 
</body>
</html>