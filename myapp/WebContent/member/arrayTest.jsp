<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<form action="arrayTest2.jsp">
��� : ���ͳ�<input type="checkbox" name="hobby" value="���ͳ�">
		����<input type="checkbox" name="hobby" value="����" checked> 
		����<input type="checkbox" name="hobby" value="����" checked>
		��ȭ<input type="checkbox" name="hobby" value="��ȭ" checked> 
		�<input type="checkbox" name="hobby" value="�">
		<input type="submit">
</form>