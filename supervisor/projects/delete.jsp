<%@page import="java.sql.*" %>
<%
	// get project id
	int id = Integer.parseInt(request.getParameter("id"));

	// is supervisor ?
	if (session.getAttribute("supervisor_id") != null)
		int spuervisor_id = Integer.parseInt((String)session.getAttribute("supervisor_id"));

	if(spuervisor_id < 1)
	{
		try
		{
			// connection database
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/spms", "root", "");

			PreparedStatement pst = con.prepareStatement("delete from projects where project_id = ?");
			pst.setInt(1, id);
			int result = pst.executeUpdate();

			if (result > 0)
				out.println("Thank you, The project is deleted.");

		}
		catch(Exception e)
		{
			out.println(e.getMessage());
		}
	}
	else
		response.sendRedirect("../../index.html");
%>
