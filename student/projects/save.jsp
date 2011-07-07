<%@page import="java.sql.*" %>
<html>
	<head>
		<title>System Project Maintanance System - Save projects</title>
		<link type="text/css" href="../../style.css" rel="stylesheet">	
	</head>
	<body>
		<div class="menu">
			<a href="../">Home</a>
			<span class="separative">|</span>
			<a href="logout.jsp">Logout</a>
		</div>
		<%
			// student is login ?
			String student_id = (String)session.getAttribute("student_id");

			if (student_id != null)
			{
				try
				{
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/spms", "root", "");

					String [] projects = request.getParameterValues("project");

					PreparedStatement pst;

					for(int i = 0; i < projects.length; i++)
					{
						pst = con.prepareStatement("insert into chooses(student, project) values(?, ?)");
						pst.setInt(1, Integer.parseInt(student_id));
						pst.setInt(2, Integer.parseInt(projects[i]));
						pst.executeUpdate();
					}

					out.println("<div class='success'>Thank you, the projects which you choose it is saved.</div>");
				}
				catch(Exception e)
				{
					out.println("<div class='error'>" + e.getMessage() + "</div>");
				}
			}
			else
				response.sendRedirect("login.html");
		%>	
	</body>
</html>
