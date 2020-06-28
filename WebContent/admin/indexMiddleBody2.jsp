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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="layui/css/layui.css" media="all">
<style type="text/css">
.time_display {
	height: 30px;
	background-color: #edfafe;
	margin: 0px;
}

.right {
	background-color: #47a8d0;
}
</style>
<title>Insert title here</title>
</head>

<body>
	<div class="right" frameborder="0" scrolling="no"
		style="margin: 0px auto; height: 600px; width:14.6%; -ms-overflow-y: hidden; -ms-overflow-x: hidden; float:left">
		<div>
			<p class="time_display">
				<img src="image/index/time.png" style="width:30px">
			</p>
		</div>
		<!-- 导航栏 -->
		<nav class="" role="navigation">
		<ul class="layui-nav layui-nav-tree layui-inline" lay-filter="demo"
			style="margin-right: 10px;">
			<li class="layui-nav-item layui-nav-itemed"><a
				href="javascript:;">网站内容管理</a>
				<dl class="layui-nav-child">
				<c:forEach items="${list}" var="item">
					<c:if test="${item.moduleID == 1}">
						<dd>
							<a href="admin/MessageManagement" target="innerFrame">留言管理</a>
						</dd>
					</c:if>
				</c:forEach>
				
				<c:forEach items="${list}" var="item">
					<c:if test="${item.moduleID == 2}">
						<dd>
						<a href="admin/ModuleNewsTypeServlet?action=1" target="innerFrame">文章管理</a>
					</dd>
					</c:if>
				</c:forEach>
				
				<c:forEach items="${list}" var="item">
					<c:if test="${item.moduleID == 3}">
						<dd>
						<a href="admin/ModuleNewsTypeServlet?action=2" target="innerFrame">审核文章</a>
					</dd>
					</c:if>
				</c:forEach>	
					
				<c:forEach items="${list}" var="item">
					<c:if test="${item.moduleID == 4}">
						<dd>
						<a href="test222" target="innerFrame">栏目管理</a>
					</dd>
					</c:if>
				</c:forEach>	
					
					
				</dl></li>
			<li class="layui-nav-item"><a href="javascript:;">系统设置</a>
				<dl class="layui-nav-child">
					<c:forEach items="${list}" var="item">
						<c:if test="${item.moduleID == 5}">
							<dd>
								<a href="admin/CharacterFunctionsServlet" target="innerFrame">权限管理</a>
							</dd>
						</c:if>
					</c:forEach>

					<c:forEach items="${list}" var="item">
						<c:if test="${item.moduleID == 6}">
							<dd>
								<a href="admin/ColumnNameManageServlet" target="innerFrame">模块管理</a>
							</dd>
						</c:if>
					</c:forEach>

					
					<c:forEach items="${list}" var="item">
						<c:if test="${item.moduleID == 7}">
							<dd>
						<a href="admin/CharacterDistribution" target="innerFrame">角色分配</a>
					</dd>
						</c:if>
					</c:forEach>

					<c:forEach items="${list}" var="item">
						<c:if test="${item.moduleID == 8}">
							<dd>
								<a href="admin/OperatorServlet" target="innerFrame">人员管理</a>
							</dd>
						</c:if>
					</c:forEach>

					<c:forEach items="${list}" var="item">
						<c:if test="${item.moduleID == 9}">

							<dd>
								<a href="admin/OperatorTypeServlet" target="innerFrame">角色管理</a>
							</dd>
						</c:if>
					</c:forEach>

					<c:forEach items="${list}" var="item">
						<c:if test="${item.moduleID == 10}">

							<dd>
								<a href="admin/rowNumberList.jsp" target="innerFrame">默认功能设置</a>
							</dd>
						</c:if>
					</c:forEach>

					<c:forEach items="${list}" var="item">
						<c:if test="${item.moduleID == 11}">
							<dd>
								<a href="admin/IndexInformationList.jsp" target="innerFrame">首页信息设置</a>
							</dd>
						</c:if>
					</c:forEach>
				</dl></li>
		</ul>
	</div>
	<div >
				<iframe src="admin/welcome.jsp" class="innerFrame" name="innerFrame"
					frameborder="0" scrolling="no"
			style="margin: 0px auto; height:700px; width:1166px;-ms-overflow-y: hidden; -ms-overflow-x: hidden; "></iframe>
			</div>
</body>

<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
	layui.use('element', function() {
		var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

		//监听导航点击
		element.on('nav(demo)', function(elem) {
			//console.log(elem)
			layer.msg(elem.text());
		});
	});
</script>

</html>