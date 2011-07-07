<%@page import="java.sql.*"%>
<html>
	<head>
		<title>System Project Maintanance System - Visits</title>
		<link type="text/css" href="../../style.css" rel="stylesheet">	
	</head>
	<body>
		<div class="menu">
			<a href="../../">Home</a>
			<span class="separative">|</span>
			<a href="../projects">Projects</a>
			<span class="separative">|</span>
			<a href="../logout.html">Logout</a>
		</div>
<%
	// is logined ?
	String logined = (String)session.getAttribute("supervisor_id");
	String supervisor_name = (String)session.getAttribute("supervisor_first_name");

	if(logined == null)
		response.sendRedirect("../login.html");
%>
		<h1>Meeting Reports</h1>
<%
	try
	{
		// connection database
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/spms", "root", "");

		// is logined ?
		int supervisor_id = Integer.parseInt((String)session.getAttribute("supervisor_id"));

		// get projects of supervisor
		PreparedStatement pst = con.prepareStatement("select visit_id, visit_date, student_fname, student_mname, student_lname, visit_details from visits, students where visit_to = ? and visit_by = student_id");
		pst.setInt(1, supervisor_id);
		ResultSet rs = pst.executeQuery();

		while(rs.next())
		{%>
			<table align="center">
				<tr>
					<th class="tbl" width="100px">Date</th>
					<td class="tbl"><%=rs.getString(2)%></td>
				</tr>
				<tr>
					<th class="tbl" width="100px">Student</th>
					<td class="tbl"><%=rs.getString(3)%> <%=rs.getString(4)%> <%=rs.getString(5)%></td>
				</tr>
				<tr>
					<th class="tbl">Details</th>
					<td class="tbl"><%=rs.getString(6).replaceAll("\\r\\n","<br>")%></td>
				</tr>
			<table><br>
		<%}
	}
	catch(Exception e)
	{
		out.println("<div class='error'>" + e.getMessage() + "</div>");
	}
%>
		<p align="center">[ <a href="add.jsp">Add new visit</a> ]</p>
	</body>
</html>
