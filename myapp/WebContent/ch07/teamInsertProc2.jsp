<!-- 액션태그로 만듬. -->
<%@page import="ch07.TeamBean"%>
<%@page import="ch07.TeamMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%	request.setCharacterEncoding("EUC-KR"); %>

<!-- TeamMgr mgr = new TeamMgr() -->
<jsp:useBean id="mgr" class = "ch07.TeamMgr" />
<!-- TeamBean bean = new TeamBean() -->
<jsp:useBean id="bean" class = "ch07.TeamBean" />

<!-- request.getParameter와 bean.set을 동시에 한 코드 -->
<jsp:setProperty property="*" name="bean"/>

<%
	boolean result = mgr.insertTeam(bean);
	String str = "가입 실패";
	String location = "teamInsert.html";
	if(result) {
		str = "가입 성공";
		location =  "teamList.jsp";
	}
%>
<script>
	alert("<%=str%>");
	location.href = "<%=location%>";
	l<%-- ocation.href(<%=location%>); --%>
</script>
	
	
			
