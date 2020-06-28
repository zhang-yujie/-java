<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.cqut.recruitPortal.dto.*"%>
<%@ page import="com.cqut.recruitPortal.entity.*"%>
<%@ page import="com.cqut.recruitPortal.servlet.SysUtil"%>
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
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="layui/css/layui.css" media="all">
</head>
<style type="text/css">

/* 隐藏默认三角 */
::-webkit-details-marker {
	display: none;
}

::-moz-list-bullet {
	font-size: 0;
	float: left;
}

details {
	padding-left: 20px;
}

summary::before {
	content: '';
	display: inline-block;
	width: 12px;
	height: 12px;
	border: 1px solid #999;
	background: linear-gradient(to right, #999, #999) no-repeat center,
		linear-gradient(to top, #999, #999) no-repeat center;
	background-size: 2px 10px, 10px 2px;
	vertical-align: -2px;
	margin-right: 6px;
	margin-left: -20px;
}

[open]>summary::before {
	background: linear-gradient(to right, #999, #999) no-repeat center;
	background-size: 10px 2px;
}
</style>
<body>

	<div>
		<div style="height:300px;width:180px;float:left;margin-right:20px">
			<details> <summary><a href="admin/ModuleColumnTypeServlet" target = "innerFrame2">所有栏目</a></summary> <%
			List<ModuleTypeColumn> list = (List<ModuleTypeColumn>) request.getAttribute("list");
			List<Map<String,Object>> list2 = (List<Map<String,Object>>)request.getAttribute("list2");
			int size = list.size();
			for (int i = 0; i < size; i++) {
				String columnName = list.get(i).getName();
				List<Map<String, Object>> listMap = list.get(i).getModuleColumn();
		%> <details> <summary>  <a
				href="admin/ModuleColumnTypeServlet?newModuleID=<%=list.get(i).getNewModuleID()%>"
				target="innerFrame2"><%=columnName%></a> </summary> <%
				for (Map<String, Object> news : listMap) {
			%>
			<div>
				<a
					href="admin/ModuleColumnTypeServlet?columnID=<%=news.get("columnID")%>"
					target="innerFrame2"><%=news.get("columnName")%></a>
			</div>			
			<%
				}
			%> 				
				<%if(i == 1){ %>
				<div>
				<a
					href="admin/CourseTypeServlet"
					target="innerFrame2">课程介绍</a>
			</div>
			<%} %>
			</details>
			
			<%} %>
			</details>
		</div>

		<div>
			<iframe scrolling="yes" src="admin/ModuleColumnTypeServlet"
				class="innerFrame" name="innerFrame2" frameborder="0" scrolling="no"
				style="height:700px; width:960px;-ms-overflow-x: hidden; "></iframe>
		</div>


	</div>


	<script src="layui/layui.js" charset="utf-8"></script>


</body>
</html>