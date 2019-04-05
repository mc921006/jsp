<!-- expresstion.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%! //무조건 법칙 : 배열 밑에는 항상 for문 존재
	String study[] = {"java", "jsp", "servlet", "android"};
%>
<table border="1" width="200">
	<tr>
		<th>번호</th>
		<th>과목</th>
	</tr>
	<%
		for(int i = 0; i<study.length; i++) {
	%>
	<tr>
		<td><%=i+1%></td>
		<td><%=study[i] %></td>
	</tr>
	<%
		}
	%>
</table>
<hr>
<table border="1" width="200">
	<tr>
		<th>번호</th>
		<th>과목</th>
	</tr>
	<%
	for(int i = 0; i<study.length; i++) {
		out.println("<tr>");
		out.println("<td>"+(i+1)+"</td>");
		out.println("<td>"+study[i]+"</td>");
		out.println("</tr>");
	}
	%>
</table>