<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="layui/css/layui.css" media="all">
<link href="css/page.css" rel="stylesheet"/>
<title>Insert title here</title>
<style type="text/css">
.center {
	margin: auto;
	width: 1000px;
	height: 100%;
}

.tb {
	height: 550px;
}
</style>
</head>
<body>
<div class="center">
	<div style="margin:20px 0px;">
		<table width="100%" style="font-size:15px;">
			<tr>
				<td width="50%" align="left" valign="middle">
					当前位置:<a href="admin/CourseResourse">课程资源管理</a>
				</td>
				<td width="50%" align="right" valign="middle" ><a style="margin-right:50px;" class="layui-btn layui-btn-xs" lay-event="add" href="admin/addResourse.jsp">新增</a></td>
			</tr>
		</table>
	</div>
	
	<div>
	<%
		List<Map<String,Object>> list = (List<Map<String,Object>>)request.getAttribute("list");
	System.out.println(list.size());
	%>
	<table class="layui-table" lay-even="" lay-skin="row">
		<colgroup>
			<col width="150">
			<col width="150">
			<col width="130">
			
		</colgroup>
		<thead>
			<tr >
				<th>资源ID</th>
				<th>资源名称</th>
				
				<th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}">操作</th>
			</tr>
		</thead>
		<tbody>
			
			<%for(Map<String,Object> l : list){ %>
			<tr>
				<td><%=l.get("id") %></td>
				<td><%=l.get("name") %></td>	
				<td>
  					<a class="layui-btn layui-btn-xs" lay-event="edit" href="admin/UpdateResourseServlet?id=<%=l.get("id")%>">编辑</a>
  					<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" href="admin/DeleteResourseServlet?id=<%=l.get("id")%>">删除</a>
				</td>
			</tr>
			<%} %>
	
		</tbody>
		
	</table>
	<%-- <c:if test="${not empty paginationHtml}">
	
		<div class="page">${paginationHtml}</div>
	</c:if> --%>
	</div>
</div>
</body>
</html>