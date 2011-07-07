<%@page import="java.sql.*" %>
<html>
	<head>
		<title>System Project Maintanance System - Active account</title>
		<link type="text/css" href="../../style.css" rel="stylesheet">
	</head>
	<body>
<%
	String logined = (String)session.getAttribute("admin_logined");

	if(logined == null)
		response.sendRedirect("../login.html");

	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/spms", "root", "");

		if (request.getParameter("supervisor") != null)
		{
			int user_id = Integer.parseInt(request.getParameter("supervisor"));

			PreparedStatement pst = con.prepareStatement("update supervisors set supervisor_active = 1 where supervisor_id = ?");

			pst.setInt(1, user_id);
			int result = pst.executeUpdate();

			if(result > 0)
				response.sendRedirect("index.jsp");
			else
				out.println("<div class='error'> fail operation !</div>");
		}
		else if (request.getParameter("student") != null)
		{
			int user_id = Integer.parseInt(request.getParameter("student"));

			PreparedStatement pst = con.prepareStatement("update students set student_active = 1 where student_id = ?");
			pst.setInt(1, user_id);
			int result = pst.executeUpdate();

			if(result > 0)
				response.sendRedirect("index.jsp");
			else
				out.println("<div class='error'> fail operation !</div>");
		}
	}
	catch(Exception e)
	{
		out.println("<div class='error'>" + e.getMessage() + "</div>");
	}
%>
	</body>
</html>
