<%@page import="java.sql.*" %>
<html>
	<head>
		<title>System Project Maintanance System - Students</title>
		<link type="text/css" href="../style.css" rel="stylesheet">	
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
				// student work on project ?
				try
				{
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost/spms", "root", "");

					PreparedStatement pst = con.prepareStatement("select student_workon from students where student_id = ?");
					pst.setInt(1, Integer.parseInt(student_id));
					ResultSet rs = pst.executeQuery();

					if (rs.next())
						if (rs.getInt(1) == 0)
							response.sendRedirect("projects");
						else
						{
							PreparedStatement pst2 = con.prepareStatement("select project_title from projects where project_id = ?");
							pst2.setInt(1, rs.getInt(1));
							ResultSet rs2 = pst2.executeQuery();

							if (rs2.next())
								out.println("<div class='notice'>Congratulations, your project is : <br><b>" + rs2.getString(1) + "</b></div>");
						}

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
