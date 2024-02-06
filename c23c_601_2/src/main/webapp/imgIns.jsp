<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.c23c_601_2.daoGR.PdsDTO" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.c23c_601_2.daoGR.PdsDAO" %>
<%@ include file="ssi.jsp" %>


<!DOCTYPE html>
<!-- 본문시작 pdsIns.jsp -->
<h3>* 사진 올리기 결과 *</h3>
<%
try {
    // 1) 첨부된 파일 저장하기
    String saveDirectory = application.getRealPath("/webapp/storage");

    // 디렉토리 생성 코드 추가
    File saveDir = new File(saveDirectory);
    if (!saveDir.exists()) {
        saveDir.mkdirs();
    }

    int maxPostSize = 1024 * 1024 * 10;
    String encoding = "UTF-8";

    MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
    dto = new PdsDTO();
    
    String wname = mr.getParameter("wname").trim();
    String subject = mr.getParameter("subject").trim();
    String passwd = mr.getParameter("passwd").trim();

    Enumeration files = mr.getFileNames();
    if (files.hasMoreElements()) {
        String fileName = (String) files.nextElement();
        String originalFileName = mr.getOriginalFileName(fileName);
        String fileSystemName = mr.getFilesystemName(fileName);

        // 이미지 파일 경로 저장
        String imagePath = "/webapp/storage/" + fileSystemName; 
        dto.setFilename(fileSystemName);
        dto.setImagePath(imagePath); // 이미지 파일 경로 저장
    }

    dto.setWname(wname);
    dto.setSubject(subject);
    dto.setPasswd(passwd);

    boolean flag = dao.insert(dto);
    
        if (flag) {
            out.println("<script>");
            out.println("	alert('사진을 추가했습니다.')");
            out.println("	location.href='imgList'");
            out.println("</script>");
            out.println("<img src=\"" + dto.getImagePath() + "\" alt=\"Uploaded Image\">");
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
