<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
<title>后台登录界面</title>
<link rel="stylesheet" href="layui/css/layui.css" media="all">
<style>
.center {
	background: linear-gradient(#123969, #216bc3);
	height: 650px;
	width: 1360px;
	margin: auto;
}

.login {
	width: 500px;
	height: 300px;
	background: linear-gradient(#fafafb, #bfc5cd);
	margin: auto;
	position: relative;
	top: 170px;
	border-radius: 10px;
}

h1 {
	text-shadow: 5px 5px 5px grey;
}

.font1 {
    position: relative;
    top: 20px;
    left: 25px;
}

.font2 {
    position: relative;
    top: 20px;
    left: 24px;
    color: #123969;
}

#canvas{
        cursor:pointer;
}

.msg{
    position: relative;
    left: 200px;
    top: -23px;
}

</style>
</head>
<body>
	<div class="center">
		<div class="login">
			<p class="font1">
				<b>user Login</b>
			</p>
			<h1 class="font2">网站后台管理系统</h1>
			<form action="admin/AdminLogin" method="post">
			<div class="layui-form-item" style="position:relative;top:60px;left:50px;">
				<div class="layui-inline" style="height: 30px;">
					<label for="accountField" class="layui-form-label">用户名<i class="layui-icon">&#xe770;</i>:</label>
					<div class="layui-input-inline" style="height: 30px;">
					
						<input type="text" name="account" value="${account}" id="accountField" 
						placeholder="请输入用户名" lay-verify="required|phone" autocomplete="off" class="layui-input" style="height: 30px;">
						<font color="red" class="msg">${accountMessage}</font>
					
					</div>
				</div>
				<div class="layui-inline" style="height: 30px;">
					<label for="passwordField" class="layui-form-label">密码<i class="layui-icon">&#xe673;</i>:</label>
					<div class="layui-input-inline" style="height: 30px;">
					 <input type="password" name="password" placeholder="请输入密码" id="passwordField"
					 autocomplete="off" class="layui-input" style="height: 30px;">
					<font color="red" class="msg">${passwordMessage}</font>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label" style="height:30px;">验证码:</label>
					<div class="layui-input-inline" style="width: 70px;">
        				<input type="text" name="price_max" id="code" autocomplete="off" class="layui-input"
        				style="height: 30px;">
      				</div>
      				<canvas id="canvas" width="70px" height="30px"></canvas>
				</div>
			</div>
			<input onclick="javaScript:return checkCode()" type="submit" class="layui-btn layui-btn-normal" style="position:relative;top:40px;left:200px" value="登录">
		   </form>
		</div>

	</div>
	<script>
	/* 获取到用户输入的验证码 */
	
	var codeStr = "";
        //生成随机数

    function randomNum(min,max){
        return Math.floor(Math.random()*(max-min)+min);
    }
        //生成随机颜色RGB分量
    function randomColor(min,max){
        var _r = randomNum(min,max);
        var _g = randomNum(min,max);
        var _b = randomNum(min,max);
        return "rgb("+_r+","+_g+","+_b+")";
    }
    //先阻止画布默认点击发生的行为再执行drawPic()方法
    document.getElementById("canvas").onclick = function(e){
        e.preventDefault();
        drawPic();
    };
    function drawPic(){
        //获取到元素canvas
        var $canvas = document.getElementById("canvas");
        var _str = "0123456789";//设置随机数库
        var _picTxt = "";//随机数
        var _num = 4;//4个随机数字
        var _width = $canvas.width;
        var _height = $canvas.height;
        var ctx = $canvas.getContext("2d");//获取 context 对象
        ctx.textBaseline = "bottom";//文字上下对齐方式--底部对齐
        ctx.fillStyle = randomColor(180,240);//填充画布颜色
        ctx.fillRect(0,0,_width,_height);//填充矩形--画画
       
        codeStr = "";
        for(var i=0; i<_num; i++){
            var x = (_width-10)/_num*i+10;
            var y = randomNum(_height/2,_height);
            var deg = randomNum(-45,45);
            var txt = _str[randomNum(0,_str.length)];   //产生的随机数字
            codeStr+=txt;
            _picTxt += txt;//获取一个随机数
            ctx.fillStyle = randomColor(10,100);//填充随机颜色
            ctx.font = randomNum(20,24)+"px SimHei";//设置随机数大小，字体为SimHei
            ctx.translate(x,y);//将当前xy坐标作为原始坐标
            ctx.rotate(deg*Math.PI/150);//旋转随机角度
            ctx.fillText(txt, 0,0);//绘制填色的文本
            ctx.rotate(-deg*Math.PI/150);
            ctx.translate(-x,-y);
        }
        for(var i=0; i<_num; i++){
            //定义笔触颜色
            ctx.strokeStyle = randomColor(90,180);
            ctx.beginPath();
            //随机划线--4条路径
            ctx.moveTo(randomNum(0,_width), randomNum(0,_height));
            ctx.lineTo(randomNum(0,_width), randomNum(0,_height));
            ctx.stroke();
        }
        for(var i=0; i<_num*10; i++){
            ctx.fillStyle = randomColor(0,255);
            ctx.beginPath();
            //随机画原，填充颜色
            ctx.arc(randomNum(0,_width),randomNum(0,_height), 1, 0, 2*Math.PI);
            ctx.fill();
        }
        return _picTxt;//返回随机数字符串
    }
    drawPic();
    function checkCode(){
    	var code = document.getElementById("code").value;
    	if(code=="" || code==null){
    		alert("请输入验证码");
    		return false;
    	}
    	else{
    		if(code!=codeStr){
    			alert("验证码输入错误");
    			return false;
    		}
    	}
    	return true;
	}
</script>
</body>
</html>