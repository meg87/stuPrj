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
			<a href="../visits">Visits</a>
			<span class="separative">|</span>
			<a href="../logout.jsp">Logout</a>
		</div>

		<h1>History of visits</h1>
<%
	// is logined ?
	String logined = (String)session.getAttribute("committee_logined");

	if(logined == null)
		response.sendRedirect("../login.html");

	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/spms", "root", "");

		int student_id = Integer.parseInt(request.getParameter("student"));

		PreparedStatement pst = con.prepareStatement("select visit_date, visit_details from visits where visit_by = ?");
		pst.setInt(1, student_id);
		ResultSet rs = pst.executeQuery();

		while(rs.next())
		{%>
			<table>
				<tr>
					<th class="tbl">Date<th>
					<td class="tbl"><%=rs.getString(1)%><td>
				</tr>
				<tr>
					<th class="tbl">Details<th>
					<td class="tbl"><%=rs.getString(2).replaceAll("\\r\\n","<br>")%><td>
				</tr>
			</table><br>
		<%}
	}
	catch(Exception e)
	{
		out.println("<div class='error'>" + e.getMessage() + "</div>");
	}%>
	</body>
</html>
