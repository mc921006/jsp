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
������ �����ϱ�? �����ϱ�?
 <%=(hour <12)?"����":"����" %>
 <br/>
 one�� two ���߿� ū ���ڴ�? <%=max1(one, two) %>