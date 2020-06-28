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
<title>新闻列表</title>
<link href="css/page.css" rel="stylesheet"/>
<link href="css/common.css" rel="stylesheet"/>
 <link rel="stylesheet" href="layui/css/layui.css"  media="all">
 <style>
 table{
 overflow: hidden;
text-overflow:ellipsis;
white-space: nowrap;
 }
 </style>
</head>
<%HttpSession sessions = request.getSession();
String operateType = (String)sessions.getAttribute("operateType");
 %>
<body>
	<table width="100%">
		<tr>
			<td width="50%" align="left" valign="middle">
			<%if(operateType.equals("1")){ %>
				当前位置:<a href="admin/NewsServlet">文章管理</a>
				<%} else{%>
				当前位置:<a href="admin/NewsExaminationServlet">文章审核</a>
				<%} %>
				
			</td>
			<td align="right">
				<a href="admin/NewsInitAdd">新增</a>
			</td>
		</tr>
	</table>
	<hr>
	<form 
	<%if(operateType.equals("1")){ %>
	action="admin/NewsServlet"
	<%}else{ %>
	action="admin/NewsExaminationServlet"<%} %>
	 method="post">
		<div class="layui-form-item" style="padding-left:0;margin-left:0;">
			<label class="layui-form-label" style="padding-left:0;margin-left:0;text-align: left;padding-right:1px;width:60px">文章查询</label>
			<div class="layui-input-inline">
				<input type="text" name="querytitle" value="${querytitle}" lay-verify="required"
					placeholder="请输入" autocomplete="off" class="layui-input">
			</div>
			<input style="margin-top:5px" class="layui-btn  layui-btn-normal  layui-btn-sm" type="submit" value="查询"/>
		</div>

		<%-- <p>
			新闻标题:<input type="text" name="querytitle" value="${querytitle}"/> 
		</p> --%>
	</form>
	
	<!-- <table width="100%" class="dataTable"> -->
	<table class="layui-table" lay-even="" lay-skin="row">
		<colgroup>
			<col width="150">
			<col width="150">
			<col width="130">
			
		</colgroup>
		<thead>
			<tr>
				<th>新闻标题</th>
				<th>类型</th>
				<th>发布时间</th>
				<th>截至时间</th>
				<th>发布人</th>
				<th>浏览次数</th>
				<th>操作</th>
			</tr>
		</thead>
		<!-- <thead>
			<tr class="title">
				<td>新闻标题</td>
				<td width="100">类型</td>
				<td width="100" align="center">发布时间</td>
				<td width="100" align="center">截至时间</td>
				<td width="90" align="center">发布人</td>
				<td width="90" align="right">浏览次数</td>
				<td width="90" align="center">状态</td>
				<td width="270">操作</td>
			</tr>
		</thead> -->
		<tbody>
			<c:forEach items="${list}" var="item">
				<tr >
					<td style="width:50px">${item.title}</td>
					<td>${item.typeName}</td>
					<td >${item.publishTime}</td>
					<td >${item.deadLine }</td>
					<td >${item.operatorName}</td>
					<td >${item.count}</td>
					<td>${item.operate}</td>
				</tr>
			</c:forEach>
			<input type="hidden" name="operateType" value="${operateType}">
		</tbody>
	</table>
	<c:if test="${not empty paginationHtml}">
		<div class="page">${paginationHtml}</div>
	</c:if>
</body>
</html>