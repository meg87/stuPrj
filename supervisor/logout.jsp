<%
	session.removeAttribute("supervisor_id");
	session.invalidate();
	response.sendRedirect("../index.html");
%>
