<%@page import="java.sql.*" %>
<html>
	<head>
		<title>System Project Maintanance System - accounts</title>
		<link type="text/css" href="../../style.css" rel="stylesheet">
	</head>
	<body>
		<div class="menu">
			<a href="../../">Home</a>
			<span class="separative">|</span>
			<a href="../logout.jsp">Logout</a>
		</div>

<!-- supervisors-->

		<h1 align="center">Non-activated accounts of supervisors</h1>
		<table align="center">
			<tr>
				<th class="tbl">Do</th>
				<th class="tbl">Full name</th>
				<th class="tbl">Email</th>
			</tr>
<%
	String logined = (String)session.getAttribute("admin_logined");

	if(logined == null)
		response.sendRedirect("../login.html");

	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/spms", "root", "");

		PreparedStatement pst = con.prepareStatement("select supervisor_id, supervisor_fname, supervisor_mname, supervisor_lname, supervisor_email from supervisors where supervisor_active = 0");
		ResultSet rs = pst.executeQuery();

		while(rs.next())
		{%>
			<tr class="tbl">
				<td class="tbl"><a href="active.jsp?supervisor=<%=rs.getInt(1)%>">Active</a></td>
				<td class="tbl"><%=rs.getString(2)%> <%=rs.getString(3)%> <%=rs.getString(4)%></td>
				<td class="tbl"><%=rs.getString(5)%></td>
			</tr>
		<%}

		pst.close();
		con.close();
	}
	catch(Exception e)
	{
		out.println("<div class='error'>" + e.getMessage() + "</div>");
	}
%>
		</table>

<!-- students -->

		<h1 align="center">Non-activated accounts of students</h1>
		<table align="center">
			<tr>
				<th class="tbl">Do</th>
				<th class="tbl">Full name</th>
				<th class="tbl">Email</th>
			</tr>
<%

	if(logined == null)
		response.sendRedirect("../login.html");

	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/spms", "root", "");

		PreparedStatement pst = con.prepareStatement("select student_id, student_fname, student_mname, student_lname, student_email from students where student_active = 0");
		ResultSet rs = pst.executeQuery();

		while(rs.next())
		{%>
			<tr class="tbl">
				<td class="tbl"><a href="active.jsp?student=<%=rs.getInt(1)%>">Active</a></td>
				<td class="tbl"><%=rs.getString(2)%> <%=rs.getString(3)%> <%=rs.getString(4)%></td>
				<td class="tbl"><%=rs.getString(5)%></td>
			</tr>
		<%}

		pst.close();
		con.close();
	}
	catch(Exception e)
	{
		out.println("<div class='error'>" + e.getMessage() + "</div>");
	}
%>
		</table>
	</body>
</html>
