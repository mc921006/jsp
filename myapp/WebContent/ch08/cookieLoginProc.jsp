<!-- cookieLoginProc.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="register" class = "ch08.RegisterMgr"></jsp:useBean>
<%
	request.setCharacterEncoding("EUC-KR");
	//id, pwd
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	/* boolean result = true; //DB���� ����, id,pwd�� ��ġ ���� */
	boolean result = register.loginRegister(id, pwd);
	if(result){
		Cookie cookie = new Cookie("idKey", id);
		response.addCookie(cookie);
%>
	<script>
		alert("�α��� ����");
		location.href = "cookieLoginOk.jsp";
	</script>
<%
	}else {
%>
	<script>
		alert("�α��� ����");
		location.href = "cookieLogin.jsp";
	</script>
<%
	}
%>