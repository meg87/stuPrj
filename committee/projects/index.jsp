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
	String logined = (String)session.getAttribute("committee_logined");

	if(logined == null)
		response.sendRedirect("../login.html");
%>
		<h1>Projects pending</h1>
		<table align="center">
			<tr>
				<th class="tbl" width="50px">GPA</th>
				<th class="tbl">Student</th>
			</tr>
<%
	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/spms", "root", "");

		// get projects of supervisor
		PreparedStatement pst = con.prepareStatement("select distinct student_id, student_fname, student_mname, student_lname, student_gpa from chooses, students where student = student_id order by student_gpa asc");
		ResultSet rs = pst.executeQuery();

		while(rs.next())
		{%>
			<tr>
				<td class="tbl"><%=rs.getString(5)%></td>
				<td class="tbl"><a href="student.jsp?id=<%=rs.getString(1)%>"><%=rs.getString(2)%> <%=rs.getString(3)%> <%=rs.getString(4)%></a></td>
			</tr>
		<%}
	}
	catch(Exception e)
	{
		out.println("<div class='error'>" + e.getMessage() + "</div>");
	}
%>
		<table>
	</body>
</html>
