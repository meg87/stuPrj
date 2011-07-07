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
			<a href=".">Projects</a>
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
		<h1>Assign student to projects</h1>
		<form name="frm" method="post" action="assign.jsp">
			<table align="center">
				<tr>
					<th class="tbl" width="50px">Project Title</th>
				</tr>
<%
	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/spms", "root", "");

		int student_id = Integer.parseInt((String)request.getParameter("id"));

		PreparedStatement pst = con.prepareStatement("select distinct project_id, project_title from chooses, projects where student = ? and project = project_id;");
		pst.setInt(1, student_id);
		ResultSet rs = pst.executeQuery();

		while(rs.next())
		{%>
			<tr>
				<td class="tbl"><input type="radio" name="project" value="<%=rs.getString(1)%>"> <%=rs.getString(2)%></td>
			</tr>
		<%}%>
				<tr>
					<td align="center"><br><input type="submit" value="Save"></td>
				</tr>
			</table>
			<input type="hidden" name="student" value="<%=student_id%>">
		</form>
	<%}
	catch(Exception e)
	{
		out.println("<div class='error'>" + e.getMessage() + "</div>");
	}
%>
	</body>
</html>
