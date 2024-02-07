package com.c23c_601_2.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.c23c_601_2.dao.MemberDAO;
import com.c23c_601_2.dto.MemberDTO;


@WebServlet("/cancel")
public class Cancel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Cancel() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		HttpSession session = request.getSession();
		
		int result = dao.delMember(request.getParameter("id"));
		
		if(session.getAttribute("mid")!=null) {
			session.removeAttribute("mid");
		}
		if(session.getAttribute("mname")!=null) {
			session.removeAttribute("mname");
		}
		
		session.invalidate();
		
		
		PrintWriter pw = response.getWriter();
		pw.print(result);
	}

}
