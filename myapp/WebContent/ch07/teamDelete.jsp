
<!-- teamDelete.jsp는 화면에 보여지는 페이지는 아니고 처리만 하는 페이지. -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class = "ch07.TeamMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	int num = 0;
	if(request.getParameter("num") != null){
		num = Integer.parseInt(request.getParameter("num"));
		mgr.deleteTeam(num);
	}
	response.sendRedirect("teamList.jsp");
%>