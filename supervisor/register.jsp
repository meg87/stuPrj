<%@page import="java.sql.*" %>
<html>
	<head>
		<title>System Project Maintanance System - Register Supervisor</title>
		<link type="text/css" href="../style.css" rel="stylesheet">
	</head>
	<body>
		<div class="menu">
			<a href="../">Home</a>
			<span class="separative">|</span>
			<a href="login.jsp">Login</a>
		</div>
<%
	try
	{
		// connection database
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/spms", "root", "");

		// get supersivor information
		String first_name = request.getParameter("firstname");
		String middle_name = request.getParameter("middlename");
		String last_name = request.getParameter("lastname");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String email = request.getParameter("email");

		// validate
		if(first_name.equals(null) || middle_name.equals(null) || last_name.equals(null) || username.length() < 3 || password.length() < 3 || !password2.equals(password) || email.length() < 5 )
			out.println("<div class='error'>the information is not complate !</div>");
		else
		{
			// store data
			PreparedStatement pst = con.prepareStatement("insert into supervisors(supervisor_fname, supervisor_mname, supervisor_lname, supervisor_username, supervisor_password, supervisor_email) values(?, ?, ?, ?, ?, ?)");
			pst.setString(1, first_name);
			pst.setString(2, middle_name);
			pst.setString(3, last_name);
			pst.setString(4, username);
			pst.setString(5, password);
			pst.setString(6, email);
			int result = pst.executeUpdate();

			out.println("<div class='success'>Your account is successfully registered, but wait activation by administartor</div>");

			// disconnection database
			pst.close();
			con.close();
		}
	}
	catch(Exception e)
	{
		out.println("<div class='error'>" + e.getMessage() + "</div>");
	}
%>
	</body>
</html>
