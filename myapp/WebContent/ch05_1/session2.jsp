<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String season = request.getParameter("season");
	String fruit = request.getParameter("fruit");
	String id = (String)session.getAttribute("idKey");
	String sessionId = session.getId();
	int intervalTime = session.getMaxInactiveInterval();
	if(id != null) {
%>
	<%=id %>���� �����ϴ� ������ ?<%= season %><br/>
	<%=id %>���� �����ϴ� ������ ?<%= fruit %><br/>
	����ID : <%=sessionId %><br/>
	���� ���� �ð� : <%=intervalTime %>��<br/>
<%
	}else {
		out.println("������ �ð��� ��� or �ٸ� ������ ���� �� �� ����.");
	}
%>