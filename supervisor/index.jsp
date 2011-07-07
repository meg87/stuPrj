<%
	String logined = (String)session.getAttribute("supervisor_id");

	if(logined != null)
		response.sendRedirect("projects");			
	else
		response.sendRedirect("login.html");
%>
