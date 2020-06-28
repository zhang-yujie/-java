<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
<title>Insert title here</title>
<%
	Map<String,Object> teacher = (Map<String,Object>)request.getAttribute("teacher");
%>
<style type="text/css">
.left.left {
    width: 300px;
    margin: 30px auto;
    float: left;
}

.right {
    margin: 10px 30px;
    position: relative;
    top: 35px;
}

.introduce {
    width: 500px;
    height: 250px;
    border: solid 1px;
    float: right;
    position: relative;
    left: -50px;
    top: -30px;
}

</style>
</head>
<body>
	<div class="left">
		<img alt="" src="LoadImage?fileName=<%= teacher.get("picture")%>&type=teachTeam" style="width:200px;height:250px;margin-left:30px;"/>
	</div>
	<div class="right">
		<p><label>教师姓名：</label><%=teacher.get("name") %></p>
		<p><label>教师称号：</label><%=teacher.get("titletype") %></p>
		<p><label>教龄：</label><%=teacher.get("teachAge") %></p>
		<p><label>学院：</label><%=teacher.get("collega") %></p>
		<p><label>教师简介：</label></p>
		<table class="introduce">
			<tr>
				<td><%=teacher.get("introduce") %></td>
			</tr>
		</table>
		
	</div>
</body>
</html>