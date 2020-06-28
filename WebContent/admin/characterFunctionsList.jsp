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
				当前位置:<a href="admin/CharacterFunctionsServlet">权限管理</a>
			</td>
			<td align="right">
			<a class="layui-btn layui-btn-normal" href="admin/PermissionServlet">文章权限管理</a>
			</td>
		</tr>
	</table>
	<hr>
	<form action="admin/CharacterFunctionsServlet" method="post">
		<p>
			用户名:<input type="text" name="name" value="${name}"/> <input type="submit" value="查询"/>
		</p>
	</form>
	
	<table width="100%" class="dataTable">
		<thead>
			<tr class="title">
				<td width="20%">姓名</td>
				<td>已分配权限</td>
				<td width="20%">操作</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="item">
				<tr>
					<td>${item.operatorType.name}</td>
					<td>
						<c:forEach items="${item.function}" var="permission" varStatus="status"><span>${permission.functionName}</span><c:if test="${status.last==false}">;</c:if></c:forEach>
					</td>
					<td>
						<a class="layui-btn layui-btn-xs" href="admin/characterFunctionsInitEdit?operatorTypeID=${item.operatorType.operatorTypeID}">权限分配</a> 
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