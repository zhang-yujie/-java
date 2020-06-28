<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
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
.layui-table td{
white-space: nowrap;     
	overflow: hidden;
	text-overflow: ellipsis;
}

</style>
</head>
<body>
	<!-- 问答管理 -->
	<div class="center">
	<div style="margin:20px 0px;">
		<table width="100%" style="font-size:15px;">
			<tr>
				<td width="50%" align="left" valign="middle">
					当前位置:<a href="admin/MessageManagement">留言管理</a>
				</td>
				
			</tr>
		</table>
	</div>
	
	<div>
	<%
		List<Map<String,Object>> questions = (List<Map<String,Object>>)request.getAttribute("questions");
	%>
	<table class="layui-table" lay-even="" lay-skin="row" style="table-layout: fixed;
	">
		<colgroup>
			<col width="50">
			<col width="100">
			<col width="80">
			
		</colgroup>
		<thead>
			<tr >
				<th>ID</th>
				<th>qq</th>
				<th>昵称</th>
				<th>问题</th>
				<th>回答</th>
				<th>回答时间</th>
				<th>状态</th>
				<th lay-data="{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}">操作</th>
			</tr>
		</thead>
		<tbody>
			
			<%for(Map<String,Object> ques : questions){ %>
			<tr>
				<td><%=ques.get("questionID") %></td>
				<td><%=ques.get("id") %></td>	
				<td><%=ques.get("name") %></td>	
				<td>
					<%if(ques.get("question")==null) {%>
						
					<%} else{%>
						<%=ques.get("question") %>
					<%} %>	
				</td>
				<td>
					<%if(ques.get("answer")==null) {%>
						
					<%} else{%>
						<%=ques.get("answer") %>
					<%} %>
				</td>
				<td>
					<%if(ques.get("time")==null) {%>
						
					<%} else{%>
						<%=ques.get("time") %>
					<%} %>
				</td>
				<td>
					<%if((Integer)ques.get("status")==0) {%>
						待审核
					<%} else if((Integer)ques.get("status")==1){%>
						未回复
					<%} else{%>
						已回复
					<%} %>
				</td>
				<td>
					<%if((Integer)ques.get("status")==0) {%>
					<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" href="admin/CheckMessageServlet?id=<%=ques.get("questionID")%>">查看</a>
  					<a class="layui-btn layui-btn-xs" lay-event="edit" href="admin/PublishMessageServlet?id=<%=ques.get("questionID")%>">通过</a>
  					<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" href="admin/DeleteMessageServlet?id=<%=ques.get("questionID")%>">删除</a>
					<%}else{ %>
					<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" href="admin/CheckMessageServlet?id=<%=ques.get("questionID")%>">查看</a>
  					<a class="layui-btn layui-btn-xs" lay-event="edit" href="admin/UpdateMessageServlet?id=<%=ques.get("questionID")%>">编辑</a>
  					<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" href="admin/DeleteMessageServlet?id=<%=ques.get("questionID")%>">删除</a>
					<%} %>
					
				</td>
			</tr>
			<%} %>
	
		</tbody>
		
	</table>
	<c:if test="${not empty paginationHtml}">
	
		<div class="page">${paginationHtml}</div>
	</c:if>
	</div>
</div>
</body>

</html>