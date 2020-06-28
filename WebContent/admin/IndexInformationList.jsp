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
				当前位置:<a href="admin/IndexInformationList">首页信息管理</a>
			</td>
		</tr>
	</table>
	<hr/>
	<table width="100%" class="dataTable">
		<thead>
			<tr class="title">
				<td width="30%" height="24">信息</td>
				<td  height="24">操作</td>
			</tr>
		</thead>
	
			<tr>
				<td>网站标题设置</td>
				<td height="20"><a class="layui-btn layui-btn-primary layui-btn-xs" href="admin/WebTitleInitEdit">编辑</a></td>
			</tr>	
			<tr>
				<td>友情链接设置</td>
				<td>
				<a class="layui-btn layui-btn-primary layui-btn-xs" href="admin/LinksServlet">编辑</a>
				</td>
			</tr>
			
		
	</table>
</body>
</html>