<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="UpdateResourseServlet" method="post">
		<input type="hidden" value="${source['id']}" name="sourseID">
		<table width="100%" class="formTable" border="0">
			<tbody>
				<tr>
					<td width="150" align="right"><font color="red">*</font>姓名</td>
					<td width="350">
						<input type="text" name="name" value="${source['name']}"/>
						
					</td>
					
					<td rowspan="6" valign="top" style="margin: 0;padding:0;">
						<div style="width:100%;height:220px; position: relative;overflow: atuo;">
							<iframe src="sourceImgUpload.jsp?operatorID=${source['id']}&photo=${source['img']}" border="0" frameborder="0" style="height: 200px;"></iframe>
						</div>
					</td>
					
				</tr>
				<tr>
				<!-- 上传文件 -->
					<td width="150" align="right"><font color="red">*</font>课件</td>
					<td>
						<input type="file" id="resourse" name="resourse"/>
						
						 
					</td>
				</tr>
				<tr>
					<td width="150"></td>
					<td width="350">
						<input type="submit" onclick="return myFunction()" value="提交">
						
					</td>
				</tr>
			</tbody>
		</table>
	</form>
<script>
function myFunction()
{
	var value = document.getElementById('resourse').files[0].name;
	document.getElementById('resourse').value=value;
	alert(document.getElementById('resourse').files[0].name);
	return true;
}
</script>
</body>
</html>