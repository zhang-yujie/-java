<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>前台管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/test.css">

</head>

<style type="text/css">
.top {
	height: 240px;
	background: url(image/index/header.png) no-repeat;
	background-size: cover;
}
</style>
<body>
	<div class="center">
		<div class="top">
		
			<h1 class="topFont1">${name }</h1>
			<p class="topFont2">
			
				全站搜索&nbsp;&nbsp;<input style="width: 200px" placeholder="请输入搜索内容" name="seaechName" id="seaechName"/>
				<input type="button" class="topButton" onclick="globalSearch()" value="搜索 " />
			</p>

			<ul>
				<li><a href="Initial?moduelId=1" target="content">首页</a></li>
				<li><a href="CourseIntroductionServlet" target="content">课程介绍</a></li>
				<li><a href="CourseTeam" target="content">教学团队</a></li>
				<li><a href="CourseConstruction?moduelId=4" target="content">课程建设</a></li>
				<li><a href="CourseResourseServlet?modelId=5" target="content">课程资源</a></li>
				<li><a href="QQDataGet" target="content">问题与答疑</a></li>
				<li><a href="CourseResearch?modelId=7" target="content">课程研究</a></li>
			</ul>

		</div>
		<div class="middle">
			<iframe src="Initial?moduelId=1" class="content" name="content"
				frameborder="0" scrolling="no" id="test"
				style="margin: 0px auto; min-height: 500px; width: 100%; "
				onload="this.height=100"></iframe>
				<!-- <iframe src="backtop.html" frameborder="0" scrolling="no" id="test" onload="this.height=100"></iframe> -->
		</div>
		<div class="bottom">
			<span class="line"></span>
			<p class="buttom_font">
				重庆理工大学计算机科学与工程学院版权所有 <br>
				联系地址：重庆市巴南区红光大道69号（邮编：400054）&nbsp;联系电话：（023）68667334
			</p>
		</div>
	</div>
	<script type="text/javascript">
		function reinitIframe() {
			var iframe = document.getElementById("test");
			try {
				var bHeight = iframe.contentWindow.document.body.scrollHeight;
				var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
				var height = Math.max(bHeight, dHeight);
				iframe.height = height;
				console.log(height);
			} catch (ex) {
			}
		}
		window.setInterval("reinitIframe()", 200);
		
		
		function globalSearch(){
		var seaechName = document.getElementById("seaechName").value;
		 content.location.href = "admin/NewsServlet?querytitle=" + seaechName;
		
		}
	</script>
</body>
</html>
