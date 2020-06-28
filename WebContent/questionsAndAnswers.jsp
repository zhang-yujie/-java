<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<link rel="stylesheet" href="layui/css/layui.css" media="all">
<link href="css/page.css" rel="stylesheet"/>
<title>My JSP 'questionsAndAnswers.jsp' starting page</title>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<style>
.round_icon{
width: 34px;
  height: 34px;
  display: flex;
  border-radius: 50%;
  align-items: center;
  justify-content: center;
  overflow: hidden;
  margin:10px;
  margin-left:20px;
  
  }
  .comments{
 padding-top:30px;
  }
  .comments div{
  
         /*    color: white; */
            float: left;
            
            align-items: center;
  }
  .juli1{
  padding-left: 5px;
font-weight: bold;

  }
.message{
margin: 14px 0px 0px 15px;
height: 24px;
line-height: 24px;
font-size: 0.875em;
border-bottom: 1px dashed #C1B7A9;
}
.comment-time{
color: #885621;
display: inline;
font-size: 12px;
padding-left: 550px;
}
.comment-content{
font-size: 14px;
font-family: 宋体;
color: #333;
line-height: 1.5;
margin-top:15px;
margin-bottom:20px;
}
.comment-answer{
width: 95%;
margin: auto;
clear: both;
border: none;
padding-left: 40px;
}
.message{
width:758px;
margin: 14px 0px 0px 15px;
height: 24px;
line-height: 24px;
font-size: 0.875em;
border-bottom: 1px dashed #C1B7A9;
}
.juli2{
padding-left: 6px;
font-weight: bold;
}
.vp{
background-position: -494px -3px;
width: 16px;
height: 16px;
margin-bottom: -3px;
}
.vp, .vip, .vip1, .vip2, .vip3, .vip4, .vip5, .vip6, .vip7 {
    background: url("http://www.rainfly.cn/content/plugins/get_useragent/images/vip.png") no-repeat;
        background-position-x: 0%;
        background-position-y: 0%;
    display: inline-block;
    overflow: hidden;
    border: none;
}
a, a:hover {
    text-decoration: none;
}
.answer{
float: left;
width: 94%;
margin: 0px;

}
.comment-header{
margin: 20px 0px 10px 40px;
}

input{
margin:10px;
padding: 5px 5px;
border: 1px #b6b6b6 solid;
font-size: 12px;
color: #333;
width: 20%;
background: #f7f6f4;
}
small{
font-size: 12px;
color: #999;}
</style>
</head>
<body>
	
	<div class="comment-header">
		<img src="http://www.rainfly.cn/content/templates/bowen-em/images/plun.png">
	</div>
	<div>
		<c:forEach items="${list}" var="item">
			<div class="comments">
				<div style="width:6%;">
					<img alt="" src="${item.avatar}" class="round_icon">
				</div>

				<div style="width:80%" class="message">
					<span class="juli1">
						<span style="color:#C86A69;">${item.name}</span>
					</span>
					<span class="comment-time">${item.time}</span>
				</div>

				<div style="width:94%">
					<div class="comment-content">${item.question }</div>
				</div>

				<c:if test="${item.status > 1}">
					<div class="comment-answer">
						<div style="width:6%;margin-left:30px,float:left">
							<img alt=""
								src="image/head/4.png"
								class="round_icon">
						</div>
						
						<div class="message" >
							<span class="juli2"> 管理员 <a class="vp" title="管理员认证"></a>
							</span>
							<span class="comment-time">2019-6-23 23:17:06</span>
						</div>
						
						<div style="width:94%" class="answer">
							<div class="comment-content">${item.answer }</div>
						</div>
					</div>
				</c:if>
			</div>
		</c:forEach>
		<div class="comments">
			<c:if test="${not empty paginationHtml}">
				<div class="page" style="margin-left:370px">${paginationHtml}</div>
			</c:if>
		</div>
	</div>
	
	<div class="comment-header">
		<img src="http://www.rainfly.cn/content/templates/bowen-em/images/plunxia.png">
	</div>
	<div class="comment-header">
		
	<img src="http://www.rainfly.cn/content/templates/bowen-em/images/bi.png">
		<a title="我相信你有更好的见解">
		<strong>发表你的评论</strong>
			<!-- <img src="http://www.rainfly.cn/content/templates/bowen-em/images/fbpl1.png"> -->
		</a>
	</div>
	
	<div class="comment-header">
		<img alt="" src="${qq.avatar}" id="touxiang">
		<form action="CommentSubmit" method="post" onsubmit="return validateForm()" name="myForm">

			<p>
			<input type="text" name="qqID" id="qqID" value="${qq.id}" placeholder="请输入你的qq号">
			<button type="button" onclick="getData()">qq游客评论</button>
			</p>
		
			<p><input type="text" name="qqname" id="qqName" value="${qq.name}" placeholder="昵称">
			<small>昵称(
			<strong><span style="color:#E53333;">必填</span></strong>
			)
			</small>
			
			
			</p>
			<p><textarea class="layui-textarea" id="LAY_demo1" style="display: none;width:90%" name="content" ></textarea></p>
						
			<p><input type="submit" value="提交"></p>
					
				
		</form>
	</div>


</body>

<script>
	function getData() {
		var id = document.getElementById("qqID").value;
		if(id == "")
			alert("您尚未输号码");
		else {
			 var reg = new RegExp("^[0-9]*$");
			 if(!reg.test(id) || id.length > 10 || id.length < 5)
			 	alert("您输入的qq号码有误");
			 else{
			 	ajaxFun();
			 }
		}
	}

	function ajaxFun() {
		console.log("点击ajax函数");
		var qq =  document.getElementById("qqID").value;
		var dates = {id: qq};
		$.ajax({
			type : "POST", //传数据的方式
			url : "testAjax", //servlet地址
			 dataType: "json",
			data : dates, //传的数据  form表单 里面的数据
			success: function (msg) {
			$("#qqID").val(msg.id);
			$("#qqName").val(msg.name);
			$("#touxiang").attr('src',msg.avatar); 
            }
		});
	}


	function validateForm() {
		var x =document.getElementById("content").value;
		if ( x == "") {
			alert("内容不能为空");
			return false;
		}
		return true;
	}
</script>
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
