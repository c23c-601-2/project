<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!DOCTYPE html>
<html>

<style>
.d1 {
	width: 10%;
}

.d2 {
	width: 20%;
}

.d3 {
	width: 30%;
}

.mainstyle {
	width: 50%;
	margin: 0 auto;
}
</style>


<head>
<meta charset="UTF-8">
<title>후기 게시판</title>
<link href="./css/add.css?ver=0.12" rel="stylesheet" />
<script type="text/javascript" src="./js/menu.js"></script>
<style>
tbody>tr>td {
	text-align: center;
}
</style>
<script>
$(function() {
	$('#searchBtn').click(function() {
		let search = $('#search').val();
		location.href = "./board?search=" + search;
	});
	$('.checkmid').click(function() {
        var mid = "${sessionScope.mid}";
        if (!mid) {
            alert("로그인 후 이용해 주세요");
        } else {
            window.location.href = "./write";
        }
    });
	$('.likeBtn').click(function() {
        var mid = "${sessionScope.mid}";
        if (mid == null) {
            alert("로그인 후 이용해 주세요");
            location.href = "./login"
        }
    });
	$('.dislikeBtn').click(function() {
        var mid = "${sessionScope.mid}";
        if (mid = null) {
            alert("로그인 후 이용해 주세요");
            location.href = "./login"
        }
    });
});
</script>
</head>
<body>
	<div class="container">
		<%@ include file="header.jsp"%>
		<%@ include file="nav.jsp"%>
		<div class="main">
			<div class="mainStyle">
				<article>
					<form action="./board">
						<div class="search">
							가게이름 검색하기 :<input type="text" id="search">
							<button id="searchBtn">검색</button>
						</div>
					</form>
					<c:choose>
						<c:when test="${fn:length(list) gt 0 }">
							<table>
								<thead>
									<tr>
										<th class="d1">번호</th>
										<th class="d2">가게 이름</th>
										<th class="d3">후기 내용</th>
										<th class="d1">작성자</th>
										<th class="d1">날짜</th>
										<th class="d1">좋아요</th>
										<th class="d1">싫어요</th>
										<th class="d2">평점</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list1}" var="row">
										<tr>
											<td class="d1">${row.no }</td>
											<td class="d3">${row.title }</td>
											<td class="d3">${row.content }</td>
											<td class="d1">${row.write }</td>
											<td class="d1">${row.date }</td>

											<td class="d1">${row.like }
													<button class="likeBtn">
														<img alt="up" src="./img/up.jpg" width="15px;">
													</button>
											</td>

											<td class="d1">${row.dislike }
													<button class="dislikeBtn">
														<img alt="down" src="./img/down.jpg" width="15px;">
													</button>
											</td>

											<td class="d1">${row.grade }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<c:set var="totalPage" value="${totalCount / 10 }" />
							<fmt:parseNumber integerOnly="true" value="${totalPage }"
								var="totalPage" />

							<c:if test="${totalCount % 10 gt 0}">
								<c:set var="totalPage" value="${totalPage + 1 }" />
							</c:if>

							<c:set var="startPage" value="1" />
							<c:if test="${page gt 5 }">
								<c:set var="startPage" value="${page - 5 }" />
							</c:if>

							<c:set var="endPage" value="${startPage + 9 }" />${endPage }
							<c:if test="${endPage gt totalPage  }">
								<c:set var="endPage" value="${totalPage }" />
							</c:if>

							<div class="paging">
								<button onclick="paging(1)">⏮️</button>
								<button
									<c:if test="${page - 10 lt 1 }">disabled="disabled"</c:if>
									onclick="paging(${page - 10 })">◀️</button>
								<c:forEach begin="${startPage }" end="${endPage }" var="p">
									<button <c:if test="${page eq p }"> class ="currentBtn" </c:if>
										onclick="paging(${p})">${p }</button>
								</c:forEach>
								<button
									<c:if test="${page + 10 gt totalPage }">disabled="disabled"</c:if>
									onclick="paging(${page + 10 })">▶️</button>
								<button onclick="paging(${totalPage })">⏭️</button>
							</div>
						</c:when>
						<c:otherwise>
							<h1>출력할 값이 없습니다.</h1>
						</c:otherwise>
					</c:choose>
							<button class="checkmid" onclick="url('./write')">글쓰기</button>
					<c:if test="${sessionScope.mid ne null }">
						<br> ${sessionScope.mid}님 반갑습니다.
					</c:if>
				</article>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function paging(no){
		location.href="./board?page="+no;
	}
</script>
</body>
</html>