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
</head>
<body>
	<table width="100%">
		<tr>
			<td width="50%" align="left" valign="middle">
				当前位置:<a href="admin/LinksServlet">友情链接管理</a> > <a href="admin/LinksInitEdit?linkID=${link.linkID}">编辑友情链接</a>
			</td>
			<td width="50%" align="right" valign="middle">
				
			</td>
		</tr>
	</table>
	<hr/>
	
	<form action="admin/LinksEdit" method="post">
		<input type="hidden" name="linkID" value="${link.linkID}"/>
		<table width="100%">
			<tbody>
				<tr>
					<td width="30%" align="right">链接名称</td>
					<td><input type="text" name="name" value="${link.linkName}" />
					</td>
				</tr>
				<td width="30%" align="right">链接网址</td>
					<td><input type="text" name="link" value="${link.link}" />
					</td>
				<tr>
					<td width="30%"></td>
					<td><input type="submit" value="提交"></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>