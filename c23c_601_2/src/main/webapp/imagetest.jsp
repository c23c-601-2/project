<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

테스트
${commentList }
<c:forEach items="${commentList}" var="comment">
    <c:if test="${not empty comment.regdate}">
        <p>regdate: ${comment.regdate}</p>
    </c:if>
    <c:if test="${not empty comment.comment}">
        <p>comment: ${comment.comment}</p>
    </c:if>
</c:forEach>

</body>
</html>