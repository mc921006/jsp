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
	<%=id %>님이 좋아하는 계절은 ?<%= season %><br/>
	<%=id %>님이 좋아하는 과일은 ?<%= fruit %><br/>
	세션ID : <%=sessionId %><br/>
	세션 유지 시간 : <%=intervalTime %>초<br/>
<%
	}else {
		out.println("세션의 시간이 경과 or 다른 이유로 연결 할 수 없다.");
	}
%>
