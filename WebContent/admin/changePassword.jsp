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
				当前位置:<a href="admin/changePassword.jsp">修改密码</a> 
			</td>
			<td width="50%" align="right" valign="middle">
				
			</td>
		</tr>
	</table>
	<hr/>
	
	<form action="admin/ChangePassword" method="post">
		<table width="100%">
			<tbody>
				<tr>
					<td width="30%" align="right">密码</td>
					<td>
						<input type="text" name="password" "/>
						<c:if test="${not empty errorMessage}">
							<font color="red">${errorMessage}</font>
						</c:if>
					</td>
				</tr>
				<tr>
					<td width="30%" align="right">确认密码</td>
					<td>
						<input type="text" name="comfirmPassword" "/>
						
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