<%@page import="java.util.Map"%>
<%@page import="com.green.DTO.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.green.DAO.BoardDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jstl 선언문 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="./css/board.css" rel="stylesheet" />
</head>
<body>
		<div class=main>
			<article>
				<h1>BOARD</h1>

				<c:choose>
					<c:when test="${fn:length(list) gt 0 }">
						<table>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>글쓴이</th>
								<th>날짜</th>
								<th>읽음</th>
							</tr>
							<c:forEach items="${list }" var="row">
								<tr>
									<td>${row.no }</td>
									<td class='title'>${row.title }</a>
									</td>
									<td>${row.write }</td>
									<td>${row.date }</td>
									<td>${row.count }</td>
								</tr>
							</c:forEach>
						</table>
					</c:when>
					<c:otherwise>
						<h1>출력할 값이 없음</h1>
					</c:otherwise>
				</c:choose>
			</article>
		</div>
</body>
</html>