<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String sessionId = session.getId();
	session.invalidate(); // ��� ������ ���Ű� �ȴ�.
%>
<script>
	alert("<%=sessionId + " : �α׾ƿ�" %>");
	location.href = "sessionLogin.jsp";
</script>