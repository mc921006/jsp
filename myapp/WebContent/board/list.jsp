<%@page import="board.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="board.BoardMgr" />
<jsp:useBean id="cmgr" class="board.BCommentMgr" />
<%
	request.setCharacterEncoding("EUC-KR");

	int totalRecord = 0; //�� �Խù� ��
	int numPerPage = 10; //page�� record ��
	int pagePerBlock = 15; //block�� page ��(��� ��)
	int totalPage = 0; //�� page ��=(�ø�)�� �Խù� �� / numPerPage
	int totalBlock = 0; // �� block ��=(�ø�)totalPage / pagePerBlock
	int nowPage = 1; // ���� page
	int nowBlock = 1; // ���� block
	
	//page�� ������ �Խù� ���� �� 5, 10, 15, 30
	if (request.getParameter("numPerPage") != null) {
		numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
	}

	int start = 0; //tblboard�� select ���۹�ȣ
	int end = numPerPage; //tblboard�� select ����ȣ

	String keyField = "", keyWord = ""; //�˻��� �ʿ��� ��
	//�˻� �Ҷ�
	if(request.getParameter("keyWord") != null) {
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
	}
	//�˻� �Ŀ� �ٽ� �˻� �ȵ� ������ ��û
	if(request.getParameter("reload") != null && request.getParameter("reload").equals("true")){
		keyField = ""; keyWord = "";
	}

	totalRecord = mgr.getTotalCount(keyField, keyWord);
	//totalRecord = mgr.getTotalCount("name", "�̽±�");
	//out.println(totalRecord);
	
	//nowPage�� ��ö�� �Ͽ�. ���� ��û���� ������ default ���� 0
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	start = (nowPage * numPerPage) - numPerPage; // ex) (1*10)-10 = 0, (2*10)-10 = 10

	//��ü ������ ��
	totalPage = (int) Math.ceil((double) totalRecord / numPerPage);

	//��ü ���� ��
	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);

	//���� ����
	nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);
	
	//��ü ���ڵ� �� / �������� ���ڵ� ��
	//totalPage = (int) Math.ceil((double) totalRecord / numPerPage);
	//out.println(totalRecord + " : " + totalPage);
%>
<html>
<head>
<title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
	
	function block(block) {
		document.readFrm.nowPage.value = <%=pagePerBlock%>*(block-1)+1;
		document.readFrm.submit();
	}
	
	function check() {
		if (document.searchFrm.keyWord.value == "") { //�˻��� ���ϸ�
			alert("�˻�� �Է��ϼ���.");
			document.searchFrm.keyWord.focus();	
			return;
		}
		document.searchFrm.submit();
	}
	
	function list() {
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();	
	}
	
	function numPerFn(numPerPage) {
		//alert(numPerPage);
		document.readFrm.numPerPage.value = numPerPage;
		document.readFrm.submit();
	}
	
	function read(num) {
		document.readFrm.num.value = num;
		document.readFrm.action = "read.jsp";
		document.readFrm.submit();
	}
	
