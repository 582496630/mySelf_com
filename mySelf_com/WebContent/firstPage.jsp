<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到个人主页</title>
<script type="text/javascript"
	src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<link type="text/css" rel="stylesheet" href="css/loginCSS.css">
</head>
<body class="firstPageBody1">
	<div>
		<p>欢迎来到这，祝您今天心情愉快！</p>
		<p >
			可以点击 <a href="login/login.jsp" style="text-decoration:none;color: #8000ff;">登录</a>进入系统
		</p>
		<p>用户名：周游 密码：123456</p>
	</div>
	<div class="firstPageDiv2">
		<p id="p1"></p>
	</div>

	<%
		//response.setHeader("refresh", "1");
	%>

	<script type="text/javascript">
		//输出动态时间的方法
		function time() {
			//声明now对象，用于调用Date的方法
			var now = new Date();
			//因为now.getDay()输出是是int型数字，所以采用数组的方式
			var str = [ "日", "一", "二", "三", "四", "五", "六" ];
			var d = now.getDay();
             //通过JQuery来向页面写入时间
			$("#p1").html(
					now.getFullYear() + "年" + (now.getMonth() + 1) + "月"
							+ now.getDate() + "日" + "&nbsp;" + now.getHours()
							+ "时" + now.getMinutes() + "分" + now.getSeconds()
							+ "秒" + "<br/>" + "星期" + str[d]);
			window.setTimeout("time()", 1000);//每1秒 循环调用time()方法，让时间一直在走
		}
		window.onload = time;//应用time这个方法
	</script>
</body>
</html>