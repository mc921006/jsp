<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	String id = (String)session.getAttribute("idKey");
	String msg = (String)session.getAttribute("msg");
%>
<html>
<body>
<h1>Setvlet ����</h1>
<%	if(id != null) { %>
	<%=id %>�� �ݰ����ϴ�.<br/>
	<a href = "logout.jsp">�α׾ƿ�</a>
<%	}else{ %>
	<%if(msg != null){ %>
		<font color="red"><%=msg%></font>
	<%} %>
	<form method="post" action="loginServlet">
	id : <input name="id"><br/>
	pwd : <input type="password" name="pwd"><br/>
	<input type="submit" value="�α���">
	</form>
<%	} %>
</body>
</html>
