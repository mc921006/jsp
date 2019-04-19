<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String sessionId = session.getId();
	session.invalidate(); // 모든 세션이 제거가 된다.
%>
<script>
	alert("<%=sessionId + " : 로그아웃" %>");
	location.href = "sessionLogin.jsp";
</script>