</script>
</head>
<body bgcolor="#ffffcc">
	<div align="center">
		<br />
		<h2>JSPBoard</h2>
		<br />
		<table width="700">
			<tr>
				<td width="700">Total : <%=totalRecord%>Articles( <font
					color="red"><%=nowPage + "/" + totalPage%>Pages</font> )
				</td>
				<td align="right">
					<form name="npFrm" method="post">
						<select name="numPerPage" size="1" onchange="numPerFn(this.form.numPerPage.value)">
    						<option value="5">5�� ����</option>
    						<option value="10" selected>10�� ����</option>
    						<option value="15">15�� ����</option>
    						<option value="30">30�� ����</option>
   						</select>
   					</form>
   					<script>document.npFrm.numPerPage.value="<%=numPerPage%>"</script>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td align="center" colspan="2">
					<%
						Vector<BoardBean> vlist = mgr.getBoardList(keyField, keyWord, start, end);
						int listSize = vlist.size();//������ ȭ�鿡 ������ �Խù� ��ȣ
						if (vlist.isEmpty()) {
							out.println("�Խù��� �����ϴ�.");
						} else {
					%>
					<table cellspacing="0">
						<tr align="center" bgcolor="#D0D0D0">
							<td width="100">�� ȣ</td>
							<td width="250">�� ��</td>
							<td width="100">�� ��</td>
							<td width="150">�� ¥</td>
							<td width="100">��ȸ��</td>
						</tr>
						<%
							for(int i = 0; i < numPerPage; i++){
								if(i==listSize) break;
								BoardBean bean = vlist.get(i);
								int num = bean.getNum();
								String subject = bean.getSubject();
								String name = bean.getName();
								String regdate = bean.getRegdate();
								int depth = bean.getDepth();
								int count = bean.getCount();
								String filename = bean.getFilename();
								int bcount = cmgr.getBCommentCount(num); //����� ����
						%>
						<tr	align="center">
							<td><%=totalRecord-((nowPage-1)*numPerPage)-i%></td>
							<td align="left">
							<%
								if(depth > 0){
									for(int j=0; j<depth; j++){
										out.println("&nbsp;&nbsp;");
									}
								}
							%>
							<a href="javascript:read('<%=num%>')"><%=subject %></a> 
								<%if(filename != null && !filename.equals("")){	%>
								<img src="img/icon_file.gif" align="middle">
								<%}%>
								<%if(bcount > 0){ %>
											<font color="red">(<%=bcount%>)</font>
								
								<%} %>
							</td>
							<td><%=name %></td>
							<td><%=regdate %></td>
							<td><%=count %></td>
						</tr>
						<%
							}
						%>
					</table> <%
 	}
 %>
				</td>
			</tr>
			<tr>
				<td colspan="3"><br/><br/></td>
			</tr>
			<tr>
				<td align="center" width="auto">
				<%
					//����¡�� ǥ�õ� ���ۺ��� �� ������ ����
					int pageStart = (nowBlock-1)*pagePerBlock+1;
					int pageEnd = ((pageStart+pagePerBlock)<totalPage)?(pageStart+pagePerBlock):totalPage+1;
				%>
				<%if(totalPage != 0) { //�Խù��� �ϳ��� ����.%> 
					<!-- ���� ���� -->
						<%if(nowBlock>1) { %>
									<a href="javascript:block('<%=nowBlock-1%>')">prev...</a>
						<%} %>&nbsp;
					<!-- ����¡ -->
					<%
						for(;pageStart<pageEnd; pageStart++){
					%>
						<a href="javascript:pageing('<%=pageStart%>')">
						<%if(nowPage == pageStart){ %><font color="red"><%}%>
						[<%=pageStart%>]</a>
						<%if(nowPage == pageStart){ %></font><%}%>
					<%							
						} //--for
					%>&nbsp;
					<!-- ���� ���� -->
						<%if(totalBlock>nowBlock) { %>
									<a href="javascript:block('<%=nowBlock+1%>')">...next</a>
						<%} %>
					<%}//--if %>
				</td>
				<td align="right"><a href="post.jsp">[�۾���]</a>
				<a href="javascript:list()">[ó������]</a>
				</td>
			</tr>
		</table>
		
		<hr width="750"/>
		
		<form name="listFrm" method="post">
			<input type="hidden" name="reload" value="true">
			<input type="hidden" name="nowPage" value="1">
		</form>
		
		<form  name="searchFrm"  method="post" action="list.jsp">
	<table border="0" width="527" align=center cellpadding="4" cellspacing="0">
 		<tr>
  			<td align="center" valign="bottom">
   				<select name="keyField" size="1" >
    				<option value="name"> �� ��</option>
    				<option value="subject"> �� ��</option>
    				<option value="content"> �� ��</option>
   				</select>
   				<input size="16" name="keyWord">
   				<input type="button"  value="ã��" onClick="javascript:check()">
   				<input type="hidden" name="nowPage" value="1">
  			</td>
 		</tr>
	</table>
</form>
		
		<form name="readFrm">
			<input type="hidden" name="num">
			<input type="hidden" name="nowPage" value="<%=nowPage%>" />
			<input type="hidden" name="keyField" value="<%=keyField%>" />
			<input type="hidden" name="keyWord" value="<%=keyWord%>" />
			<input type="hidden" name="numPerPage" value="<%=numPerPage%>" />
		</form>
		
	</div>
</body>
</html>