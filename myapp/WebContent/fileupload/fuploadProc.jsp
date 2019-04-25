<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mgr" class="fileupload.FileloadMgr"/>
<%
	boolean result = mgr.uploadFile(request);
	if(result) {
		response.sendRedirect("flist.jsp");
	}else {
		response.sendRedirect("fuload.jsp");
	}
	
%>
