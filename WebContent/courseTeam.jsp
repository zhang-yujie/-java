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
	List<Map<String,Object>> teachers = (List<Map<String,Object>>)request.getAttribute("teachers");
%>
<style>
.teaname{
    text-decoration: none;
    color: black;
    position: relative;
    top: 8px;
    left: 70px;
}

.teaname a.hover{
	color:grey;
}

.top {
    width: 900px;
    margin: 10px auto;
}

.bottom{

}

.line {
    width: 100%;
    display: inline-block;
    border-top: 1.5px solid red;
    position: relative;
    top: -7px;
}

</style>
</head>

<body>
<div class="top">
	<p>当前位置&nbsp;>>&nbsp;<a href="CourseTeam" style="text-decoration:none;color:black;">教学团队</a></p>
	<span class="line"></span>
</div>
<div class="bottom">
<table style="margin:10px auto;border:solid 1px red;padding:20px 0px;">
	<%  int i=0;
		for(Map<String,Object> teacher:teachers){
			if(i%3==0){
	%>
	       		<tr>
			<%} %>
		<td style="padding:5px 40px;">
		<%i++; %>
			<img alt="" src="LoadImage?fileName=<%= teacher.get("picture")%>&type=teachTeam" style="width:200px;height:250px;"/>
			<br>
			<a href="TeacherDetail?id=<%=teacher.get("id") %>" class="teaname" style="text-decoration:none;color:black;"><%=teacher.get("name") %> </a>
		</td>
		<%if(i%3==0) {i=0;%>
			</tr>
		<%} %>
	<%} %>
</table>
</div>
</body>
</html>