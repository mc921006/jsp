<!-- declatationEx -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<h1><%=getStr() %></h1>
<%!
	public String getStr() {
		str += "테스트";
		return str;
	}
	private String str = "선언문";
%>

