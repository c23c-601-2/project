<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.c23c_601_2.iBoard.PdsDTO" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.c23c_601_2.iBoard.PdsDAO" %>
<%@ include file="ssi.jsp" %>

<!-- 나머지 코드... -->


<!DOCTYPE html>
<!-- 본문시작 pdsIns.jsp -->
<h3>* 사진 올리기 결과 *</h3>
<%
try {
    // 1) 첨부된 파일 저장하기
    String saveDirectory = application.getRealPath("/storage");

    // 디렉토리 생성 코드 추가
    File saveDir = new File(saveDirectory);
    if (!saveDir.exists()) {
        saveDir.mkdirs();
    }

    int maxPostSize = 1024 * 1024 * 10;
    String encoding = "UTF-8";

    MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());

    // 2) 저장된 파일명, 파일크기 가져오기
    String item = "";
    String fileName = ""; // 파일명
    long filesize = 0;    // 파일크기
    File file = null;

    Enumeration files = mr.getFileNames();
    while (files.hasMoreElements()) {
        item = (String) files.nextElement();
        fileName = mr.getFilesystemName(item);
        if (fileName != null) {
            file = mr.getFile(item);  // 파일담기
            if (file.exists()) {        // 파일이 존재하는가
                filesize = file.length();
            }// if end
        }// if end
    }// while end

    // 3) tb_pds 테이블에 행 추가하기
    String wname = mr.getParameter("wname").trim();
    String subject = mr.getParameter("subject").trim();
    String passwd = mr.getParameter("passwd").trim();

    // 이미 선언된 dto와 dao를 사용
    dto.setWname(wname);
    dto.setSubject(subject);
    dto.setPasswd(passwd);
    dto.setFilename(fileName);
    dto.setFilesize(filesize);

    boolean flag = dao.insert(dto);
    
        if (flag) {
            out.println("<script>");
            out.println("	alert('사진을 추가했습니다.')");
            out.println("	location.href='pdsList.jsp';");
            out.println("</script>");
        } else {
            out.println("<p>사진 추가 실패 T.T</p>");
            out.println("<p><a href='javascript:history.back();'>[다시시도]</a></p>");
        }// if end
    } catch (Exception e) {
        out.println(e);
        out.println("<p>사진 올리기 실패 T.T</p>");
        out.println("<a href='javascript:history.back()'>");
    }// try end
%>
<!-- 본문끝 -->
