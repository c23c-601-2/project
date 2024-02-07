<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.c23c_601_2.daoGR.PdsDTO"%>
<%@ page import="com.c23c_601_2.daoGR.PdsDAO"%>

<html>
<head>
    <title>Image List</title>
</head>
<body>

    <h2>Image List</h2>

    <%-- 이미지 목록을 DAO를 통해 가져오기 --%>
    <%
        PdsDAO dao = new PdsDAO();
        ArrayList<PdsDTO> imageList = dao.list();
        request.setAttribute("imageList", imageList);
    %>

    <c:forEach var="dto" items="${imageList}">
        <div>
            <p><strong>${dto.subject}</strong></p>
            <p>Writer: ${dto.wname}</p>
            <p>Upload Date: ${dto.regdate}</p>
            <p>Read Count: ${dto.readcnt}</p>

            <%-- Decode Base64 image data and display --%>
            <img src="data:image/jpeg;base64,${dto.base64ImageData}" alt="Image">
            <br><br>
        </div>
    </c:forEach>
 
</body>
</html>
