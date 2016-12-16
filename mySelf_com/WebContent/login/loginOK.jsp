<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎您</title>
<link type="text/css" rel="stylesheet" href="../css/loginCSS.css">
</head>
<body>
	<div
		style="position: absolute; z-index: -1; width: 100%; height: 100%; top: 0px; left: 0px;">
		<img src="../img/pingzi.jpg" width="100%" height="100%" />
	</div>

	<%
		//获取Login.java中的userid属性值及登陆时候的用户名，并进行判断，为了不让用户在没有登陆的时候直接打开这个页面
		String userid = (String) session.getAttribute("userid");
		if (null != userid) {
	%>
	<p class="loginOKSpan1">
		欢迎
		<%=session.getAttribute("userid")%>； <span style="color: #18875a;">点击&nbsp;<a
			href="loginOut.jsp">注销</a></span>
	</p>
	<p>
		<a href="../resume/resume.html">个人简历</a>
	</p>

	<%
		//判断如果userid为空则跳转到登录页面
		} else {
	%>
	<p class="loginOKp">
		请先进行系统的<a href="login.jsp">登陆</a>
	</p>
	<%
		}
	%>

</body>
</html>