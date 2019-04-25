<%@page import="fileupload.UtilMgr"%>
<%@page import="fileupload.FileUpLoadBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="mgr" class="fileupload.FileloadMgr"/>
<%
	Vector<FileUpLoadBean> vlist = mgr.listFile();
%>
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
			function allChk() {
				f = document.frm;
				if (f.allCh.checked) { //��ü üũ��ư Ŭ����
					for (i = 0; i < f.fch.length; i++) {
						f.fch[i].checked = true;
					}
					f.btn.disabled = false; //��ư�� Ȱ��ȭ
				}else {
					for (i = 0; i < f.fch.length; i++) {
						f.fch[i].checked = false;
					}
					f.btn.disabled = true; //��ư�� ��Ȱ��ȭ
				}
			}
			
			function chk() {
				f = document.frm;
				for (i = 0; i < f.fch.length; i++) {
					if (f.fch[i].checked) {
						f.btn.disabled = false;
						return; //fch�� üũ �ϳ��� �Ǿ��� ������ ������ �ǹ� ��� ��������.
					}
				}
				f.btn.disabled = true; //fch�� üũ�� ���� �ϳ��� ��� ��ư ��Ȱ��ȭ
			}
	</script>
</head>
<body>
	<div align="center">
	<h2>File List</h2>
	<form name="frm" action="fdeleteProc.jsp">
		<table border="1" width = "300">
			<tr>
				<td><input type="checkbox" name="allCh" onclick="allChk()"></td>
				<td>��ȣ</td>
				<td>���ϸ�</td>
				<td>����ũ��</td>
			</tr>
			<%
				for(int i = 0; i<vlist.size(); i++) {
					FileUpLoadBean bean = vlist.get(i);
					int num = bean.getNum();
					String upFile = bean.getUpFile();
					int size = bean.getSize();
			%>
			<tr>
				<td><input type="checkbox" name="fch" value="<%=num%>" onclick="chk()"></td>
				<td><%=i+1%></td>
				<td><a href="fdownload.jsp?upFile=<%=upFile%>"><%=upFile%></a></td>
				<td><%=UtilMgr.monFormat(bean.getSize())%>byte</td>
			</tr>
			<%} %>
			<tr>
				<td colspan="4">
					<input type="submit" name="btn" value="DELETE" disabled>
				</td>
			</tr>
		</table>
		<input type = "hidden" name="fch" value="0">
	</form><p/>
	<a href = "fupload.jsp">�Է���</a>
	</div>
</body>
</html>