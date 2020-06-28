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
<link href="css/page.css" rel="stylesheet"/>
<link href="css/common.css" rel="stylesheet"/>
 <link rel="stylesheet" href="layui/css/layui.css"  media="all">
</head>
<style>
table{
table-layout: fixed;

}
td{
white-space: nowrap;     
	overflow: hidden;
	text-overflow: ellipsis;

}
</style>
<body>
	<table width="100%">
		<tr>
			<td width="50%" align="left" valign="middle">
				当前位置:<a href="admin/TeacherTeamServlet">教学团队管理</a>
			</td>
			<td width="50%" align="right" valign="middle">
				<a href="admin/teacherTeamAdd.jsp">新增</a>
			</td>
		</tr>
	</table>
	<hr>
	<form action="admin/TeacherTeamServlet" method="post">
		<p>
			用户名:<input type="text" name="name" value="${name}"/> <input type="submit" value="查询"/>
		</p>
	</form>
	
	<table width="100%" class="dataTable">
		<thead>
			<tr class="title">
				<td width="15%">姓名</td>
				<td width="15%">教龄</td>
				<td width="15%">介绍</td>
				<td width="15%">职称</td>
				<td width="15%">学院</td>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="item">
				<tr>
					<td>${item.name}</td>
					<td>${item.teachAge}</td>
					<td>${item.introduce}</td>
					<td>${item.titletype}</td>
					<td>${item.collega}</td>
					<td>
						<a class="layui-btn layui-btn-primary layui-btn-xs" href="admin/TeacherTeamDetail?id=${item.id}">详细</a> | 
						<a class="layui-btn layui-btn-xs" href="admin/TeacherTeamInitEdit?id=${item.id}">编辑</a> | 
						<a class="layui-btn layui-btn-danger layui-btn-xs" href="admin/TeacherTeamDelete?id=${item.id}">删除</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:if test="${not empty paginationHtml}">
		<div class="page">${paginationHtml}</div>
	</c:if>
</body>
</html>