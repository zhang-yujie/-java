<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style>
.box{
display: flex;
flex-direction: row;
flex-wrap: wrap;
align-items:flex-end;
}
</style>
</head>
<body>
	<p>当前位置：课题组成员</p>
	<button onclick="javascript:return deleteInfo()">全部删除</button>
	<div style="width:1100px" class = "box">
		<c:forEach items="${list}" var="item">
		<div style="width:100px;height:100px;margin:4px"><img alt=""
			src="LoadImage?fileName=${item.photo}&type=cgm"
			style="width:100px;" />
			<input type="checkbox" name="photo" value="${item.photo}" />
			</div>
	</c:forEach>
	</div>
</body>

<script language="javaScript">
		function deleteInfo() {
			var msg = "您真的确定要删除吗？\n\n请确认！";
			if (confirm(msg) == true) {
				var id = document.getElementsByName('photo');
				var value = new Array();
				for (var i = 0; i < id.length; i++) {
					if (id[i].checked)
						value.push(id[i].value);
				}
				var a = value.toString();
				if(a == "") 
					alert("\n       您尚未选择删除数据!");
				else
					 window.location.href = "admin/CGMPhotoDelete?id=" + a; 

				return true;
			} else {
				return false;
			}
	
		}
	</script>
</html>