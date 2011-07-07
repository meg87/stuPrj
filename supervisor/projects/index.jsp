<%@page import="java.sql.*"%>
<html>
	<head>
		<title>System Project Maintanance System - Projects</title>
		<link type="text/css" href="../../style.css" rel="stylesheet">	
	</head>
	<body>
		<div class="menu">
			<a href="../../">Home</a>
			<span class="separative">|</span>
			<a href="../visits">Visits</a>
			<span class="separative">|</span>
			<a href="../logout.jsp">Logout</a>
		</div>
<%
	// is logined ?
	String logined = (String)session.getAttribute("supervisor_id");
	String supervisor_name = (String)session.getAttribute("supervisor_first_name");

	if(logined == null)
		response.sendRedirect("../login.html");
%>
		<h1>Projects under your supervision</h1>
<%
	try
	{
		// connection database
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/spms", "root", "");

		// is logined ?
		int supervisor_id = Integer.parseInt((String)session.getAttribute("supervisor_id"));

		// get projects of supervisor
		PreparedStatement pst = con.prepareStatement("select project_id, project_title, project_description from projects where project_supervisor = ?");
		pst.setInt(1, supervisor_id);
		ResultSet rs = pst.executeQuery();

		while(rs.next())
		{%>
			<table align="center">
				<tr>
					<th class="tbl" width="100px">Title</th>
					<td class="tbl"><%=rs.getString(2)%></td>
				</tr>
				<tr>
					<th class="tbl">Description</th>
					<td class="tbl"><%=rs.getString(3).replaceAll("\\r\\n","<br>")%></td>
				</tr>
			<table><br>
		<%}
	}
	catch(Exception e)
	{
		out.println("<div class='error'>" + e.getMessage() + "</div>");
	}
%>
		<p align="center">[ <a href="add.html">Add new project</a> ]</p>
	</body>
</html>
