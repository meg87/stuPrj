<!-- update project -->
<%@page import="java.sql.*"%>
<html>
	<head>
		<title>System Project Maintanance System - Edit project</title>	
		<script>
			fuction validate()
			{
				if(document.project.title.value.length < 1)
				{
					alert("Sorry, title of project is required !");
					document.project.title.focus();
					return false;
				}
				if(document.project.description.value.length < 1)
				{
					alert("Sorry, title of description is required !");
					document.project.description.focus();
					return false;
				}
			}
		</script>
	</head>
	<body>
		<form name="project" method="post" action="update.jsp">
			<table>
				<%try
				{
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8080", "root", "");

					int project_id = Integer.parseInt(request.getParameter("id"));

					PreparedStatement pst = con.prepareStatement("select project_title, project_description from projects where project_id = ?");
					pst.setInt(1, project_id);
					ResultSet rs = pst.executeQuery();

					if(rs.next())
					{%>
						<tr>
							<td>Title</td>
							<td><input type="text" name="title" value="<%=rs.getString(1)%>"></td>
						</tr>
						<tr>
							<td>Description</td>
							<td><textarea name="description">value="<%=rs.getString(2)%>"</textarea></td>
						</tr>
						<tr>
							<td colspan="2"><input type="button" value="Update"></td>
						</tr>
					<%}
				}
				catch(Exception e)
				{
					out.println(e.getMessage());
				}%>
			</table>
		</form>
	</body>
</html>
