<%@ page contentType="text/html; charset=EUC-KR"%>
<!-- �������� exception2.jsp�� �Ѿ�� -->
<%@ page errorPage="exception2.jsp" %>
<%
	request.setCharacterEncoding("EUC-KR");
	out.print(10/0);
%>