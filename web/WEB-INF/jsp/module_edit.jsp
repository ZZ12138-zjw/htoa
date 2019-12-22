<%--
  Created by IntelliJ IDEA.
  User: LaIWeiChun
  Date: 2019/12/20
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑权限</title>
    <jsp:include page="top.jsp"></jsp:include>
</head>
<body>
    <div id="module"></div>
</body>
    <script>
        layui.use(['tree','util'],function(){
           var tree=layui.tree,
               util=layui.util,
               layer=layui.layer;

            //演示
            tree.render({
                elem:'#module'
                ,data:getData()
                ,showCheckbox: true  //是否显示复选框
                ,click:function(obj){
                    var data = obj.data;  //获取当前点击的节点数据
                    layer.msg('状态：'+ obj.state + '<br>节点数据：' + JSON.stringify(data));
                }
            });
        });

        //获取数据
        function getData(){
            var datas = [];
            $.ajax({
                url: "${pageContext.request.contextPath}/quanXie/moduleList",    //后台数据请求地址
                type: "post",
                async:false,
                dataType:'json',
                success: function(resut){
                    datas = resut;
                }
            });
            console.log(datas);
            return datas;
        }

    </script>
</html>
