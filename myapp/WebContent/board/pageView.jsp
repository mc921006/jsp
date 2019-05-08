<%@page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	int totalRecord = //총게시물수
			Integer.parseInt(request.getParameter("totalRecord"));
	int numPerPage = 10;//페이지당 레코드수
	int pagePerBlock = 15;//블럭당 페이지수
	int totalBlock = 0;
	int totalPage = 0;
	int nowPage = 1;//현재페이지
	int nowBlock = 1;//현재블럭

	int start = 0; //디비의 select 시작번호
	int end = numPerPage; //시작번호로 부터 가져올 select 갯수

	//nowPage를 요철한 겅우. 만약 요청하지 않으면 default 값이 0
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	start = (nowPage * numPerPage) - numPerPage; // ex) (1*10)-10 = 0, (2*10)-10 = 10

	//전체 페이지 수
	totalPage = (int) Math.ceil((double) totalRecord / numPerPage);

	//전체 블럭 수
	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);

	//현재 블럭
	nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);
%>
<html>
<head>
<title>페이징 & 블럭 처리 테스트</title>
</head>
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
</script>
<body bgcolor="#FFFFCC">
	<div align="center">
		<h2>페이징 & 블럭 처리 테스트</h2>
		<table width="700">
			<tr>
				<td width="700" align="center">Total : <%=totalRecord%>Articles(
					<font color="red"><%=nowPage + "/" + totalPage%>Pages</font> )
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td>게시물 번호 : &nbsp;</td>

				<%
					int listSize = totalRecord - start;
					for (int i = 0; i < numPerPage; i++) {
						if(i == listSize) break;
				%>
				<td align="center">
					<%=totalRecord-((nowPage-1)*numPerPage)-i %>
				</td>
				<%
					}
				%>
				<td align="center">&nbsp;</td>
			</tr>
		</table>
		<!-- 페이징 & 블럭 시작 -->
		<table>
			<tr>
				<td>
				<%
					//페이징에 표시될 시작변수 및 마지막 변수
					int pageStart = (nowBlock-1)*pagePerBlock+1;
					int pageEnd = ((pageStart+pagePerBlock)<totalPage)?(pageStart+pagePerBlock):totalPage+1;
				%>
				<%if(totalPage != 0) { //게시물이 하나라도 있음.%> 
					<!-- 이전 블럭 -->
						<%if(nowBlock>1) { %>
									<a href="javascript:block('<%=nowBlock-1%>')">prev...</a>
						<%} %>&nbsp;
					<!-- 페이징 -->
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
					<!-- 다음 블럭 -->
						<%if(totalBlock>nowBlock) { %>
									<a href="javascript:block('<%=nowBlock+1%>')">...next</a>
						<%} %>
					<%}//--if %>
				</td>
			</tr>
		</table>

		<!-- 페이징 & 블럭 끝 -->
		<hr width="45%">
		<form name="readFrm">
			<input type="hidden" name="totalRecord" value="<%=totalRecord%>" />
			<input type="hidden" name="nowPage" value="<%=nowPage%>" />
		</form>
		<b> totalRecord : <%=totalRecord%>&nbsp; numPerPage : <%=numPerPage%>&nbsp;
			pagePerBlock : <%=pagePerBlock%>&nbsp; totalPage : <%=totalPage%>&nbsp;<br />
			totalBlock : <%=totalBlock%>&nbsp; nowPage : <%=nowPage%>&nbsp;
			nowBlock : <%=nowBlock%>&nbsp; start : <%=start%>&nbsp;
		</b>
		<p />
		<input type="button" value="TotalRecord 입력폼"
			onClick="javascript:location.href='pageView.html'">
	</div>
</html>








