<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<form action="arrayTest2.jsp">
취미 : 인터넷<input type="checkbox" name="hobby" value="인터넷">
		여행<input type="checkbox" name="hobby" value="여행" checked> 
		게임<input type="checkbox" name="hobby" value="게임" checked>
		영화<input type="checkbox" name="hobby" value="영화" checked> 
		운동<input type="checkbox" name="hobby" value="운동">
		<input type="submit">
</form>