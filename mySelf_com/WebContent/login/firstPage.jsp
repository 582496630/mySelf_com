<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到个人主页</title>
<link type="text/css" rel="stylesheet" href="../css/loginCSS.css">
</head>
<body class="beijing1">
<div>
<p >欢迎来到这，祝您今天心情愉快！今天是：</p>
<span style="color: blue;">
<jsp:useBean id="date" class="java.util.Date" />
	<fmt:formatDate value="${date}" pattern="yyyy/MM/dd  HH:mm:ss" />
	</span>
<p>可以点击
<a href="login.jsp">登录</a>进入系统
</p>
<p>用户名：周游   密码：1234</p>
</div>
<%
response.setHeader("refresh", "1");
%>

</body>
</html>