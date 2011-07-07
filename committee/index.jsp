<%
	String logined = (String)session.getAttribute("committee_logined");

	if(logined != null)
		response.sendRedirect("projects");			
	else
		response.sendRedirect("login.html");
%>
