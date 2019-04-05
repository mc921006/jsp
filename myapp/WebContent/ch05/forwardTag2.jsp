<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
forward 후에 페이지...<br>
id / pwd : <%=id+"/"+pwd %>

