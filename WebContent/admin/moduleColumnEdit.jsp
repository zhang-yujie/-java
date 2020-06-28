<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="layui/css/layui.css" media="all">
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/page.css" rel="stylesheet"/>
<link href="css/common.css" rel="stylesheet"/>
<title>这里是标题</title>
<style type="text/css">
.formTable td{
	height: 30px;
	vertical-align: middle;
}
a{
color: #333;
text-decoration: none;
}
</style>
</head>
<body>
	<table width="100%">
		<tr>
			<td width="50%" align="left" valign="middle">
				当前位置:<a href="admin/CourseServlet">课程介绍管理</a> > <a style="color:red" href="admin/CourseInitEdit?courseTypeID=${news['introductionID']}">编辑内容</a>
			</td>
			<td width="50%" align="right" valign="middle">
				
			</td>
		</tr>
	</table>
	<hr/>
	
	<form action="admin/ModuleColumnEdit" method="post">
	
		<input type="hidden" name="newsID" value="${news['columnID']}">
		
		<table width="100%" class="formTable">
			<tbody>
				<tr>
					<td width="100px" align="right" valign="top"><font color="red">*</font>介绍内容</td>
					<td>
						<textarea name="content" style="width:100%;height:300px;resize:none;overflow: auto;">${news['content']}</textarea>
						<font color='red'>${contentMessage}</font>
					</td>
				</tr>
				
				<tr>
					<td width="100px"></td>
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