<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>

<%@page import="com.c23c_601_2.iBoard.*"%>
<%@page import="com.c23c_601_2.iBoard.PdsDTO"%>

<jsp:useBean id="dao" class="com.c23c_601_2.iBoard.PdsDAO"></jsp:useBean>
<jsp:useBean id="dto" class="com.c23c_601_2.iBoard.PdsDTO"></jsp:useBean>


<% request.setCharacterEncoding("UTF-8");%>
