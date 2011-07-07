<%@page import="java.sql.*" %>
<html>
	<head>
		<title>System Project Maintanance System - Add new project</title>
		<link type="text/css" href="../../style.css" rel="stylesheet">		
	</head>
	<body>
		<div class="menu">
			<a href="../../">Home</a>
			<span class="separative">|</span>
			<a href="../projects">Projects</a>
			<span class="separative">|</span>
			<a href=".">Visits</a>
			<span class="separative">|</span>
			<a href="../logout.html">Logout</a>
		</div>
	<%
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/spms", "root", "");

			int supervisor_id = Integer.parseInt((String)session.getAttribute("supervisor_id"));

			String visit_date = request.getParameter("date");
			int visit_by = Integer.parseInt(request.getParameter("student"));
			String visit_details = request.getParameter("details");

			PreparedStatement pst = con.prepareStatement("insert into visits(visit_date, visit_by, visit_details, visit_to) values(?, ?, ?, ?)");
			pst.setString(1, visit_date);		
			pst.setInt(2, visit_by);
			pst.setString(3, visit_details);
			pst.setInt(4, supervisor_id);
			int result = pst.executeUpdate();

			if (result > 0)
				out.println("<div class='success'>Thank you, details of the visit is saved.</div>");

			pst.close();
			con.close();
		}
		catch(Exception e)
		{
			out.println("<div class='error'>" + e.getMessage() + "</div>");
		}
	%>
	</body>
</html>
