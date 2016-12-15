<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到个人主页</title>
<link type="text/css" rel="stylesheet" href="css/loginCSS.css">
</head>
<body class="beijing1">
	<div>
		<p>欢迎来到这，祝您今天心情愉快！今天是：</p>
		<span style="color: blue;"> <jsp:useBean id="date"
				class="java.util.Date" /> <fmt:formatDate value="${date}"
				pattern="yyyy/MM/dd  HH:mm:ss" />
		</span>
		<p>
			可以点击 <a href="login/login.jsp">登录</a>进入系统
		</p>
		<p>用户名：周游 密码：1234</p>
	</div>
	<%
		response.setHeader("refresh", "1");
	%>
	
	<div id="showtime" align="center">111</div>
	
<script type="text/javascript">
function time() {
	//获得显示时间的div
	t_div = document.getElementById('showtime');
	var now = new Date();
	//替换div内容 
	t_div.innerHTML = "现在时间：" + now.getFullYear() + "年"
			+ (now.getMonth() + 1) + "月" + now.getDate() + "日"
			+ now.getHours() + "时" + now.getMinutes() + "分"
			+ now.getSeconds() + "秒";
	//等待一秒钟后调用time方法，由于settimeout在time方法内，所以可以无限调用
	setTimeout(time, 1000);
}


</script>
</body>
</html>