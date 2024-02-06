<%@page import="com.c23c_601_2.daoITboard.ItboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.c23c_601_2.daoITboard.ItboardDAO"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/board.css?ver=0.12" rel="stylesheet" />
<link href="./css/menu.css?ver=0.12" rel="stylesheet" />
<Style>

</Style>
</head>
<%
 	response.setContentType("text/html;charset=UTF-8");
	ItboardDAO dao = new ItboardDAO();
	List<String> headlines = dao.newsTitle();
	List<String> headlines2 = dao.newsUrl();
	List<String> headlines3 = dao.newsDate();
	request.setAttribute("headlines", headlines);
	request.setAttribute("headlines2", headlines2);
	request.setAttribute("headlines3", headlines3);
%>
<body>
	<div>
		<table class="table" border="1" style="text-align: center; width:100%; margin: 0 auto; border-collapse: collapse; border-bottom: 1px solid #8E7C68; border: none;">
			<tr style="border-bottom: 1px solid #FFDC9F">
				<th>번호</th>
				<th>제목</th>
				<th>날짜</th>
			</tr>
			<c:forEach items="${headlines}" var="h" varStatus="status" end="6">
				<tr style="border-bottom: 1px solid white">
					<td>${status.count}</td>
					<td class="newssource"
						onclick="window.location.href='${headlines2[status.index]}'">${h}</td>
					<td>${headlines3[status.index]}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>