<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style>
.center {
    margin: 30px auto;
    width: 1000px;
    height: 100%;
}

</style>
<link rel="stylesheet" href="../layui/css/layui.css" media="all">
</head>
<body>
<div class="center">
<table width="100%" style="font-size:16px;margin:20px 0px;">
			<tr>
				<td width="50%" align="left" valign="middle">
					当前位置:<a href="MessageManagement">留言管理</a>&nbsp;>>&nbsp;新增
				</td>
			</tr>
</table>
<% %>
<form class="layui-form" action="AddMessageServlet" method="post">
  <div class="layui-form-item">
    <label class="layui-form-label">qq</label>
    <div class="layui-input-block">
      <input type="text" name="qq" lay-verify="required" lay-reqtext="qq是必填项，岂能为空？" placeholder="请输入qq" autocomplete="off" class="layui-input" style="width:200px;">
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">问题</label>
    <div class="layui-input-block">
      <textarea name="question" id="question"  style="display: none;" class="layui-textarea"></textarea>
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">回答</label>
    <div class="layui-input-block">
      <textarea name="answer" id="answer" style="display: none;" class="layui-textarea"></textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">时间</label>
    <div class="layui-input-block">
      <p><input type="text" name="time" lay-verify="pass" placeholder="格式为:2014-01-15 00:20:17" autocomplete="off" class="layui-input" style="width:200px;">
    </p>
    </div>
  </div>
   <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn"  lay-submit="" lay-filter="demo1">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
  </form>
</div>
<!-- 审核 -->

<script src="../layui/layui.js" charset="utf-8"></script>
<script>
layui.use('layedit', function(){
	  var layedit = layui.layedit
	  ,$ = layui.jquery;
	  
	  //构建一个默认的编辑器
	  var index = layedit.build('question',{height: 130});
	  
	  //编辑器外部操作
	  var active = {
		  question: function(){
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