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

<!-- request.getParameter�� bean.set�� ���ÿ� �� �ڵ� -->
<jsp:setProperty property="*" name="bean"/>

<%
	boolean result = mgr.updateTeam(bean);
	String str = "���� ����";
	String location = "teamList.jsp";
	if(result) {
		str = "���� ����";
		location =  "teamSelect.jsp?num="+bean.getNum();
	}
%>
<script>
	alert("<%=str%>");
	location.href = "<%=location%>";
	<%-- location.href(<%=location%>); --%>
</script>