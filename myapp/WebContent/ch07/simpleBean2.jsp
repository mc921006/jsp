<%@page import="ch07.SimpleBean"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<!-- SimpleBean ��ü�� ���� -->
<jsp:useBean id="bean" class = "ch07.SimpleBean" />

<!-- ��û�� message�� �ް� message�� ���� -->
<jsp:setProperty property="message" name="bean"/>

<!-- ����� message�� �����´�. -->
message2 : <jsp:getProperty property="message" name="bean"/>
