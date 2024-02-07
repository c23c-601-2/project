<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IT뉴스 게시판</title>
<link href="./css/board.css?ver=0.12" rel="stylesheet" />
<link href="./css/menu.css?ver=0.12" rel="stylesheet" />
<style>
body {
	background-color: black;
	color: white;
}

.chat {
	width: 230px;
	margin-left: 5px;
}

.wrap {
	/* display: flex; */
	background-color: #F5ECE4;
	width:1308px;
	margin: 0 auto;
}
footer {
	background-color: #F2E3CF;
}

.footercontent{
	text-align: center;
	padding: 5px;
}
.tablediv{
	width:calc(100% - 235px);
	float:right;
	text-align: center;
	display: flex;
	justify-content: center;
}

.table{
	background-color: white;
	width:90%;
}
.tablewidth{
	width:90%;
}
</style>

</head>
<body>
	<div class="wrap">
		<div>
			<%@ include file="./header.jsp"%>
			<%@ include file="./nav.jsp"%>
		</div>
		<div style="margin:0 auto;background-color:#F5ECE4;min-height: 1700px">
			<div class="chat" style="float:left">
			
				<c:import url="./chat.jsp"/>
				
				<%-- <%@ include file="./chat.jsp"%> --%>
			</div>
			
			<div class="tablediv">
				<div class="tablewidth">
					<table class="table" border="1">
						<caption class="caption">IT뉴스</caption>
						<caption class="caption1">출처 : 네이버</caption>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>날짜</th>
						</tr>
						<c:forEach items="${headlines}" var="h" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td class="newssource"
									onclick="window.location.href='${headlines2[status.index]}'">${h}</td>
								<td>${headlines3[status.index]}</td>
							</tr>
						</c:forEach>
					</table>					
				</div>
			</div>
		
		</div>
		<footer>
			<%@ include file="footer.jsp" %>
		</footer>
	</div>
</body>
</html>