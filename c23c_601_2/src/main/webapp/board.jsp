<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 게시판</title>
</head>
<body>
	<div class="container">
		<header>
			<%@ include file="menu.jsp"%>
			<!-- 일단 먼저 내거 파일 가져오고 자바 파일 실행 -->
		</header>
		<div class="main">
		<div class="mainStyle"><div>

				<article>
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
										<td class="w1">${row.no }</td>
										<td class="title">
										<a href="./detail?page=${page } &no=${row.no }">${row.title}
										<c:if test="${row.comment ne 0 }">
										<span> [${row.comment}]</span></c:if>
                                	    </a></td>
										<td class="w2">${row.write }</td>
										<td class="w1">${row.date }</td>
										<td class="w1">${row.count }</td>
									</tr>
								</c:forEach>
							</table>
							</article>
							
</body>
</html>