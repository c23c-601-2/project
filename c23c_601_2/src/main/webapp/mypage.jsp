<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Page</title>
<link rel="styleSheet" href="./css/join.css?ver=1.2">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<style type="text/css">



.mypage{
	margin:0 auto;
	
	margin-top:120px;
	width: 1200px;
	height: 100vh;
}
.orderform{
	padding:0px;
	margin:0px;
	width: 600px;
	border: 1px solid; 
	float:left;
}

.myinfo{
	padding:0px;
	margin:0px;
	width: 600px;
	border: 1px solid;
	float:left;
}
</style>
</head>
<body>
	<div class="main">
		<div class="mainStyle">
			<article>
			<div class="mypage">
				
				<div class="orderform">
					<div class="order">
						주문내역
						<hr>
						<table>
							<thead>
								<tr>
									<td>일자</td>
									<td>제목</td>
									<td>글쓴이</td>
									<td>type</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${detail }" var="detail" >								
									<tr>
										<td>${detail.date }</td>
										<td>${detail.title }</td>
										<td>${detail.write }</td>
										<td>${detail.type }</td>
									</tr>
								</c:forEach>
							
							</tbody>
						</table>
					</div>
					
					<div class="comment">
					
					</div>
				</div>
				
				<div class="myinfo">
					<div>
						<div>
							기본정보
							<!-- 아이콘 -->
							${dto.mname }
							${dto.mid }
						</div>
					
						<hr>
						<div>
							<c:choose>
								<c:when test="${dto.mphone eq null || dto.mphone eq ''}">
									없음 <button>설정</button>
								</c:when>
								<c:otherwise>
									${dto.mphone }
								</c:otherwise>
							</c:choose>
						</div>
						<hr>
						<div>
							<c:choose>
								<c:when test="${dto.memail eq null || dto.mphone eq ''}">
									없음 <button>설정</button>
								</c:when>
								<c:otherwise>
									${dto.memail }
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					회원탈퇴
				</div>
			</div>
			</article>
		</div>
	</div>
</body>
</html>