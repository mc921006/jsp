<!-- Gugudan.jsp -->
<meta http-equiv="refresh" content="1"> 
<%@page import="java.util.Random"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<style>
h3 {
	padding-left: 145px;
	color: <%=randomColor()%>
td{
	font-weight : 700;
}
}
</style>
<h3>Table 이용해서 이쁘게 구구단 만들기</h3>
<%!
	int gugu = 0;
	public String randomColor(){
	Random r = new Random();
	String rgb = Integer.toHexString(r.nextInt(256));
		rgb += Integer.toHexString(r.nextInt(256));
		rgb += Integer.toHexString(r.nextInt(256));
		return "#"+rgb;
}
%>
<div>
<hr align="left"
	style="border: solid 3px <%=randomColor() %>; width: 37em;">
<table border="2" bordercolor=<%=randomColor() %>>
	<tr>
		<%
			for(int i = 2; i<10; i++){
		%>
		<th><font color=<%=randomColor() %>><%=i+"단" %></th>
		<%	
			}
		%>
	</tr>
	<tr>
		<%
			for(int i = 1; i<10; i++){
				for(int j = 2; j<10; j++){
					gugu = j * i;
		%>

		<td style="background-color: <%=randomColor() %>"><font =""><%= j+" * "+i+" = "+gugu %></td>
		<%
				}
		%>
	</tr>
	<%
			}
		%>
</table>
</div>
