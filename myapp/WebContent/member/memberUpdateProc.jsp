<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mgr" class = "member.MemberMgr"/>
<jsp:useBean id="bean" class = "member.MemberBean"/>
<jsp:setProperty property="*" name="bean"/>
<%-- <%
	boolean result = mgr.updateMember(bean);
	String msg = "ȸ������ ����";
	String location = "memberUpdate.jsp";
	if(result) {
		msg = "ȸ������ ����";
		location = "login.jsp";
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=location%>";
</script> --%>
<%
	boolean result = mgr.updateMember(bean);
	if(result) {
	%>
	<script>
		alert("ȸ�������� ���� �Ͽ����ϴ�.")
		location.href = "login.jsp";
	</script>
	<%
	}else{
		%>
	<script>
		alert("ȸ�������� ���� �����Ͽ����ϴ�.")
		history.back();
		</script>
		<%
	}
%>