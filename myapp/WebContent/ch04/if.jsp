<!-- if.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	//��û�Ǵ� ���� ���� SET�� �ѱ۷� ����
	request.setCharacterEncoding("EUC-KR");
	String name = request.getParameter("name");
	String color = request.getParameter("color");
	String str = "";
	if(color.equals("blue")) {
		str = "�Ķ���";
	}else 	if(color.equals("red")) {
		str = "������";
	}else if(color.equals("orange")) {
		str = "��������";
	}else {
		color="cyan";
		str = "��Ÿ��";
	}
%>
<body bgcolor="<%=color%>">
	<h2><%=name %>���� �����ϴ� ���� <%=str %>��.</h2>
</body>
