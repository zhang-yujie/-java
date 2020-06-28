<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="UTF-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>首页</title>
<link rel="stylesheet" type="text/css" href="css/initial.css">
<style type="text/css">
.table {
	margin-left: 10px;
	margin-top: 10px;
}

</style>
</head>
<body>
	<!-- 第一部分 -->
	<div class="top">
	<%
		List<Map<String,Object>> contents = (List<Map<String,Object>>)request.getAttribute("contents");
	%>
		<div class="sub1">
			<div class="subTop">
				<p><img  src="image/index/rectangle.png" class="img">&nbsp;<font class="font1">课程简介</font>&nbsp;<font class="font2">Introduce</font></p>
				<span class="line" style="top:-26px"></span>
			</div>
			<div class="subBottom">
				<table  class="table1">
					<tr>
						<td class="td1">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=contents.get(0).get("content") %>
						</td>
					</tr>
				</table>
				
			</div>
		</div>
		<div class="sub2">
			<div class="subTop_">
				<p style="position:relative;top:-5px"><img  src="image/index/rectangle.png" class="img">&nbsp;<font class="font1">课程负责人</font>&nbsp;<font  class="font2">Principal</font></p>
				<span class="line" style="top:-29px"></span>
			</div>
			<div class="subBottom_">
				<table class="table1">
					<tr>
						<td class="td1">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=contents.get(1).get("content") %>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<!-- 第二部分 -->
	<div class="middle">
		<div class="middleSub1">
			<div class="subTop1">
				<p style="position:relative;top:5px;"><img  src="image/index/rectangle2.png" class="img">&nbsp;<font class="font1">课程动态</font>&nbsp;<font  class="font2">Dynamic&nbsp;State</font>
				<a href="Index?actionType=newsTypeQuery&newsType=<%=21%>" style="text-decoration:none;"><font class="font3">More</font></a><span class="item arrow-right"></span></p>
				<span class="line" style="top:-18px"></span>
			</div>
			<!-- 课程动态 -->
			<div class="subBottom">
				<%
					List<Map<String,Object>> news = (List<Map<String,Object>>)request.getAttribute("news");
					int size = news.size();
				%>	
				<table class="table">
				<% 
				for(Map<String,Object> n:news){
				%>
				<tr>
					<td style="width:350px;">
						<img src="image/index/dynamicico.png">&nbsp;
						<a href="CourseDynamicDetail?newsID=<%= n.get("newsID")%>" style="text-decoration:none;color:black"><%=n.get("title") %></a>
					</td>
					<!-- 时间 -->
					<td >
						<%
							if(n.get("publishTime")!=null)
						{
						%>
							<%= n.get("publishTime") %>
						<%
						} 
						%>
					</td>	
				</tr>
				<%} %>
				</table>
				
				
			</div>
		</div>
		<div class="middleSub2">
			<div class="subTop2">
				<p style="position:relative; top:3px;"><img  src="image/index/rectangle2.png" class="img">&nbsp;<font class="font1">教学资源</font>&nbsp;<font  class="font2">Resource</font></p>
				<span class="line" style="top:-20px;"></span>
			</div>
			<!-- 课程资源 -->
			<div class="subBottom">
			<%
				List<Map<String,Object>> resourses = (List<Map<String,Object>>)request.getAttribute("resourses");
			%>
			<table class="table">
			<tr>
			
					<td style="text-align:center;width:100px;padding:0px 20px;">
					
					<a href="CourseResourseServlet?id=<%= resourses.get(0).get("type")%>"><img src="image/index/1.png" style="width:150px;height:150px;"></a>
					<%-- <img alt="" src="LoadImage?fileName=<%= resourse.get(i).get("img")%>&type=resourse" style="width:150px;height:150px;"/> --%>
					<%-- <a href="<%=resourse.get(i).get("resourse")%>" download="<%=resourse.get(i).get("resourse") %>" style="text-decoration:none"><%=resourse.get(i).get("name") %></a> --%>
					</td>
					<td>
						<a href="CourseResourseServlet?id=<%= resourses.get(1).get("type")%>"><img src="image/index/2.png" style="width:150px;height:150px;"></a>
					</td>
			
			</tr>
			</table>
			</div>
		</div>
	</div>
	<!-- 第三部分,放轮播图 -->
	<div class="bottom">
		<div style="width:100%;height:17%">
			<p style="position:relative;top:-15px"><img  src="image/index/rectangle.png" class="img">&nbsp;<font class="font1">课程组成员</font>&nbsp;<font  class="font2">Menbers</font></p>
			<span class="line" style="top:-35px;"></span>
		</div>
		<!-- 放轮播图 -->
		<div style="width:100%;height:83%;position:relative;top:-20px">
			<div class="container">
            	<%
            	List<Map<String,Object>> pictures = (List<Map<String,Object>>)request.getAttribute("pictures");
            	%>
            	<div class="wrap" style="left:0px;">
            	<%for(Map<String,Object> picture:pictures) {
            	System.out.println(picture.get("photo"));
            	%>
            		<img alt="" src="LoadImage?fileName=<%= picture.get("photo")%>&type=CourseMemerPicture" style="width:145px;height:200px;"/>
            	<%} %>
            	</div>
          
            	
        	</div>
			<!-- 左箭头 -->
            	<a href="javascript:;" class="arrow arrow_left"><img src="image/index/left.png"></a><!-- href="javascript:;"代表将a标签作为按钮使用不跳转页面 -->
            	<!-- 右箭头 -->
            	<a href="javascript:;" class="arrow arrow_right"><img src="image/index/right.png"></a>
		</div>
	</div>
	<!-- 第四部分 -->
	<div class="last"> 
		<p><img  src="image/index/link.png" class="img2">&nbsp;&nbsp;友情链接：&nbsp;&nbsp;
		<%
		List<Map<String,Object>> links = (List<Map<String,Object>>)request.getAttribute("links");
		
		for(Map<String,Object> link:links){ %>
		<a href="<%=link.get("link")%>"><%=link.get("linkName") %></a>&nbsp;&nbsp;&nbsp;&nbsp;
		<%} %>
		<!-- <a href="http://www.baidu.com">百度</a></p> -->
	</div>
