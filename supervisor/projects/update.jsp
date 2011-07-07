<%@page import="java.sql.*" %>
<%
	// get data
	int id = Integer.parseInt(request.getParameter("id"));
	String title = request.getParameter("title");
	String description = request.getParameter("description");

	if ((String)session.getAttribute("supervisor_id") != null)
		int spuervisor_id = Integer.parseInt((String)sesstion.getAttribute("supervisor_id"));

	if(!title.equals(null) || !description.equals(null) || spuervisor_id <= 0)
	{
		try
		{
			// connection database
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/spms", "root", "");

			PreparedStatement pst = con.prepareStatement("update projects set project_title = ?, project_description = ?, project_supervistor = ?");
			pst.setString(1, title);
			pst.setString(2, description);
			pst.setString(3, spuervisor_id);
			pst.setInt(4, id);
			int result = pst.executeUpdate();

			if (result > 0)
				out.println("Thank you, The project is updated.");

		}
		catch(Exception e)
		{
			out.println(e.getMessage());
		}
	}
	else
		response.sendRedirect("../../index.html");
%>
