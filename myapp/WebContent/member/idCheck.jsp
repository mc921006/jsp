<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="member.MemberMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");
	boolean result =  mgr.checkId(id);
%>
<html>
<body bgcolor= "#FFFFCC ">
<div align="center"><br/>
<b style="font-weight: bold;"><%=id %></b>
	<%
	if(result) {
		%>
		<%="는 이미 존재하는 ID입니다." %>
		<%
			}else {
		%>
		<%="는 사용 가능 합니다." %>
		<%
			}
	%>
	<br/><br>
	<a href="javascript:window.close()" style="text-decoration:none; color : gray" >닫기</a>
<!-- 	<input type="button" onclick="self.close()" value="닫기" style="border: 0px; background-color: #FFFFCC; font-size: 15px; color: gray;"> -->
</div> 
</body>
</html>
