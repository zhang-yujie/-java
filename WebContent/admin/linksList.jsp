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
<body>
	<table width="100%">
		<tr>
			<td width="50%" align="left" valign="middle">
				当前位置:<a href="admin/LinksServlet">友情链接管理</a>
			</td>
			<td width="50%" align="right" valign="middle">
				<a href="admin/linksAdd.jsp">新增</a>
			</td>
		</tr>
	</table>
	<hr/>
	<table width="100%" class="dataTable">
		<thead>
			<tr class="title">
				<td width="30%" height="24">链接名</td>
				<td width="40%" height="24">链接网址</td>
				<td width="30%" height="24">操作</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="item">
				<tr>
					<td height="20">${item.linkName}</td>
					<td height="20">${item.link}</td>
					<td height="20"><a class="layui-btn layui-btn-primary layui-btn-xs" href="admin/LinksInitEdit?linkID=${item.linkID}">编辑</a>
					<a class="layui-btn layui-btn-danger layui-btn-xs" href="admin/LinksDelete?linkID=${item.linkID}">删除</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<c:if test="${not empty pages}">
		<div class="page">${pages}</div>
	</c:if>
</body>
</html>