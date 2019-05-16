<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="cMgr" scope="session" class="shop.CartMgr" />
<jsp:useBean id="order" class="shop.OrderBean" />
<jsp:setProperty property="*" name="order"/>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String) session.getAttribute("idKey"); //�α����� id�� session���� ����.
	if(id == null) { //�α����� ���� ����
		response.sendRedirect("login.jsp");
	}else { //�α��� �� ����
		String flag = request.getParameter("flag");
		String msg = "";		
		order.setId(id);
		if(flag.equals("insert")) {
			cMgr.addCart(order);
			msg = "��ٱ��Ͽ� ��ҽ��ϴ�.";
		}else if(flag.equals("update")){
			cMgr.updateCart(order);
			msg = "��ٱ��ϰ� ���� �Ǿ����ϴ�.";
		}else if(flag.equals("del")) {
			cMgr.deleteCart(order);
			msg = "��ٱ��ϰ� ���� �Ǿ����ϴ�.";
		}
%>
			<script>
				alert("<%=msg%>");
				location.href = "cartList.jsp";
			</script>
<%
	}
%>
