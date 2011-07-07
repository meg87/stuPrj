<%
	String logined = (String)session.getAttribute("admin_logined");

	if(logined != null)
		response.sendRedirect("accounts");			
	else
		response.sendRedirect("login.html");
%>
