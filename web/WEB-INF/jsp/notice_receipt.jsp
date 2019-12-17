<%--
  Created by IntelliJ IDEA.
  User: 华
  Date: 2019/12/15
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="top.jsp"></jsp:include>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
    <table  class="layui-hide" id="demo"></table>
    <script type="text/javascript">
        layui.use('table',function (){
            var table = layui.table;

            table.render({
                elem:"#demo",
                cols:[[ //标题栏
                    {field: 'title', title: '标题', width: 120,sort: true}
                    ,{field: 'empName', title: '发布人', width: 120}
                    ,{field: 'noticeTime', title: '发布时间', minWidth: 150}
                    ,{field: 'js', title: '接收人', minWidth: 160}
                    ,{field: 'isRead', title: '是否已读', width: 80,templet:'#shifou'}
                    ,{field: 'type', title: '类型', width: 80,templet:'#leixing'}
                ]],
                data:${noticeReceiptList},
                even: true
            })
        })
    </script>
    <script type="text/html" id="leixing">
        {{# if(d.type == 1){ }}
        员工
        {{# }else if(d.type == 2){ }}
        学生
        {{# }else if(d.type == 3){ }}
        全部
        {{# } }}
    </script>
    <script type="text/html" id="shifou">
        {{# if(d.isRead == 1){ }}
        已读
        {{# }else if(d.isRead == 2){ }}
        未读
        {{# } }}
    </script>
</body>
</html>
