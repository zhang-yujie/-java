<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.cqut.recruitPortal.dto.*"%>
<%@ page import="com.cqut.recruitPortal.entity.*"%>
<%@ page import="com.cqut.recruitPortal.servlet.SysUtil"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
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
	<details>
		<summary>所有栏目</summary>
		<%
			List<ModuleTypeColumn> list = (List<ModuleTypeColumn>) request.getAttribute("list");
			List<Map<String,Object>> list2 = (List<Map<String,Object>>)request.getAttribute("list2");
			int size = list.size();
			for (int i = 0; i < size; i++) {
				String columnName = list.get(i).getName();
				List<Map<String, Object>> listMap = list.get(i).getModuleColumn();
		%>
		<details>
			<summary>
				<a <%if(i == 1){ %> href="admin/CourseServlet" target="innerFrame"><%=columnName%></a>

			</summary>

			<%
				for (Map<String, Object> news : list2) {
			%>
			<div>
				<a
					href="admin/CourseServlet?introductionTypeID=<%=news.get("introductionTypeID")%>"
					target="innerFrame"><%=news.get("name")%></a>
			</div>
			<%
				}
			%>
		</details>

		<%}else{ %>
		href="admin/ModuleColumnServlet?newModuleID=<%=list.get(i).getNewModuleID()%>"
		target="innerFrame"><%=columnName%></a>
		</summary>

		<%
				for (Map<String, Object> news : listMap) {
			%>
		<div>
			<a
				href="admin/ModuleColumnServlet?columnID=<%=news.get("columnID")%>"
				target="innerFrame"><%=news.get("columnName")%></a>
		</div>
		<%
				}
			%>
	</details>


	<%} %>

	<%} %>
	</details>
</body>
</html>