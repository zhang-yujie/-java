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
<title>新闻列表</title>
<link href="css/page.css" rel="stylesheet"/>
<link href="css/common.css" rel="stylesheet"/>
 <link rel="stylesheet" href="layui/css/layui.css"  media="all">
 <style>
 table{
 overflow: hidden;
text-overflow:ellipsis;
white-space: nowrap;
 }
 </style>
</head>
<%HttpSession sessions = request.getSession();
String operateType = (String)sessions.getAttribute("operateType");


 %>
<body>
	<table width="100%">
		<tr>
			<td width="50%" align="left" valign="middle">
		
				当前位置:<a href="admin/NewsServlet">角色分配</a>			
			</td>
		</tr>
	</table>
	<hr>

	<!-- <table width="100%" class="dataTable"> -->
	<table class="layui-table" lay-even="" lay-skin="row">
		<colgroup>
			<col width="150">
			<col width="150">
			<col width="130">
			
		</colgroup>
		<thead>
			<tr>
				<th>姓名</th>
				<th>角色</th>
				<th>角色分配</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="item">
				<tr >
					<td style="width:50px">${item.operatorName}</td>
					<td>${item.operatortypeName}</td>
					<td ><a class="layui-btn layui-btn-xs" href="admin/CharacterDistributionInitEdit?id=${item.operatorID }">分配角色</a></td>
				</tr>
			</c:forEach>
			<input type="hidden" name="operateType" value="${operateType}">
		</tbody>
	</table>
	<c:if test="${not empty paginationHtml}">
		<div class="page">${paginationHtml}</div>
	</c:if>
</body>
</html>