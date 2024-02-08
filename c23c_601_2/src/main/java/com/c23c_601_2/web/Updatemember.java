package com.c23c_601_2.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
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


@WebServlet("/updatemember")
public class Updatemember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Updatemember() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("mid")!=null) {
			
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = dao.detailId(session.getAttribute("mid").toString());

			
			if(dto.getMaddress().length()!=0) {
				dto.setPostcode(dto.getMaddress().substring(dto.getMaddress().indexOf("(")+1,dto.getMaddress().indexOf(")")));
				dto.setSelectaddr(dto.getMaddress().substring(dto.getMaddress().indexOf(")")+2,dto.getMaddress().indexOf(",")));
				dto.setDetailaddr(dto.getMaddress().substring(dto.getMaddress().indexOf(",")+2));				
			}
			
			
			request.setAttribute("dto", dto);
			
			RequestDispatcher rd = request.getRequestDispatcher("updatemember.jsp");
			rd.forward(request, response);			
		} else {
			response.sendRedirect("./frontpage");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		
		dto.setMid(request.getParameter("id"));
		dto.setMpw(request.getParameter("pw"));
		dto.setMemail(request.getParameter("email"));
		dto.setMphone(request.getParameter("phone"));
	
		if(request.getParameter("postCode")!="") {
			dto.setMaddress("("+request.getParameter("postCode")+") "+request.getParameter("selectAddr")
			+", "+request.getParameter("detailAddr"));		
			System.out.println(dto.getMaddress());
		} else {
			dto.setMaddress("");
		}
		
		dto.setUpdatedate(now.format(formatter));
		int result = dao.updateMember(dto);
		
		PrintWriter pw = response.getWriter();
		pw.print(result);
	}

}
