<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.c23c_601_2.daoGR.PdsDTO"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="ssi.jsp" %>
<link href="./css/imageList.css" rel="stylesheet">
<%-- <header>
	<%@ include file="header.jsp"%>
</header> --%>

<!-- 본문시작 pdsList.jsp-->
<h3 class="h3">* 포토갤러리 *</h3>
<p><a href="pdsForm.jsp">[사진올리기]</a></p>

<%
    ArrayList<PdsDTO> list = dao.list();
    if (list == null || list.isEmpty()) {
        out.println("관련 자료 없음 T.T");
    } else {
        /* PdsDTO dto; */ // 반복문 밖에서 선언
%>
전체 글 개수 : <%= list.size() %> <br>
<!-- <table class="list_table">
    <tr>
        <th>제목</th>
        <th>사진</th>
        <th>작성자</th>
        <th>조회수</th>
        <th>작성일</th>
    </tr> -->
<%
        for (int idx = 0; idx < list.size(); idx++) {
            dto = list.get(idx); // 이미 선언된 변수를 사용
            String formattedRegdate = "";
            if (dto.getRegdate() != null) {
                try {
                    formattedRegdate = new SimpleDateFormat("yyyy-MM-dd").format(dto.getRegdate());
                } catch (IllegalArgumentException e) {
                    // 다른 형식으로 시도
                    if (dto.getRegdate() != null && dto.getRegdate().matches("\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}")) {
                        formattedRegdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dto.getRegdate());
                    } else {
                        formattedRegdate = "";
                    }
                }
            }
            if (dto.getFilename() != null) {
                %>

<div class="post">
  <div class="post-image-container">
    <img class="post-image" src="<%= request.getContextPath() + "/webapp/storage/" + dto.getFilename() %>" alt="Post Image">
  </div>
  <div class="post-info">
    <span class="post-writer"><%=dto.getWname()%></span>
    <div class="post-details">
      <h4 class="post-subject"><%=dto.getSubject()%></h4>
      <span class="post-date"><%=formattedRegdate%></span>
      <span class="post-readcnt"><%=dto.getReadcnt()%></span>
    </div>
  </div>
  <div class="post-content">
    </div>
</div>


    <%
            }
        }// for end
        // out.println("</table>");
        
    }// if 
    %>
    
