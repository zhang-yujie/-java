<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
 <link rel="stylesheet" href="layui/css/layui.css" media="all">
<title>课程介绍</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

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
	font-size:20px;
}

.line {
    width: 100%;
    display: inline-block;
    border-top: 2px solid red;
    position: relative;
    top: 3px;
}


.img {
    width: 30px;
    position: relative;
    top: -2px;
}

.curPosition{
    color: red;
    margin-left: 280px;
    font-size: 15px;
}

.sub_column {
    padding: 10px 5px;
}

.table{
    margin-left: 10px;
    margin-top: 10px;
}


</style>
</head>

<body>
<div class="center">
	<div class="left_part">
		<p class="search">
			<input placeholder="请输入搜索标题" style="width:125px;">
			<button>搜索</button>
		</p>
		<table style="width: 200px; margin: 20px; border-collapse: collapse;" >
			<thead class="column">
				<tr>
					<td>课程介绍</td>
				</tr>

			</thead>
			<tbody style="text-align: center; background-color: lightgrey">
				<c:forEach items="${list}" var="item">
					<tr style="height:40px;border:solid 1px white">
						<td class="sub_column"><a 
							href="CourseIntroductionServlet?id=${item.introductionTypeID}"
							style="cursor: pointer; color:black;text-decoration:none;">${item.name}</a></td>
					</tr>
				</c:forEach>
				<tr style="height:50px;"><td></td></tr>
			</tbody>
		</table>

	</div>
	
	
	<div class="right_part">
	<p>
	<img src="image/index/tv.png" class="img"><span style="color:red"><b>${name}</b></span>
	<span class="curPosition">您当前的位置：</span>
	<span style="font-size:15px;">课程介绍&nbsp;></span><span style="font-size:15px;color:#990000;margin-right:10px;"> ${name}</span>
	
	</p>
	<span class="line"></span>
		<%
			List<Map<String,Object>> news = (List<Map<String,Object>>)request.getAttribute("news");
			int size = news.size();
			boolean flag = (Boolean)request.getAttribute("flag");
			System.out.println("flag"+flag);
		%>
		<% if(size == 1 && !flag){ %>
			<p style="margin-top:10px;"><%=news.get(0).get("content") %></p>	
		<%} %>	
		
		<table class="table">
		<% if(flag){ 
			for(Map<String,Object> n:news){
		%>
				<tr >
					<td >
						<img src="image/index/dynamicico.png">&nbsp;
						<a href="CourseDynamicDetail?newsID=<%= n.get("newsID")%>"><%=n.get("title") %></a>
					</td>
					<!-- 时间 -->
					<td style="padding-left:400px;">
						<%
							if(n.get("publishTime")!=null)
						{
						%>
							<%= n.get("publishTime") %>
						<%
						} 
						%>
					</td>
					
				</tr>
			<%} %>
		</table>
			
		<%} %>
	</div>
</div>
</body>
</html>
