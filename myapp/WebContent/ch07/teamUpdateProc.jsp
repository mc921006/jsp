<%@page import="ch07.TeamBean"%>
<%@page import="ch07.TeamMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<!-- TeamMgr mgr = new TeamMgr() -->
<jsp:useBean id="mgr" class = "ch07.TeamMgr" />
<!-- TeamBean bean = new TeamBean() -->
<jsp:useBean id="bean" class = "ch07.TeamBean" />

<!-- request.getParameter와 bean.set을 동시에 한 코드 -->
<jsp:setProperty property="*" name="bean"/>

<%
	boolean result = mgr.updateTeam(bean);
	String str = "업뎃 실패";
	String location = "teamList.jsp";
	if(result) {
		str = "업뎃 성공";
		location =  "teamSelect.jsp?num="+bean.getNum();
	}
%>
<script>
	alert("<%=str%>");
	location.href = "<%=location%>";
	<%-- location.href(<%=location%>); --%>
</script>