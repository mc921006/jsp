<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="cMgr" scope="session" class="shop.CartMgr" />
<jsp:useBean id="order" class="shop.OrderBean" />
<jsp:setProperty property="*" name="order"/>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String) session.getAttribute("idKey"); //로그인한 id을 session으로 받음.
	if(id == null) { //로그인을 안한 상태
		response.sendRedirect("login.jsp");
	}else { //로그인 한 상태
		String flag = request.getParameter("flag");
		String msg = "";		
		order.setId(id);
		if(flag.equals("insert")) {
			cMgr.addCart(order);
			msg = "장바구니에 담았습니다.";
		}else if(flag.equals("update")){
			cMgr.updateCart(order);
			msg = "장바구니가 수정 되었습니다.";
		}else if(flag.equals("del")) {
			cMgr.deleteCart(order);
			msg = "장바구니가 삭제 되었습니다.";
		}
%>
			<script>
				alert("<%=msg%>");
				location.href = "cartList.jsp";
			</script>
<%
	}
%>
