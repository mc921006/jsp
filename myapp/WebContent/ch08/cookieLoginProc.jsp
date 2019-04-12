<!-- cookieLoginProc.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="register" class = "ch08.RegisterMgr"></jsp:useBean>
<%
	request.setCharacterEncoding("EUC-KR");
	//id, pwd
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	/* boolean result = true; //DB연동 가정, id,pwd가 일치 가정 */
	boolean result = register.loginRegister(id, pwd);
	if(result){
		Cookie cookie = new Cookie("idKey", id);
		response.addCookie(cookie);
%>
	<script>
		alert("로그인 성공");
		location.href = "cookieLoginOk.jsp";
	</script>
<%
	}else {
%>
	<script>
		alert("로그인 실패");
		location.href = "cookieLogin.jsp";
	</script>
<%
	}
%>