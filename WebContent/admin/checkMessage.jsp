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
<style>
.center {
    margin: 30px auto;
    width: 1000px;
    height: 100%;
}

</style>
<link rel="stylesheet" href="layui/css/layui.css" media="all">
</head>
<body>
<div class="center">
<table width="100%" style="font-size:16px;margin:20px 0px;">
			<tr>
				<td width="50%" align="left" valign="middle">
					当前位置:<a href="admin/MessageManagement">留言管理</a>&nbsp;>>&nbsp;查看
				</td>
			</tr>
</table>
<%
	Map<String,Object> curUser = (Map<String,Object>)request.getAttribute("curUser");
%>
<form class="layui-form" action="admin/MessageManagement" method="post">
  <div class="layui-form-item">
    <label class="layui-form-label">qq</label>
    <div class="layui-input-block">
      <input type="text" name="qq" id="qq" lay-verify="required" value="<%=curUser.get("id") %>"  autocomplete="off" class="layui-input" style="width:200px;">
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">问题</label>
    <div class="layui-input-block">
    	<%
    		String question = "";
    		if(curUser.get("question")!=null){
    			question = (String)curUser.get("question");
    		}
    	%>
      <textarea name="question" id="ques" class="layui-textarea"><%=question %></textarea>
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">回答</label>
    <div class="layui-input-block">
    	<%
    		String answer = "";
    		if(curUser.get("answer")!=null){
    			answer = (String)curUser.get("answer");
    		}
    	%>
      <textarea name="answer" id="ans"  class="layui-textarea"><%=answer %></textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">时间</label>
    <div class="layui-input-block">
    	<%Object time = null;
    	if(curUser.get("time")==null) {
					time = "";
					} else{
						time = curUser.get("time"); 
					} %>
      <p><input type="text" id="time" name="time" value="<%=time %>" class="layui-input" style="width:200px;">
    </p>
    </div>
  </div>
   <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" >确定</button>
    </div>
  </div>
  </form>
</div>
<script>
document.getElementById("qq").readOnly = true;
document.getElementById("ques").readOnly = true;
document.getElementById("ans").readOnly = true;
document.getElementById("time").readOnly = true;
</script>
</body>
</html>