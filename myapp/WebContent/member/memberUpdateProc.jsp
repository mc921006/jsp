<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mgr" class = "member.MemberMgr"/>
<jsp:useBean id="bean" class = "member.MemberBean"/>
<jsp:setProperty property="*" name="bean"/>
<%-- <%
	boolean result = mgr.updateMember(bean);
	String msg = "회원수정 실패";
	String location = "memberUpdate.jsp";
	if(result) {
		msg = "회원수정 성공";
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
		alert("회원정보를 수정 하였습니다.")
		location.href = "login.jsp";
	</script>
	<%
	}else{
		%>
	<script>
		alert("회원정보를 수정 실패하였습니다.")
		history.back();
		</script>
		<%
	}
%>