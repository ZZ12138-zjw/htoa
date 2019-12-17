<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/12/17
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="../static/echarts.min.js"></script>
    <script src="../static/jquery-1.7.2.min.js"></script>
</head>
<body>
    <div id="main" style="width: 500px;height: 300px"></div>
</body>
<script>

    var mychart = echarts.init(document.getElementById("main"));
    $.post("url",{},function (d) {
        mychart.setOption({
            title:{
                text:'ECharts入门',
            },
            tooltip:{},
            legend:{
                data:['员工考核']
            },
            //x轴
            xAxis:{
                data:d.names
            },
            //y轴
            yAxis:{},
            //系列
            series:{
                name:'员工考核',
                type:'bar',
                data:d.nums
            }
        });
    },"json");
</script>
</html>
