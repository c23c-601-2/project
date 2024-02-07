package com.c23c_601_2.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.c23c_601_2.dao.MemberDAO;


@WebServlet("/pwCheck")
public class PwCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PwCheck() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mpw = request.getParameter("mpw");
		String mid = request.getParameter("mid");
		
		MemberDAO dao = new MemberDAO();
		
		int result = dao.pwCheck(mpw,mid);
		
		PrintWriter pr = response.getWriter();
		pr.print(result);
	}

}



