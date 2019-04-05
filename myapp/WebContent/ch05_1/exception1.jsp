<%@ page contentType="text/html; charset=EUC-KR"%>
<!-- 에러나면 exception2.jsp로 넘어가라 -->
<%@ page errorPage="exception2.jsp" %>
<%
	request.setCharacterEncoding("EUC-KR");
	out.print(10/0);
%>