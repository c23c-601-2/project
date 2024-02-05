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


@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
	      String pw = request.getParameter("pw");
	      HttpSession session = request.getSession();
	      
	      MemberDAO dao = new MemberDAO();
	      MemberDTO dto = new MemberDTO();
	      
	      dto.setMid(id);
	      dto.setMpw(pw);
	      dto = dao.compareId(dto);
	      
	      
	      if(dto.getCount() == 1) {
	         session.setAttribute("mid", dto.getMid());
	         session.setAttribute("mname", dto.getMid());
	      }
	      
	      PrintWriter prw = response.getWriter();
	      prw.print(dto.getCount());

}
}
