<!-- login.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%
		request.setCharacterEncoding("EUC-KR");
		String id = (String)session.getAttribute("idKey");
		/* String rid = request.getParameter("id"); */
%>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function loginCheck() {
		if (document.loginFrm.id.value == "") {
			alert("���̵� �Է��� �ּ���.");
			document.loginFrm.id.focus();
			return;
		}
		if (document.loginFrm.pass.value == "") {
			alert("��й�ȣ�� �Է��� �ּ���.");
			document.loginFrm.pass.focus();
			return;
		}
		document.loginFrm.submit();
	}
</script>
<body bgcolor="#FFFFCC">
<div align="center">
<br/><br/>
<%if(id!=null){%>
<b><%=id%></b>�� ȯ���մϴ�.<br/>
���ѵ� ����� ��� �� ���� �ֽ��ϴ�.<br/>
<a href="logout.jsp">�α׾ƿ�</a>
<%}else{
	id = request.getParameter("id");
%>
<form name="loginFrm" method="post" action="loginProc.jsp">
			<table>
				<tr>
					<td align="center" colspan="2"><h4>�α���</h4></td>
				</tr>
				<tr>
					<td>�� �� ��</td>
					<td><input name="id" value="<%=(id != null)?id:""%>"></td>
				</tr>
				<tr>
					<td>��й�ȣ</td>
					<td><input type="password" name="pwd" value=""></td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="right">
							<input type="button" value="�α���" onclick="loginCheck()">&nbsp;
							<input type="button" value="ȸ������" onClick="javascript:location.href='member.jsp'">
						</div>
					</td>
				</tr>
			</table>
		</form>
<%}%>
</div>
</body>





