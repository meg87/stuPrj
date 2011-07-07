<%@page import="java.sql.*" %>
<html>
	<head>
		<title>System Project Maintanance System - Add new project</title>
		<link type="text/css" href="../../style.css" rel="stylesheet">		
		<script>
			fuction validate()
			{
				if(document.visit.date.value.match(/^[0-9]/[0-9]/[0-9][0-9][0-9][0-9]$/))
				{
					alert("Sorry, the date must be like this format: 15/5/2010 !");
					document.visit.date.focus();
					return false;
				}
				if(document.visit.project.value.match(/^[0-9]*$/)))
				{
					alert("Sorry, the project number must be digits !");
					document.visit.project.focus();
					return false;
				}
				if(document.visit.details.value.length < 100)
				{
					alert("Sorry, the description must be at lest 100 charachter !");
					document.visit.details.focus();
					return false;
				}
			}
		</script>
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

		<h1>Add new visit</h1>
		<div class="box">
			<form name="visit" method="post" action="save.jsp">
				<table>
					<tr>
						<td>Date</td>
						<td><input type="text" name="date" size="95"></td>
					</tr>
					<tr>
						<td>Student</td>
						<td>
							<select name="student">
	<%
		int supervisor_id = Integer.parseInt((String)session.getAttribute("supervisor_id"));

		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/spms", "root", "");

		PreparedStatement pst = con.prepareStatement("select student_id, student_fname, student_mname, student_lname from students, projects where project_supervisor = ? and student_workon = project_id");
		pst.setInt(1, supervisor_id);
		ResultSet rs = pst.executeQuery();

		while(rs.next())
		{%>
			<option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%> <%=rs.getString(3)%> <%=rs.getString(4)%></option>
		<%}

		pst.close();
		con.close();
	%>
							</select>
						</td>
					</tr>
					<tr>
						<td>Details</td>
						<td><textarea name="details" cols="95" rows="10"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><br><input type="submit" value="Add" onClick="validate()"></td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>
