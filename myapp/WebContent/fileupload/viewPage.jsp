<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	final String saveFolder = "C:/Jsp/eclipse-workspace/myapp/WebContent/fileupload/filestorage";
	final String encType = "EUC-KR";
	final int maxSize = 10*1024*1024; //10MB
	try{
		//������ ������ ���ε� �Ǵ� ������ MultipartRequest ��ü�� ��������� ����.
		MultipartRequest multi = new MultipartRequest(
				request, saveFolder, maxSize, encType, new DefaultFileRenamePolicy());
		String filename = multi.getFilesystemName("uploadFile"); //fileselect�� fileŸ���� �̸��� ����.
		String original = multi.getOriginalFileName("uploadFile"); //���� ������ �̸�
		String type = multi.getContentType("uploadFile"); //file�� Ÿ��
		File f = multi.getFile("uploadFile"); //���ε�� ���� ũ��(java.io)
		int len = 0;
		if(f != null) {
			len = (int)f.length();
		}
		String user = multi.getParameter("user"); 
		String title = multi.getParameter("title");
%>
	����� ���� : <%=filename %><br/>
	���� ����  : <%=original %><br/>
	���� Ÿ�� : <%=type %><br/>
	���� ũ�� : <%=len %><br/>
	user : <%=user %><br/>
	title : <%=title %><br/>
	<a href = "fileSelect.jsp">���ϼ���</a>
<%
				
				
	}catch(Exception e){
		out.println(e.getMessage());
	}
	
%>