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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"
	integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<link href="./css/frontpage.css" rel="stylesheet"/>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="styleSheet" href="./css/join.css?ver=1.3">
<style type="text/css">
.mypagemainStyle{
	width:100%;
	height:73.4vh;
	background-color: #F2F2F2;

}
body{
	margin:0px;
	padding:0px;
}

.mypage{
	margin:0 auto;
}
.orderform{
	padding:15px;
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

tbody tr:hover{
	background: orange;
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
.pageline{
	border: 1px solid #2E64FE;
}
.common > div {
	margin-bottom: 5px;
}

.common{
	margin-bottom: 10px;
}

#com1{
	color:#c1c1c1;
	font-size:8pt;
}
#com2{
	font-weight: bold;
	font-size:25px;
}
#com3{
	color:#c1c1c1;
	font-size:8pt;
	
}
.totalcommon{
	margin-bottom: 10px;
}

.commonBorder{
	border: 1px solid;
	padding : 20px;
}
.myinfo > a{
	text-decoration: none;
}

.myinfo > a:visit{
	color: gray;
}

.myinfo > a:link{
	color: gray;
}

.myinfo > a:hover{
	color: black;
}
</style>

</head>
<body>
	<div class="main">
		<div>
			<%@ include file="header.jsp"%>
			<%@ include file="nav.jsp"%>
		</div>
		<div class="mypagemainStyle">
			<div class="mypage">
				<div class="orderform">
					<div class="order rounded commonBorder">
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
							<c:set value="${page -2}" var="startPage"/>
						</c:if>
						<c:set value="${startPage +4 }" var="endPage"/>
						<c:if test="${endPage gt totalPage }">							
							<c:set value="${totalPage }" var="endPage"/>
						</c:if>
						
						<div class="paging">
							<button <c:if test="${page eq 1 }"> disabled="disabled"</c:if> class="btn" id="fisrtpage" onclick="page(1)">&lt;&lt;</button>
							<button <c:if test="${page -5 lt 1 }"> disabled="disabled" </c:if> class="btn" id="jumpminuspage" onclick="page(${page - 5})">&lt;</button>
							
							<c:forEach begin="${startPage }" end="${endPage}" var="num">
								<%-- <input type="hidden" value="${num }"> --%>
								<button class="pagebtn btn <c:if test="${page eq num }">pageline btn-outline-primary</c:if>" onclick="page(${num})">${num }</button>
							</c:forEach>
							
							<button <c:if test="${page + 5 gt totalPage }"> disabled="disabled" </c:if> class="btn" id="jumppage" onclick="page(${page + 5})">&gt;</button>
							<button <c:if test="${page eq totalPage }"> disabled="disabled"</c:if> class="btn" id="lastpage" onclick="page(${totalPage})">&gt;&gt;</button>
						</div>
					</div>
					
					<div class="comment">
					</div>
				</div>
				
				<div class="myinfo">
					<div class="totalcommon rounded commonBorder">
						<div class="common" style="height:69.5px">
							<div style="width:80%;float:left">
								<div id="com1">기본정보</div>
								<!-- 아이콘 -->
								<div id="com2">${dto.mname }</div>
								<div id="com3">${dto.mid }</div>						
							</div>
							<div style="width:20%;float:right">
								<button class="btn pagebtn pageline btn-outline-primary" id="updatebtn" onclick="location.href='./memberCheck'">개인정보 수정</button>
							</div>
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
					<a href="./cancelCheck">회원탈퇴 &gt;</a>
				</div>
			</div>
		</div>
		
		<footer>
			<%@ include file="footer.jsp" %>
		</footer>
	</div>
	<script type="text/javascript">
		function page(i){
			location.href="./mypage?page="+i;
		}
		/* $(function(){
			$('#jumpminuspage').click(function(){
				let startpage = ${startPage -5};		
				
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
			
			$('#jumppage').click(function(){
				let startpage = ${startPage +5};		
				
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
			
			
		}); */
	</script>
</body>
</html>












