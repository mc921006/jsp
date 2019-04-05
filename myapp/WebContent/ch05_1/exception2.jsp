<%@ page contentType="text/html; charset=EUC-KR"%>
<!-- 에러는 전담하는 페이지 입니다. -->
<%@ page isErrorPage="true" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String message = exception.getMessage();
	String objectMessage = exception.toString();
%>
에러 메세지 : <%=message %><br/>
에러 클래스와 메세지 : <%=objectMessage %><br/>
