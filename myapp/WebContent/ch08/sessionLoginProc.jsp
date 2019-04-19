<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class = "ch08.RegisterMgr2" />
<%
	request.setCharacterEncoding("EUC-KR");
	//id, pwd를 요청받아서 loginRegister 메소드를 호출하여
	//성공이면 sessionLoginOK.jsp로 보내고
	//실패면 sessionLogin.jsp로 보내기
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	boolean result = mgr.loginRegister2(id, pwd);
	String msg = "로그인 실패";
	String location = "sessionLogin.jsp";
	if(result) {
		msg = "로그인 성공";
		location = "sessionLoginOK.jsp";
		session.setAttribute("idKey", id);
	}
%>
<script>
	alert("<%= msg%>");
	location.href = "<%=location%>"
</script>
