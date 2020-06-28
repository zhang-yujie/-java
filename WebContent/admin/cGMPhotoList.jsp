<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>
.box{
display: flex;
flex-direction: row;
 flex-wrap: wrap;
}
</style>
</head>
<body>
	<p>当前位置：课题组成员</p>
	<a href="admin/cGMPhotoUpload.jsp">添加</a>
	<a href="admin/CGMPhotoServlet?edit=1">编辑</a>
	<div style="width:1100px" class = "box">
		<c:forEach items="${list}" var="item">
		<div style="width:100px;height:100px;margin:4px"><img alt=""
			src="LoadImage?fileName=${item.photo}&type=cgm"
			style="width:100px;" /></div>
	</c:forEach>
	</div>
	
	
</body>
</html>