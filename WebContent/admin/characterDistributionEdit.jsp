<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String type = request.getAttribute("type").toString();
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
				当前位置:<a href="admin/CharacterDistribution">角色分配</a> > <a href="admin/CharacterDistributionInitEdit?id=${operator['operatorID']}">编辑用户角色</a>
			</td>
			<td width="50%" align="right" valign="middle">
			</td>
		</tr>
	</table>
	<hr/>
	
	<form action="admin/CharacterDistributionEdit" method="post">
		<input type="hidden" value="${operator['operatorID']}" name="operatorID">
		<table width="100%" class="formTable" border="0">
			<tbody>

					<tr>
					<td width="150" align="right">角色类型</td>
					<td width="350">
						<c:set value="${operator['type']}" var="type"></c:set>
						<c:forEach items="${operatorTypeList}" var="item" varStatus="status">
							<c:if test="${item['operatorTypeID'] == type}">
								<input type="radio" name="type" value="${item['operatorTypeID']}" id="type${status.count}" checked="checked"/><label for="type${status.count}">${item['name']}</label>
							</c:if>
							<c:if test="${item['operatorTypeID'] != type}">
								<input type="radio" name="type" value="${item['operatorTypeID']}" id="type${status.count}"/><label for="type${status.count}">${item['name']}</label>
							</c:if>
							
						</c:forEach>
					</td>
				</tr>
				

				
				<tr>
					<td width="150"></td>
					<td width="350">
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