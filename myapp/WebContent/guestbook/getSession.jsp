<%@page  pageEncoding="EUC-KR" %>
<%
	String id = (String)session.getAttribute("idKey");
	if(id == null) {
		StringBuffer url = request.getRequestURL();
		response.sendRedirect("login.jsp?url="+url);
	}else{//닫는 중괄호는 이 페이지를 include하는 페이지에 구현
%>