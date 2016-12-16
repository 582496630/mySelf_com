<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script type="text/javascript"
	src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
</head>
<body >




<div id="showtime" align="center" >111</div>

	
<script type="text/javascript">

	//获得显示时间的div
	

	
	//等待一秒钟后调用time方法，由于settimeout在time方法内，所以可以无限调用


function time() {
	var now = new Date();
	
$("#showtime").html("现在时间：" + now.getFullYear() + "年"
		+ (now.getMonth() + 1) + "月" + now.getDate() + "日"
		+ now.getHours() + "时" + now.getMinutes() + "分"
		+ now.getSeconds() + "秒");
window.setTimeout("time()", 1000);
}
window.onload = time;
</script>
</body>
</html>