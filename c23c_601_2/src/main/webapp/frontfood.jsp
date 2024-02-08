<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/food.css" rel="stylesheet"/>
<script>
function listCheck() {
    var title = $('#search').val();
	let p1 = $('.mainsearch .c1 .dfg');
	let p2 = $('.mainsearch .c1 .asd');
	//let p1 = $(this).parents.('.mainsearch').child('.c1');
	
	// this를 통해 mainsearch찾는다.
    /* var mainElement = $(this).parent('.mainsearch');
    var p2 = mainElement.children('.c1').children('table.write').children('tbody.asd');
	var p1 = p2.children('.dfg'); */
    
    $.ajax({
       url : './food',
       type : 'post',
       dataType : 'json',
       data : {title : title},
       success : function(response) {
    	   //alert("json받아오니?" + list);
    	   var list = response.list;
          if (list.length > 0) {
			alert("아래 리스트를 확인해보십시오. " + list.length + " : " + p2.html());
			p1.remove();
			// tr은 리무브 시켜서 없애고, tbody는 appendtrtd를 foreach문으로 돌린다.
			let data = '';
			for(let i=0; i< list.length; i++){
				data += '<tr class="dfg" style="text-align: center;"><td>' + list[i].food_title + '</td>';
				data += '<td style=text-align: center;">' + list[i].food_like + '/' + list[i].food_dislike + '</td>';
				data += '<td style=text-align: center;">' + list[i].grade + '</td></tr>';
				/* 서버에서 jstl 자바 ,el 에서 결과값이 나오고
				나온 상태로 브라우저html, 제이커리, css, 자바스크립트 */
			}
			//data += '</tbody>';
            alert("리무브 됐니?" + p1.html());
         // 위에서 생성한 HTML 코드를 jQuery를 사용하여 tbody 요소를 가진 특정 요소에 추가할 수 있습니다.
            p2.append(data);
            
          } else {
            alert("현재 작성된 후기가 없습니다. 후기 작성 페이지로 가겠습니다.");
            window.location.href = './write';
          }
       },
       error : function(request, status, error) {
          alert("상호를 입력하세요.");
       }
    });
 }
</script>
</head>
<body>
	<table class="write">
		<div style="font-size: 30px; text-align: center;"> ★☆ 후기 리스트 ☆★ </div>
		<thead>
			<tr style="font-size: 16px">
				<th class="d1">가게 이름</th>
				<th class="d2">좋아요 / 싫어요</th>
				<th class="d2">평점</th>
			</tr>
		</thead>
		<tbody class="asd">
			<c:forEach items="${list }" var="row">
				<!-- tr은 리무브 시켜서 없애고, tbody는 appendtrtd를 foreach문으로 돌린다. -->
				<tr class="dfg">
					<td class="d1">${row.food_title }</td>
					<td class="d2">${row.food_like }/ ${row.food_dislike }</td>
					<td class="d2">${row.grade }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>