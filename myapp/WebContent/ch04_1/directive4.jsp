<!-- directive4.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page session="true" 
				buffer="8kb"
				autoFlush="true"
				isThreadSafe="true"
%>
<%@ page import="java.util.*" %>
<%
	Date d = new Date();
%>
<%=d.toLocaleString() %>
