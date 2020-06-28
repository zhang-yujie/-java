<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>这里是标题</title>
<link rel="stylesheet" href="layui/css/layui.css" media="all">
<link href="css/page.css" rel="stylesheet"/>
<link href="css/common.css" rel="stylesheet"/>

</head>
<body>
	<table width="100%">
		<tr>
			<td width="50%" align="left" valign="middle">
				当前位置:<a style="color:red" href="admin/CourseServlet">课程介绍管理</a>
			</td>
		</tr>
	</table>
	<hr/>
	<table width="100%" class="dataTable">
		<thead>
			<tr class="title">
				<td width="60%" height="24">栏目名称</td>
				<td width="40%" height="24">操作</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="item">
				<tr>
					<td height="20">${item.name}</td>
					
					<td height="20">
					 <a class="layui-btn layui-btn-primary layui-btn-xs" href="admin/CourseDetail?courseTypeID=${item.introductionTypeID}">查看</a>
					<%-- <a href="admin/CourseDetail?courseTypeID=${item.introductionTypeID}">查看</a>| --%>
					<a class="layui-btn layui-btn-xs" href="admin/CourseInitEdit?courseTypeID=${item.introductionTypeID}">编辑</a>
					<%-- <a href="admin/CourseInitEdit?courseTypeID=${item.introductionTypeID}">编辑</a></td> --%>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:if test="${not empty pages}">
		<div class="page">${pages}</div>
	</c:if>
</body>
</html>