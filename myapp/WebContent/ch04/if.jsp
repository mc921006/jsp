<!-- if.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	//요청되는 값의 문자 SET을 한글로 설정
	request.setCharacterEncoding("EUC-KR");
	String name = request.getParameter("name");
	String color = request.getParameter("color");
	String str = "";
	if(color.equals("blue")) {
		str = "파란색";
	}else 	if(color.equals("red")) {
		str = "붉은색";
	}else if(color.equals("orange")) {
		str = "오랜지색";
	}else {
		color="cyan";
		str = "기타색";
	}
%>
<body bgcolor="<%=color%>">
	<h2><%=name %>님이 좋아하는 색은 <%=str %>임.</h2>
</body>
