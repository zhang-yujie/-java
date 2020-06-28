<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理系统</title>
<link rel="stylesheet" type="text/css" href="../css/background.css">
<style type="text/css">
.top{
	height: 100px;
	background: url(../image/index/background.png) no-repeat;

}</style>
</head>

<body>
	<div class="center">
		<div class="top">
		<h4 class="top_font">网站后台管理系统</h4>
		<p class="top_font1">欢迎您，超级管理员</p>
		<p class="top_font3"><a herf='' style="cursor:pointer">通用网站</a></p>
		<p class="top_font2">
		|&nbsp;<a href="changePassword.jsp" style="cursor:pointer;text-decoration:none">修改密码</a>&nbsp;|&nbsp;<a href="AdminLogout" style="cursor:pointer;text-decoration:none">退出</a>&nbsp;|
		</p>
		
		</div>
		<div class="middle">
			<iframe src="IndexPermissionInit" class="content" name="content"
					frameborder="0" scrolling="no"
					style="margin: 0px auto; height: 100%; width:100%; -ms-overflow-x: hidden;" onload="this.height=100">
			</iframe>
		</div>
		<div class="bottom">
			<span class="line"></span>
			<p class="bottom_image">
			<img src="../image/index/bottom.png">
			<span class="bottom_font">版本信息</span>
			</p>
			
		</div>
	</div>

</body>
<script type="text/javascript">
	
		function reinitIframe(){
		var iframe = document.getElementById("content");
		try{
		var bHeight = iframe.contentWindow.document.body.scrollHeight;
		var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
		var height = Math.max(bHeight, dHeight);
		iframe.height = height;
		console.log(height);
		}catch (ex){}
		}
		window.setInterval("reinitIframe()", 200);
	</script>

</html>