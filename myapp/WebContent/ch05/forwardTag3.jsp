<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String bloodType = request.getParameter("bloodType");
	String name = "����ö";
%>
<jsp:forward page='<%=bloodType+".jsp" %>'>
	<jsp:param value="<%=name %>" name="name"/>
</jsp:forward>


