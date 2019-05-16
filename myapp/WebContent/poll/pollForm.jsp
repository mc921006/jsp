<%@page import="java.util.Vector"%>
<%@page import="poll.PollListBean"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="poll.PollMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		int num = 0;
		//pollList.jsp에서 num 값을 요청 : include 액션태그를 통해
		if(request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
		}
		PollListBean plBean = mgr.getPollRead(num);
		Vector<String> vlist = mgr.getItem(num);
		String question = plBean.getQuestion();
		int type = plBean.getType();
		int active = plBean.getActive();
		int Sum = mgr.sumCount(num);
%>
<form action="pollFormProc.jsp">
<table border="1">
	<tr>
		<td colspan="2" width="300">Q : <%=question%>&nbsp; <font color="Blue">(<%=Sum%>)</font></td>
	</tr>
	<tr>
		<td colspan="2">
		 <!-- item -->
		 <%
		 	for(int i=0; i<vlist.size(); i++){
		 		String item = vlist.get(i);
		 %>
			 <%if(type == 1){ %>
		 				<input type="checkbox" name="itemnum" value="<%=i%>">
		 	<%}else{%>
		 				<input type="radio" name="itemnum" value="<%=i%>">
		 	<%} %>
		 				<%=item%><br/>
		 <% }	%>
		</td>
	</tr>
	<tr>
		<td width="150">
				<!-- 투표 -->
				<%if(active == 1) {%>
							<input type="submit" value="투표">
				<%}else{ %>
							투표 종료
				<%} %>
		</td>
		<td width="150">
			<input type="button" value="결과" 
			onclick="javascript:window.open('pollView.jsp?num=<%=num%>'
			,'pollView','width=500, height=350')">
		</td>
	</tr>
</table>
<input type="hidden" name="num" value="<%=num%>">
</form>










