<%@page import="java.sql.*"%>
<html>
	<head>
		<title>System Project Maintanance System - Projects</title>
		<link type="text/css" href="../../style.css" rel="stylesheet">	
		<script>
			function validate()
			{

			}
		</script>	
	</head>
	<body>
		<div class="menu">
			<a href="../../">Home</a>
			<span class="separative">|</span>
			<a href="../logout.jsp">Logout</a>
		</div>
<%
	try
	{
		// connection database
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/spms", "root", "");

		// is logined ?
		int student_id = Integer.parseInt((String)session.getAttribute("student_id"));

		PreparedStatement pst1 = con.prepareStatement("select * from chooses where student = ?");
		pst1.setInt(1, student_id);
		ResultSet rs1 = pst1.executeQuery();

		if (rs1.next())
			out.println("<div class='notice'>Please, wait until the distribution of projects.</b></div>");
		else
		{%>
		<h1>List of projects</h1>
		<p align="center">Please, select 5 projects only.</p>

		<table align="center">
			<form name="project" action="save.jsp">
		<%
			PreparedStatement pst = con.prepareStatement("select project_id, project_title, supervisor_fname, supervisor_mname, supervisor_lname, project_description from projects, supervisors where supervisor_id = project_supervisor");
			ResultSet rs = pst.executeQuery();

			while(rs.next())
			{%>
				<table align="center">
				<tr>
					<tr>
						<th class="tbl">Title</th>
						<td class="tbl"><input type="checkbox" name="project" value="<%=rs.getString(1)%>"> <%=rs.getString(2)%></td>
					</tr>
					<tr>
						<th class="tbl">Supervisor</th>
						<td class="tbl"><%=rs.getString(3)%> <%=rs.getString(4)%> <%=rs.getString(5)%></td>
					</tr>
					<tr>
						<th class="tbl">Description</th>
						<td class="tbl"><%=rs.getString(6).replaceAll("\\r\\n","<br>")%></td>
					</tr>
				<table><br>

			<%}
			%>
				<br><input type="submit" value="save" onClick="validate">
			<form>
		</table>
			<%
		}
	}
	catch(Exception e)
	{
		out.println("<div class='error'>" + e.getMessage() + "</div>");
	}
%>
	</body>
</html>
