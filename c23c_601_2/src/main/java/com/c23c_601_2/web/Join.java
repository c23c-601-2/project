package com.c23c_601_2.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.c23c_601_2.dao.MemberDAO;
import com.c23c_601_2.dto.MemberDTO;

@WebServlet("/join")
public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Join() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		RequestDispatcher rd = request.getRequestDispatcher("join.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		dto.setMid(request.getParameter("id"));
		dto.setMpw(request.getParameter("pw"));
		dto.setMname(request.getParameter("name"));
		dto.setMemail(request.getParameter("email"));
		dto.setMphone(request.getParameter("phone"));
		dto.setMaddress("("+request.getParameter("postCode")+") "+request.getParameter("selectAddr")
		+", "+request.getParameter("detailAddr"));
		
		int result = dao.insertMember(dto);
		
		PrintWriter pw = response.getWriter();
		pw.print(result);
		
	}

}
