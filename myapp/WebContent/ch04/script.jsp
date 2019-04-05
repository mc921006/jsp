<!-- script.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%! //<%!는 선언문 영역
	String declaration = "선언문";
	public String decMethod() {
		return declaration;
	}
%> 
<% //<%는 스크립트릿 영역
	String scriptlet = "스크립트릿";
	String comment = "주석";
	
	//내장객체
	out.print("내장객체를 이용한 출력 : " + declaration + "<p/>");
%>

<!-- 출력문 -->
선언문의 출력1 : <%=declaration%><p/>
선언문으 출력2 : <%=decMethod() %><p/>
선언문의 출력3 : <%=scriptlet%><p/>

