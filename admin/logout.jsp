<%
	session.removeAttribute("admin_logined");
	session.invalidate();
	response.sendRedirect("../index.html");
%>
