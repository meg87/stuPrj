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
			<a href="../logout.jsp">Logout</a>
		</div>
<%
	// is logined ?
	String logined = (String)session.getAttribute("committee_logined");

	if(logined == null)
		response.sendRedirect("../login.html");
%>
		<h1>History of visits</h1>
		<div class="loginbox" align="center">
			<form name="visit" method="post" action="history.jsp">
				Student 
				<select name="student">

<%
	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/spms", "root", "");

		PreparedStatement pst = con.prepareStatement("select student_id, student_fname, student_mname, student_lname from students");
		ResultSet rs = pst.executeQuery();

		while(rs.next())
		{%>
			<option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%> <%=rs.getString(3)%> <%=rs.getString(4)%></option>
		<%}
	}
	catch(Exception e)
	{
		out.println("<div class='error'>" + e.getMessage() + "</div>");
	}
%>
				</select>
				<input type="submit" value="Search">
			</form>
		</div>
	</body>
</html>
