<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String bloodType = request.getParameter("bloodType");
	String name = "����ö";
%>
���������� ���� ���� ������ ? <hr align="left" color = "green" width = "50%">
<jsp:include page='<%=bloodType+".jsp" %>'>
	<jsp:param value="<%=name %>" name="name"/>
</jsp:include>
