<%@page import="ch07.TeamBean"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class = "ch07.TeamMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	int num = 0;
	//num���� �Ѿ���� ������ ���� ó��
	if(request.getParameter("num")==null){
		response.sendRedirect("teamList.jsp");
	}else {
		num = Integer.parseInt(request.getParameter("num"));	
	}
	TeamBean bean = mgr.getTeam(num);
%>
<link href="style.css" rel="stylesheet" type="text/css">
<body>
<div align="center">
<h1>Team Select</h1>
<table border="1">
	<tr>
		<td>��ȣ</td>
		<td><%=bean.getNum()%></td>
	</tr>
	<tr>
		<td>�̸�</td>
		<td><%=bean.getName()%></td>
	</tr>
	<tr>
		<td>��°�</td>
		<td><%=bean.getCity()%></td>
	</tr>
	<tr>
		<td>����</td>
		<td><%=bean.getAge()%></td>
	</tr>
	<tr>
		<td>����</td>
		<td><%=bean.getTeam()%></td>
	</tr>
</table><p/>
<a href="teamList.jsp">LIST</a>&nbsp;&nbsp;
<a href="teamInsert.html">INSERT</a>&nbsp;&nbsp;
<a href="teamDelete.jsp?num=<%=num %>">DELETE</a>&nbsp;&nbsp;
<a href="teamUpdate.jsp?num=<%=num %>">UPDATE</a>&nbsp;&nbsp;
</div>
</body>