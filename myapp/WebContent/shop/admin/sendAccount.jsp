<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mMgr" class="shop.MemberMgr"/>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");
	mMgr.sendAccount(id);
%>
<script>
	alert("���� ���� �Ϸ�...");
	location.href = "memberMgr.jsp";
</script>