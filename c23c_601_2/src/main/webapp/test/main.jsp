<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.green.DAO.WriteDAO" %>
<%@ page import="com.green.DTO.WriteDTO" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- (Optional) Add your custom styles here -->
    <style>
        body {
            padding: 20px;
        }
        .post-form {
            margin-bottom: 20px;
        }
        .post-card {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

    <!-- 글 작성 폼 -->
<header>
	<%@ include file="write.jsp"%>
</header>

    <!-- 작성된 글 목록 -->
<%--     <div id="post-list">
        <h2>작성된 글 목록</h2>
        <%
            for (PostDTO post : posts) {
        %>
            <div class="card post-card">
                <div class="card-body">
                    <h5 class="card-title"><%= post.getCreatedAtFormatted() %></h5>
                    <p class="card-text"><%= post.getContent() %></p>
                    이미지가 있다면 보여주기
                    <% if (post.getImageUrl() != null && !post.getImageUrl().isEmpty()) { %>
                        <img src="<%= post.getImageUrl() %>" class="img-fluid" alt="Uploaded Image">
                    <% } %>
                </div>
            </div>
        <%
            }
        %>
    </div> --%>

    <!-- Bootstrap 스크립트 및 jQuery 로드 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.8/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
