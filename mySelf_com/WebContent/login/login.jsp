<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆页面</title>
<link type="text/css" rel="stylesheet" href="../css/loginCSS.css">
<script type="text/javascript"
	src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
</head>
<script type="text/javascript">
	//打开页面就让鼠标聚焦到用户名输入框
	$(document).ready(function() {
		setTimeout('document.getElementById("text").focus()', 0);
	})
</script>


<body>
	<!-- 插入相对背景 -->
	<div id="background"
		style="position: absolute; z-index: -1; width: 100%; height: 100%; top: 0px; left: 0px;">
		<img src="../img/bluesky.jpg" width="100%" height="100%" />
	</div>
	<!-- 插入form表单内容 -->
	<div class="loginDiv1">
		<form action="<%=request.getContextPath()%>/servlet/Login"
			method="post">
			<table class="table">
				<!-- line-height: 60px-----tr行距 -->
				<tr style="line-height: 60px;">
					<td colspan="2"><span>用户名：</span> <input name="username"
						type="text" title="请输入用户名" class="loginInput" /></td>
				</tr>
				<tr style="line-height: 60px;">
					<td colspan="2"><span>密&nbsp; 码：</span> <input name="password"
						type="password" title="请输入密码" class="loginInput" /></td>
				</tr>
				<!--  提示请“输入用户名与密码”行 -->
				<tr
					style="line-height: 0px; font-size: 6px; font-family: 楷体; color: red; font-weight: bold;">
					<td id="pwdtd"></td>
				</tr>
				<!-- 登录按钮 -->
				<tr style="line-height: 60px;">
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input name="submit" type="submit"
						value="登录"
						style="height: 35px; width: 250px; background-color: #62d05b; border-color: #62d05b; font-family: 黑体; font-size: 20px;" /></td>
					<!-- <td><input name="reset" type="reset" value="重置" /></td> -->
				</tr>
			</table>
		</form>

		<script type="text/javascript">
			$("#pwdtd").append("请输入用户名与密码！")
		</script>
		
			<% //计算当前用户登录数量,把用户名放到session中，用于监听器使用
			
			String userid= request.getParameter("username");
			//userid  用于监听器里的销毁方法中
			session.setAttribute("userid", userid);
			%>
		
		
<%-- <%
//计算当前用户登录数量
String userid= request.getParameter("username");
if(!(userid ==null || "".equals(userid))){
	session.setAttribute("userid", userid);
	//response.sendRedirect("./OnlineUserList1_List.jsp");
}
%> --%>

		<%-- 用jsp方式控制登陆的用户名与密码；现改为用servlet的方法
		<%
			//用户名：天霾    密码：1234
			String name = request.getParameter("username");
			String pwd = request.getParameter("password");
			
			 if (null != name && null != pwd && "周游".equals(name) && "1234".equals(pwd)) { 
				session.setAttribute("userid", name);//将用户名保存在session中 
				response.sendRedirect("login2.jsp");//登录成功跳转页面
		%>
		<p class="p1">
			如果没有跳转请点击<a href="loginOK.jsp">这里</a>
		</p>
		<%
			} else 	if(name==null||pwd==null){
				%>
				<% 
			}else {
		%>
		<script type="text/javascript">
		
		$("#pwdtd").append("用户名密码错误")
		</script>
		
		
		<%
		}
						
	%>  --%>
	</div>
</body>
</html>