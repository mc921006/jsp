<%@ page contentType="text/html; charset=EUC-KR"
					buffer="5kb"%>
<%
	request.setCharacterEncoding("EUC-KR");
	int totalBuffer = out.getBufferSize();
	int remainBuffer = out.getRemaining();
	int useBuffer = totalBuffer-remainBuffer;
%>
��� Buffer�� ũ�� <% out.println(totalBuffer); %> byte<p/>
���� Buffer�� ũ�� <% out.println(remainBuffer); %> byte<p/>
��� Buffer�� ũ�� <% out.println(useBuffer); %> byte<p/>