<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
	pageEncoding="UTF-8"%>
	<%@ page import="com.cqut.recruitPortal.dto.*" %>
<%@ page import="com.cqut.recruitPortal.entity.*" %>
<%@ page import="com.cqut.recruitPortal.servlet.SysUtil" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
<title>首页</title>
<style>
.box{
	display: flex;
	flex-direction:row;
	height:250px;
}
.passage {
    width: 585px;
    height: 250px;
    border-style: solid 1px lightgrey;
    margin-left: 10px;
    padding: 20px 0px;
}

.inform {
    width: 400px;
    height: 250px;
    background-color: yellow;
}

.bottom{
	width:1000px;
	height:450px;
	padding-left:10px;
	
	display: flex;
	flex-wrap:wrap;
	flex-direction:row;
}

/* .first{
	width:470px;
	height:225px;
	margin:5px 10px; 
} */

table{
	table-layout: fixed;
}

td{
	white-space: nowrap;     
	overflow: hidden;
	text-overflow: ellipsis;
}
.layui-card-header a:hover{
	color:white;
}

</style>

</head>
<body>
	<div class="box">
	<!-- 栏目 -->
	<%Map<String,Object> passage = (Map<String,Object>)request.getAttribute("passage"); %>
	<div class="passage" >
		<img alt="" src="image/index/research.jpg" style="float:left;height:150px;margin-left:10px">
		<div><p style="font-size:15px;padding-left:10px;"><%= passage.get("content")%></p></div>
	</div>
	<!-- 通知公告 -->
	<%
	List<NewsTypeNews> list = (List<NewsTypeNews>)request.getAttribute("list");
		NewsType inform = list.get(0).getNewsType();
	%>
	<div class="layui-col-md6" style="width:480px;padding:8px;">
      <div class="layui-card" style="height:100%">
        <div class="layui-card-header" style="background:linear-gradient(red,#FF5722);color:balck">
			
		<p class="newsType" style="font-size:17px"><%=inform.getName()%> <a href="Index?actionType=newsTypeQuery&newsType=<%=inform.getNewsTypeID()%>" style="color:balck">更多</a></p>
		</div>
        <div class="layui-card-body">
         	<table width="100%">
			<thead>
				<tr>
					<td width="60%">标题</td>
					<td width="40%">发布时间</td>
				</tr>
			</thead>
	<%
		Map<String,Object> map = list.get(0).getNews().get(0);
		
	%>
		<tr>
		<td><a href="Index?actionType=detail&newsID=<%=map.get("newsID")%>"><%=map.get("title")%></a></td>
		<td>
			<%
			if(map.get("publishTime")!=null)
			{
			%>
				<%=SysUtil.formatDate((Date)map.get("publishTime")) %>
			<%
			} 
			%>
		</td>
		</tr>

		</table>	
        </div>
      </div>
    </div>
   </div>
	
	<div class="bottom">
	<%
	
	int size = list.size();
	for(int i=1;i<size;i++){
		NewsType newsType = list.get(i).getNewsType();
	%>
	
	
	<div class="layui-col-md6" style="width:480px;height:225px;padding:8px;">
		 <div class="layui-card" style="height:100%">
		 <div class="layui-card-header" style="background:linear-gradient(red,#FF5722); color:balck">
			<p class="newsType" style="font-size:17px;"><%=newsType.getName()%> <a href="Index?actionType=newsTypeQuery&newsType=<%=newsType.getNewsTypeID()%>" style="color:balck">更多</a></p>
	     </div>
	     <div class="layui-card-body">
		   <table width="100%" >
			<thead>
				<tr>
					<td width="70%">标题</td>
					<td width="30%">发布时间</td>
				</tr>
			</thead>
	<%
		List<Map<String,Object>> listMap = list.get(i).getNews();
		for(Map<String,Object> news:listMap){
	%>
		<tr>
		<td><a href="Index?actionType=detail&newsID=<%=news.get("newsID")%>"><%=news.get("title")%></a></td>
		<td>
			<%
			if(news.get("publishTime")!=null)
			{
			%>
				<%=SysUtil.formatDate((Date)news.get("publishTime")) %>
			<%
			} 
			%>
		</td>
		</tr>
	<%
		}
	%>
		</table>
		</div>	
	</div>		
	</div>
	
	<%
	}
	%>
	
	</div>
</body>
</html>