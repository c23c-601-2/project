<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>

<%@page import="com.c23c_601_2.daoGR.*"%>
<%@page import="com.c23c_601_2.daoGR.PdsDTO"%>

<jsp:useBean id="dao" class="com.c23c_601_2.daoGR.PdsDAO"></jsp:useBean>
<jsp:useBean id="dto" class="com.c23c_601_2.daoGR.PdsDTO"></jsp:useBean>


<% request.setCharacterEncoding("UTF-8");%>
