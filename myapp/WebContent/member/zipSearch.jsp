<%@page import="member.ZipcodeBean"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="member.MemberMgr"></jsp:useBean>
<%
	request.setCharacterEncoding("EUC-KR");
	String search = request.getParameter("search");
	String area3 = null;
	Vector<ZipcodeBean> vlist = null;
	if(search.equals("y")){ //검색 버튼 클릭 시 
		area3 = request.getParameter("area3");
		vlist = mgr.zipcodeRead(area3);
		//out.println(vlist.size());
	}
%>
<html>
<head>
<title>우편번호 검색</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function loadSearch() {
		frm = document.zipFrm;
		if (frm.area3.value=="") {
			alert("도로명을 입력하세요.");
			return;
		}
		frm.action = "zipSearch.jsp";
		frm.submit();
	}
	function sendAdd(zipcode, adds) {
		opener.document.regFrm.zipcode.value = zipcode;
		opener.document.regFrm.address.value = adds;
		self.close();
	}
</script>
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
		<br />
		<!-- action을 넣지 않는 이유 : 자신의 페이지에 나와야 하기 때문에 -->
		<form name="zipFrm" method="post">
			<table border="1">
				<tr>
					<td><br />도로명 입력 : <input name="area3"> <input
						type="button" value="검색" onclick="loadSearch()"></td>
				</tr>
				<!-- 검색결과 시작 -->
				<%
					if(search.equals("y")){
						if(vlist.isEmpty()) { //리스트가 없음
				%>
				<tr>
					<td align="center"><br />검색된 결과가 없습니다.</td>
				</tr>
				<%
						}else { //리스트가 있음
				%>
				<tr>
					<td align="center"><br />※검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다</td>
				</tr>
				<%
							for(int i = 0; i<vlist.size(); i++) { //리스트 보여주기
								ZipcodeBean bean = vlist.get(i);
								String rZipcode = bean.getZipcode();
								String rArea1 = bean.getArea1();
								String rArea2 = bean.getArea2();
								String rArea3 = bean.getArea3();
								String adds = rArea1+ " " + rArea2 + " " +rArea3+" ";
							
						%>
				<tr>
					<td>
					<a href = "#" onclick="javascript:sendAdd('<%=rZipcode%>', '<%=adds%>')" >
					<%=rZipcode+" "+ adds %></a></td>
				</tr>
				<%
							}
						}
					}
				%>
				<!-- 검색결과 끝 -->
				<tr>
					<td align="center"><br /> <a href="#" onClick="self.close()">닫기</a></td>
				</tr>
			</table>
			<input type="hidden" name="search" value="y">
		</form>
	</div>
</body>
</html>