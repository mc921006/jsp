<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="orderMgr" class="shop.OrderMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String flag = request.getParameter("flag");
	int no = Integer.parseInt(request.getParameter("no"));
	boolean result = false;
	String msg = "���� �߻�....";
	if(flag.equals("update")) {
		String state = request.getParameter("state");
		result = orderMgr.updateOrder(no, state);
		if(result){
			msg = "���� �Ϸ�...";
		}
	}else if (flag.equals("delete")) {
		result = orderMgr.deleteOrder(no);
		if(result){
			msg = "���� �Ϸ�...";
		}
	}
%>
<script>
	alert = "<%=msg%>";
	location.href = "orderMgr.jsp";
</script>