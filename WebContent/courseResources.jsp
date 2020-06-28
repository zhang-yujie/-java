<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'courseResources.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
.center {
	padding-top: 20px;
}

.left_part {
	background-color: #f4f8fc;
	width: 25%;
	float: left;
	height: 450px;
}

.right_part {
	width: 735px;
	height: 100%;
	height: 450px;
	margin-left: 25%;
}

.search {
	background-color: lightgrey;
	margin-left: 19px;
	padding: 5px 10px;
	width: 180px;
}

.column {
	background-color: red;
	height: 40px;
	color: white;
	text-align: center;
	font-size: 20px;
}

.line {
	width: 100%;
	display: inline-block;
	border-top: 2px solid red;
	position: relative;
	top: -6px;
}

.img {
	width: 30px;
	position: relative;
	top: 5px;
}

.curPosition {
	color: red;
	margin-left: 280px;
	font-size: 15px;
}

.sub_column {
	padding: 10px 5px;
}

.table {
	margin-left: 10px;
	margin-top: 10px;
}

.td1{
    width: 100px;
    padding: 0px 30px;
    text-align: center;
}

</style>
</head>

<body>
	<div class="center">
		<div class="left_part">
			<p class="search">
				<input placeholder="请输入搜索标题" style="width: 125px;">&nbsp;
				<button>搜索</button>
			</p>
			<%
			List<Map<String,Object>> list = (List<Map<String,Object>>)request.getAttribute("list");
		%>
			<table style="width: 200px; margin: 20px; border-collapse: collapse;">
				<thead class="column">
					<tr>
						<td>课程介绍</td>
					</tr>

				</thead>
				<tbody style="text-align: center; background-color: lightgrey">
					<%for(Map<String,Object> l:list) {%>
					<tr style="height:40px;border:solid 1px white"">
						<td class="sub_column">
						
						<a href="CourseResourseServlet?id=<%=l.get("type") %>" 
							style="cursor: pointer; color: black; text-decoration: none;"><%=l.get("name")  %>
							</a>
						</td>
					</tr>
					<%} %>
					<tr style="height: 50px;">
						<td></td>
					</tr>
				</tbody>
			</table>

		</div>


		<div class="right_part">
			<p>
				<img src="image/index/tv.png" class="img"><span
					style="color: red"><b>${name}</b></span> <span class="curPosition">您当前的位置：</span>
				<span style="font-size: 15px;">课程介绍&nbsp;></span><span
					style="font-size: 15px; color: #990000; margin-right: 10px;">
					${name}</span>

			</p>
			<span class="line"></span>
			<%
			List<Map<String,Object>> resourses = (List<Map<String,Object>>)request.getAttribute("resourses");
			%>
			<table class="table">
		<% 
		 	int i=0;
			for(Map<String,Object> r:resourses){
				if(i%3==0){
		%>
				<tr>
				<%} %>
					
					<td class="td1">
					<%i++; %>
					<img alt="" src="LoadImage?fileName=<%= r.get("img")%>&type=resourse" style="width:180px;height:180px;"/>
					<a href="<%=r.get("resourse")%>" download="<%=r.get("resourse") %>" style="text-decoration:none"><%=r.get("name") %></a>
					</td>
				<%if(i%3==0) {i=0;%>
				</tr>
				<%} %>
			<%} %>
			</table>

		</div>
	</div>
</body>
</html>
