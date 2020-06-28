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
<link rel="stylesheet" href="layui/css/layui.css"  media="all">
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
	
	<form action="admin/CourseEdit" method="post">
	
		<input type="hidden" name="newsID" value="${news['introductionID']}">
		
		<table width="100%" class="formTable">
			<tbody>
				<tr>
					<td width="100px" align="right" valign="top"><font color="red">*</font>介绍内容</td>
					<td>
					<textarea class="layui-textarea" id="LAY_demo1" style="display: none" name="content">  
  						${news['content']}
					</textarea>
						
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
<script src="layui/layui.js" charset="utf-8"></script>
<script>
layui.use('layedit', function(){
  var layedit = layui.layedit
  ,$ = layui.jquery;
  
  //构建一个默认的编辑器
  var index = layedit.build('LAY_demo1');
  
  //编辑器外部操作
  var active = {
    content: function(){
      alert(layedit.getContent(index)); //获取编辑器内容
    }
    ,text: function(){
      alert(layedit.getText(index)); //获取编辑器纯文本内容
    }
    ,selection: function(){
      alert(layedit.getSelection(index));
    }
  };
  
  $('.site-demo-layedit').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
  
  //自定义工具栏
  layedit.build('LAY_demo2', {
    tool: ['face', 'link', 'unlink', '|', 'left', 'center', 'right']
    ,height: 100
  })
});
</script>
</html>