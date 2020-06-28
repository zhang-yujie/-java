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
				当前位置:<a href="admin/WebTtileInitEdit">网站标题设置</a> 
			</td>
			<td width="50%" align="right" valign="middle">
			</td>
		</tr>
	</table>
	<hr/>
	
	<form action="admin/WebTitleEdit" method="post">
		<input type="hidden" name="olderName" value="${title.webName}">
		<table width="100%">
			<tbody>
				<tr>
					<td width="30%" align="right">网站标题</td>
					<td><input type="text" name="name" value="${title.webName}" />
					</td>
				</tr>
				<tr>
					<td width="30%"></td>
					<td><input type="submit" value="提交"></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>