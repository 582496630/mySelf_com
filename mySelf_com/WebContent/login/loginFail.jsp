<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>跳转页面</title>
<link type="text/css" rel="stylesheet" href="../css/loginCSS.css">
</head>
<body  class="loginFailBody">
<%
response.setHeader("refresh", "3;url=../login/login.jsp");//定时跳转
%>
	<div 
		style="position: absolute; z-index: -1; width: 100%; height: 100%; top: 0px; left: 0px;">
		<img src="../img/firstpage.jpg" width="100%" height="100%" />
		</div> 
<div>
<span >登陆失败！请重新登陆</span>
</div>

</body>
</html>