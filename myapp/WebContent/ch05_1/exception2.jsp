<%@ page contentType="text/html; charset=EUC-KR"%>
<!-- ������ �����ϴ� ������ �Դϴ�. -->
<%@ page isErrorPage="true" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String message = exception.getMessage();
	String objectMessage = exception.toString();
%>
���� �޼��� : <%=message %><br/>
���� Ŭ������ �޼��� : <%=objectMessage %><br/>
