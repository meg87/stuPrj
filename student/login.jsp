<%@page import="java.sql.*"%>
<html>
	<head>
		<title>System Project Maintanance System - Login Student</title>
		<link type="text/css" href="../style.css" rel="stylesheet">
	</head>
	<body>
		<div class="menu">
			<a href="../">Home</a>
			<span class="separative">|</span>
			<a href="login.html">Login</a>
		</div>
<%
	try
	{
		// connection database
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/spms", "root", "");

		// get login information
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		// get id supervisor
		PreparedStatement pst = con.prepareStatement("select student_id, student_active from students where student_username = ? and student_password = ?");
		pst.setString(1, username);
		pst.setString(2, password);
		ResultSet rs = pst.executeQuery();

		// make sesstion
		if(rs.next())
		{
			if(rs.getInt(2) > 0)
			{
				session.setAttribute("student_id", rs.getString(1));
				response.sendRedirect("index.jsp");	
			}
			else
				out.println("<div class='notice'>Please, wait for the activation of your account by administartor.</div>");	
		}
		else
			out.println("<div class='error'>Sorry, login failed !</div>");	
	}
	catch(Exception e)
	{
		out.println("<div class='error'>" + e.getMessage() + "</div>");
	}
%>
	</body>
</html>
