<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<!-- 파일업로드은 무조건 post방식으로 -->
<!-- enctype 속성 : form을 전송할때 사용할 인코딩 방법 지정 -->
<form method="post" action="viewPage.jsp" enctype="multipart/form-data">
	user : <input name="user" value="홍길동"><br/>
	title : <input name="title" value="파일업로드"><br/>
	file : <input type="file" name="uploadFile"><br/>
	<input type="submit" value="UPLOAD"><br/>
</form>