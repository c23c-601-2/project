<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	padding:10px;
	margin:0px;
	width: 600px;
	float:left;
}

.myinfo{
	padding :15px;
	width: 600px;
	float:left;
}
.order{
	padding :5px;
}
table{
	margin:0 auto;
	width: 100%;
}
tr {
	border-bottom: 1px solid;
}
td{

	padding : 5px;
	height:3px;
}
.paging{
	padding-top: 10px;
	text-align: center;
}
.btn{
	border: 0px;
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
						<p style="font-weight:bold;">작성한 게시글</p>
						<hr>
						<div class="boardtable">
							<table>
								<thead>
									<tr>
										<td>일자</td>
										<td>제목</td>
										<td>글쓴이</td>
										<td>type</td>
									</tr>
								</thead>
								<tbody id="tablebody">
									<c:forEach items="${detail }" var="de" >								
										<tr>
											<td>${de.regdate }</td>
											<td>${de.subject }</td>
											<td>${de.mid }</td>
											<td>${de.type }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<c:set value="${totalcount / 5 }" var="totalPage"/>
						<fmt:parseNumber integerOnly="true" value="${totalPage }" var="totalPage"  />
						<c:if test="${totalcount %5 gt 0 }">
							<c:set value="${totalPage +1 }" var="totalPage"/>
						</c:if>
						
						<c:set value="1" var="startPage"/>
						<c:if test="${page gt 3 }">
							<c:set value="${page -3}" var="startPage"/>
						</c:if>
						<c:set value="${startPage +4 }" var="endPage"/>
						<c:if test="${endPage gt totalPage }">							
							<c:set value="${totalPage }" var="endPage"/>
						</c:if>
						
						<div class="paging">
							<button <c:if test="${page eq 1 }"> disabled="disabled"</c:if> class="btn" id="fisrtpage">&lt;&lt;</button>
							<button <c:if test="${page -5 lt 1 }"> disabled="disabled" </c:if> class="btn" id="jumpminuspage">&lt;</button>
							
							<c:forEach begin="${startPage }" end="${endPage}" var="num">
								<input type="hidden" value="${num }">
								<button class="pagebtn btn">${num }</button>
							</c:forEach>
							
							<button <c:if test="${page + 5 gt endPage }"> disabled="disabled" </c:if> class="btn" id="jumppage">&gt;</button>
							<button <c:if test="${page eq endPage }"> disabled="disabled"</c:if> class="btn" id="lastpage">&gt;&gt;</button>
						</div>
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
	<script type="text/javascript">
		$(function(){
			$('#fisrtpage').click(function(){
				let startpage = ${startPage};		
				
				$.ajax({
					url:'./mypage',
					type:'post',
					dataType:'json',
					data:{'page':startpage},
					success:function(result){
						$('#tablebody').html("");
						let newline ="";
						for(let i =0; i< result.length;i++){
							newline ="<tr><td>"+result[i].regdate+"</td><td>"+result[i].subject+"</td><td>"+result[i].mid+"</td><td>"+result[i].type+"</td></tr>";
							
							$('#tablebody').append(newline);
						}
					},
					error:function(){
						alert("실패");
					}
				});
				
			});
			
			
			$('.pagebtn').click(function(){
				let page = $(this).prev().val();		
				$.ajax({
					url:'./mypage',
					type:'post',
					dataType:'json',
					data:{'page':page},
					success:function(result){
						$('#tablebody').html("");
						let newline ="";
						for(let i =0; i< result.length;i++){
							newline ="<tr><td>"+result[i].regdate+"</td><td>"+result[i].subject+"</td><td>"+result[i].mid+"</td><td>"+result[i].type+"</td></tr>";
							
							$('#tablebody').append(newline);
						}
					},
					error:function(){
						alert("실패");
					}
				});
				
			});
			
			
		});
	</script>
</body>
</html>












