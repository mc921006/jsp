<%@ page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<!-- 1. 빈즈 객체를 생성한다.  -->
<jsp:useBean id="bean" class = "ch07.SimpleBean2"/>

<!-- 2. 값을 받아서 빈즈에 저장  -->
<jsp:setProperty property="*" name="bean"/>

<!-- 3. 빈즈에서 값 가져오기  -->
name2 : <jsp:getProperty property="name" name="bean"/>
age2 : <jsp:getProperty property="age" name="bean"/>
city2 : <jsp:getProperty property="city" name="bean"/>
