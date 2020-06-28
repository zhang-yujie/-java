<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'courseTypeEdit.jsp' starting page</title>
 
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <table width="100%">
		<tr>
			<td width="50%" align="left" valign="middle">
				当前位置:<a href="admin/CourseTypeServlet">课程介绍模块管理</a> > <a href="admin/CourseTypeInitEdit?courseTypeID=${introductionType.introductionTypeID}">编辑课程介绍类型</a>
			</td>
			<td width="50%" align="right" valign="middle">
				
			</td>
		</tr>
	</table>
	<hr/>
	
	<form action="admin/CourseTypeEdit" method="post">
		<input type="hidden" name="operatorTypeID" value="${introductionType.introductionTypeID}"/>
		<input type="hidden" name="originalName" value="${introductionType.name}"/>
		<table width="100%">
			<tbody>
				<tr>
					<td width="30%" align="right">类型名称</td>
					<td>
						<input type="text" name="name" value="${introductionType.name}"/>
						<c:if test="${not empty errorMessage}">
							<font color="red">${errorMessage}</font>
						</c:if>
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
