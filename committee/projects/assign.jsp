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

	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/spms", "root", "");

		int student_id = Integer.parseInt((String)request.getParameter("student"));
		int project_id = Integer.parseInt((String)request.getParameter("project"));

		PreparedStatement pst = con.prepareStatement("update students set student_workon = ? where student_id = ?");
		pst.setInt(1, project_id);
		pst.setInt(2, student_id);
		int result = pst.executeUpdate();

		PreparedStatement pst2 = con.prepareStatement("delete from chooses where student = ?");
		pst2.setInt(1, student_id);
		int result2 = pst2.executeUpdate();

		response.sendRedirect(".");
	}
	catch(Exception e)
	{
		out.println("<div class='error'>" + e.getMessage() + "</div>");
	}
%>
	</body>
</html>
