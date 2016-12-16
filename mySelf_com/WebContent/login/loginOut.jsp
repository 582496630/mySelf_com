<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>退出</title>
<link type="text/css" rel="stylesheet" href="../css/loginCSS.css">
</head>
<body>
	<div
		style="position: absolute; z-index: -1; width: 100%; height: 100%; top: 0px; left: 0px;">
		<img src="../img/out.jpg" width="100%" height="100%" />
	</div>
	<%
		response.setHeader("refresh", "5;url=../firstPage.jsp");
		session.invalidate();
	%>
	<div class="login2Div">
		<p>您已成功退出本系统，5秒后自动跳转回首页</p>
		<p>
			如果没有跳转，请按<a href="../firstPage.jsp">这里</a>
		</p>
	</div>
</body>
</html>