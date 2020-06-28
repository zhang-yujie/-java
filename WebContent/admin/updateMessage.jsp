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

.layui-layedit-iframe iframe{display:block;width:100%;height:130px;}

</style>
<link rel="stylesheet" href="layui/css/layui.css" media="all">
</head>
<body>
<div class="center">
<table width="100%" style="font-size:16px;margin:20px 0px;">
			<tr>
				<td width="50%" align="left" valign="middle">
					当前位置:<a href="admin/MessageManagement">留言管理</a>&nbsp;>>&nbsp;修改
				</td>
			</tr>
</table>
<%
	Map<String,Object> curUser = (Map<String,Object>)request.getAttribute("curUser");
	
%>
<form class="layui-form" action="admin/UpdateMessageServlet" method="post">
<input name="questionID" type="hidden" value=<%=curUser.get("questionID") %>>
  <div class="layui-form-item">
    <label class="layui-form-label">qq</label>
    <div class="layui-input-block">
      <input type="text" id="qq" name="qq" lay-verify="required" value="<%=curUser.get("id") %>"  autocomplete="off" class="layui-input" style="width:200px;">
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">问题</label>
    <div class="layui-input-block">
    <textarea class="layui-textarea" id="ques"  name="question"> <%=curUser.get("question") %></textarea>

    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">回答</label>
    <div class="layui-input-block">
      <textarea name="answer" id="answer" style="display: none;height:160px;" class="layui-textarea"><%=curUser.get("answer") %></textarea>
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
      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
     
    </div>
  </div>
  </form>
</div>
<script>
document.getElementById("qq").readOnly = true;
document.getElementById("ques").readOnly = true;
</script>
<script src="layui/layui.js" charset="utf-8"></script>
<script>

layui.use('layedit', function(){
	  var layedit = layui.layedit
	  ,$ = layui.jquery;
	  
	  //构建一个默认的编辑器
	  var index = layedit.build('answer',{height: 130});
	  
	  //编辑器外部操作
	  var active = {
		  answer: function(){
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

</body>
</html>