<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.c23c_601_2.daoGR.PdsDTO"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="ssi.jsp" %>
<link href="./css/imageList.css" rel="stylesheet">
<link href="./css/imageCommon.css" rel="stylesheet">
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
<table class="list_table">
    <tr>
        <th>제목</th>
        <th>사진</th>
        <th>작성자</th>
        <th>조회수</th>
        <th>작성일</th>
    </tr>
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

    <tr>
        <td><%=dto.getSubject()%></td>
        <td><img src="<%= request.getContextPath() + "/webapp/storage/" + dto.getFilename() %>" width="50"></td>
		<td><%=dto.getWname()%></td>
        <td><%=dto.getReadcnt()%></td>
        <td><%=formattedRegdate%></td> 
    </tr>
    <%
            }
        }// for end
        out.println("</table>");
        
    }// if 
    %>
    
<body>
        <section id="container">
            <header id="header">
                <section class="inner">   
                </section>
            </header>
        </section>
		<section id="container">
            <header id="header">
                <section class="inner">
                    <h1 class="logo">
                        <a href="index.html">
                        </a>
                    </h1>
                </section>
            </header>
        </section>
</body>
