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
<style type="text/css">
.formTable td{
	height: 30px;
	vertical-align: middle;
}

</style>
</head>
<body>
	<table width="100%">
		<tr>
			<td width="50%" align="left" valign="middle">
				当前位置:<a href="admin/TeacherTeamServlet">教师团队管理</a> > <a href="/admin/TeacherTeamAdd.jsp">新增教师</a>
			</td>
			<td width="50%" align="right" valign="middle">
				
			</td>
		</tr>
	</table>
	<hr/>
	
	<form action="admin/TeacherTeamAdd" method="post">
		<table width="100%" class="formTable">
			<tbody>
				<tr>
					<td width="30%" align="right"><font color="red">*</font>姓名</td>
					<td>
						<input type="text" name="name" value="${name}"/>
						<c:if test="${not empty nameMessage}">
							<font color="red">${nameMessage}</font>
						</c:if>
					</td>
				</tr>
				
			
				
				<tr>
					<td width="30%" align="right"><font color="red">*</font>教龄</td>
					<td>
						<input type="number" name="teacherAge" value="${teacherAge}"/>
						<c:if test="${not empty accountMessage}">
							<font color="red">${accountMessage}</font>
						</c:if>
					</td>
				</tr>
				
				<tr>
					<td width="30%" align="right">介绍</td>
					<td>
						<textarea style="width:100%;height:300px;resize:none;overflow: auto;" name="content">${content}</textarea>
						<font color='red'>${contentMessage}</font>
					</td>
				</tr>
				
				<tr>
					<td width="30%" align="right">职称</td>
					<td>
						<input type="text" name="titleType">
					</td>
				</tr>
				
				<tr>
					<td width="30%" align="right">学院</td>
					<td>
						<input type="text" name="collega">
					</td>
				</tr>
			
				
				<tr>
					<td width="30%"></td>
					<td>
						<input type="submit" value="提交">
						<c:if test="${not empty addMessage}">
							<font color="red">${addMessage}</font>
						</c:if>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>