<%@page import="java.sql.*" %>
<html>
	<head>
		<title>System Project Maintanance System - Add projects</title>
		<link type="text/css" href="../../style.css" rel="stylesheet">	
	</head>
	<body>
		<div class="menu">
			<a href="../../">Home</a>
			<span class="separative">|</span>
			<a href=".">Projects</a>
			<span class="separative">|</span>
			<a href="../visits">Visits</a>
			<span class="separative">|</span>
			<a href="../logout.jsp">Logout</a>
		</div>
<%
	// get data
	String title = request.getParameter("title");
	String description = request.getParameter("description");

	//if ((String)session.getAttribute("supervisor_id") != null)
		int supervisor_id = Integer.parseInt((String)session.getAttribute("supervisor_id"));

	if(title.length() >= 10 && description.length() >= 250)
	{
		try
		{
			// connection database
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/spms", "root", "");

			PreparedStatement pst = con.prepareStatement("insert into projects(project_title, project_description, project_supervisor) values(?, ?, ?)");
			pst.setString(1, title);
			pst.setString(2, description);
			pst.setInt(3, supervisor_id);
			int result = pst.executeUpdate();

			if (result > 0)
				out.println("<div class='success'>" + "Thank you, The project is added." + "</div>");

		}
		catch(Exception e)
		{
			out.println("<div class='error'>" + e.getMessage() + "</div>");
		}
	}
	else
		out.println("<div class='error'>The information is not complete !</div>");
%>
	</body>
</html>
