<%@page import="java.sql.*"%>
<html>
	<head>
		<title>System Project Maintanance System - Acounts</title>
		<link type="text/css" href="../style.css" rel="stylesheet">	
	</head>
	<body>
		<div class="menu">
			<a href="../">Home</a>
			<span class="separative">|</span>
			<a href="login.html">Login</a>
		</div>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");

	if (username.equals("committee") && password.equals("123456"))
	{
		session.setAttribute("committee_logined", "1");
		response.sendRedirect("projects");
	}
	else
		out.println("<div class='error'>Sorry, login failed !</div>");	
%>
	</body>
</html>
