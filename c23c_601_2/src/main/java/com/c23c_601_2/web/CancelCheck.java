package com.c23c_601_2.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.c23c_601_2.dao.MemberDAO;
import com.c23c_601_2.dto.MemberDTO;

@WebServlet("/cancelCheck")
public class CancelCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CancelCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("mid")!=null) {
			RequestDispatcher rd = request.getRequestDispatcher("cancelCheck.jsp");
			rd.forward(request, response);			
		} else {
			response.sendRedirect("./frontpage");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
	
		dto.setMid(request.getParameter("id"));
		dto.setMpw(request.getParameter("pw"));
		
		dto =dao.compareId(dto);
		
		int result = dto.getCount();
		
		PrintWriter pw = response.getWriter();
		
		pw.print(result);
		
	}

}
