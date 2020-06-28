<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="layui/css/layui.css"  media="all">
</head>
<body>

	<div>
		<div style="height:300px;width:180px;float:left;margin-right:20px">
			<div id="test66" class="demo-tree"></div>
		</div>

		<div>
			<iframe src="" class="innerFrame" name="innerFrame" frameborder="0"
				scrolling="no"
				style="margin: 0px auto; height:700px; width:80%;-ms-overflow-y: hidden; -ms-overflow-x: hidden; "></iframe>
		</div>
	</div>


	<script src="layui/layui.js" charset="utf-8"></script>
<script>
layui.use(['tree', 'util'], function(){
  var tree = layui.tree
  ,layer = layui.layer
  ,util = layui.util
 
  ,data67 = [{
    title: '首页'
    ,id: 1
    ,children: [{
      title: '南昌'
      ,id: 11
      ,children: [{
        title: '青山湖区'
        ,id: 111
        ,href: 'https://www.layui.com/doc/'
      },{
        title: '高新区'
        ,id: 112
      }]
    },{
    title:'课程介绍',
    id:12
    ,children:[{
    title:'课程简介分类',
    id:121
    }]
    },{
    title:'教学团队'
    ,id:12
    },{
    title:'课程建设',
    id:14
    ,children:[{
    title:'课程简介',
    id:401
    },{
    title:'课程负责人',
    id:402
    },{
    title:'课程动态',
    id:403
    },{
    title:'教学资源',
    id:404
    }]
    },{
    title:'课程资源',
    id:15
    },{
    title:'问题与答疑',
    id:16
    },{
    title:'课程研究',
    id:17
    }
    ]
  }]

  //按钮事件
  util.event('lay-demo', {
    getChecked: function(othis){
      var checkedData = tree.getChecked('demoId1'); //获取选中节点的数据
      
      layer.alert(JSON.stringify(checkedData), {shade:0});
      console.log(checkedData);
    }
    ,setChecked: function(){
      tree.setChecked('demoId1', [12, 16]); //勾选指定节点
    }
    ,reload: function(){
      //重载实例
      tree.reload('demoId1', {
        
      });
      
    }
  });
 
 tree.render({
    elem: '#test66'
    ,data: data67
    ,showLine: false  //是否开启连接线
    ,click: function(obj){
      var data = obj.data;  //获取当前点击的节点数据
      if(data.id > 99)
     	 innerFrame.location.href = "admin/CourseTypeServlet";
    }
  });
 


});
</script>

</body>
</html>