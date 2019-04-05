<%@ page contentType="text/html; charset=EUC-KR"
					buffer="5kb"%>
<%
	request.setCharacterEncoding("EUC-KR");
	int totalBuffer = out.getBufferSize();
	int remainBuffer = out.getRemaining();
	int useBuffer = totalBuffer-remainBuffer;
%>
출력 Buffer의 크기 <% out.println(totalBuffer); %> byte<p/>
남은 Buffer의 크기 <% out.println(remainBuffer); %> byte<p/>
사용 Buffer의 크기 <% out.println(useBuffer); %> byte<p/>