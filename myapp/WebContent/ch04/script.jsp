<!-- script.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%! //<%!�� ���� ����
	String declaration = "����";
	public String decMethod() {
		return declaration;
	}
%> 
<% //<%�� ��ũ��Ʈ�� ����
	String scriptlet = "��ũ��Ʈ��";
	String comment = "�ּ�";
	
	//���尴ü
	out.print("���尴ü�� �̿��� ��� : " + declaration + "<p/>");
%>

<!-- ��¹� -->
������ ���1 : <%=declaration%><p/>
������ ���2 : <%=decMethod() %><p/>
������ ���3 : <%=scriptlet%><p/>

