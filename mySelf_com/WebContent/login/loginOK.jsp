<%@page import="java.util.*"%>
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
<marquee class="loginOKSpan1">欢迎光临</marquee>
	<p class="loginOKSpan1">
		欢迎
		<%=session.getAttribute("userid")%>； <span style="color: #18875a;">点击&nbsp;<a
			href="loginOut.jsp">注销</a></span>
	</p>
	<p>
		<a href="../resume/resume.html">个人简历</a>
	</p>

	<div>
		<%
		Set all = (Set) this.getServletContext().getAttribute("online");
	%>
		<h3>
			当前在线用户数量:<%=all.size()%></h3>
		<table>
			<tr>
				<td>在线用户列表</td>
				<td>IP地址</td>
			</tr>
			<%
		Iterator iter = all.iterator();
		while (iter.hasNext()) {
	%>
			<tr>
				<td><%=iter.next()%></td>
				
				<% String ipadd = request.getRemoteAddr();   %>
				<% String ipadd2 = request.getLocalAddr();   %>
				
				<td><%=ipadd %></td>
				<%
		}
	%>
			
		</table>
	</div>
</body>
</html>