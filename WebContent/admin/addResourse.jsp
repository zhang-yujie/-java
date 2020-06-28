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
<title>Insert title here</title>
<link rel="stylesheet" href="layui/css/layui.css" media="all">
</head>
<body>
<table width="100%" style="font-size:16px;margin:20px 0px;">
			<tr>
				<td width="50%" align="left" valign="middle">
					当前位置:<a href="admin/CourseResourse">课程资源</a>&nbsp;>>&nbsp;新增
				</td>
			</tr>
</table>
<form class="layui-form" action="admin/AddResourseServlet" method="post">

  <div class="layui-form-item">
    <label class="layui-form-label">资源名称</label>
    <div class="layui-input-block">
      <input type="text" id="name" name="name" lay-verify="required"  autocomplete="off" class="layui-input" style="width:200px;">
    </div>
  </div>
	<div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
     
    </div>
  </div>
 </form>

</body>
</html>