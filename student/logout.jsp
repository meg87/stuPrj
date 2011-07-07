<%
	//session.removeAttribute("student_id");
	session.invalidate();
	response.sendRedirect("../index.html");
%>