<script>
var wrap = document.querySelector(".wrap");
var next = document.querySelector(".arrow_right");
var prev = document.querySelector(".arrow_left");
/* 进行手动轮播*/
// 点击左箭头
next.onclick = function () {
    next_pic();
}
// 点击右箭头
prev.onclick = function () {
    prev_pic();
}
// 点击右箭头执行的方法
function next_pic () {
    var newLeft;
    var value = -145*(<%=pictures.size()-6%>);
    var v = value.toString()+"px";
    if(wrap.style.left === "-145px"){
        newLeft = 0;
    }else{
        wrap.style.transition='left 2s'; /** 让图像缓慢移动 */
        newLeft = parseInt(wrap.style.left)-145;
    }
    wrap.style.left = newLeft + "px";
}
// 点击左箭头执行的方法
function prev_pic () {
    var newLeft;
    if(wrap.style.left === "0px"){
        newLeft = -145*(<%=pictures.size()-6%>);
    }else{
        newLeft = parseInt(wrap.style.left)+145;
    }
    wrap.style.left = newLeft + "px";
}
/* 进行自动轮播 */
var timer = null;
function autoPlay() {
    timer = setInterval(function(){next_pic()},4000);//设置每张图片自动播放的时间
}
autoPlay();
/* 停止自动轮播 */
var container = document.querySelector(".container");
container.onmouseenter = function () {
    clearInterval(timer);//当鼠标在箭头上 停止自动轮播
}
container.onmouseleave = function () {
    autoPlay(); //当鼠标离开箭头  开始自动轮播
}


</script>

</body>


</html>