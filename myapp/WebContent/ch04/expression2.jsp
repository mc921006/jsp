<!-- expresstion2.jsp -->
<%@page import="java.util.*"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%!
	//int a = Math.max(a, b);
	public int max1(int a, int b){
		return (a >= b) ? a : b;
	}
%>
<%
	Date d = new Date();
	int hour = d.getHours();
	int one = 10;
	int two = 12;
%>
지금은 오전일까? 오후일까?
 <%=(hour <12)?"오전":"오후" %>
 <br/>
 one과 two 둘중에 큰 숫자는? <%=max1(one, two) %>