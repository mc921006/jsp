<!-- error.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<!-- 에러jsp는 반드시 필요 -->
<%@ page isErrorPage="true"%>

다음과 같은 예외가 발생하였습니다.<p/>
<%=exception.getMessage() %>

