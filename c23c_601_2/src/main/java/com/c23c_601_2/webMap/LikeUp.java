package com.c23c_601_2.webMap;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.c23c_601_2.dao.FoodDAO;
import com.c23c_601_2.dto.LikeCountDTO;
import com.c23c_601_2.util.Util;

@WebServlet("/likeUp")
public class LikeUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LikeUp() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int result = 0 ;
		LikeCountDTO dto = new LikeCountDTO();
		FoodDAO dao = new FoodDAO();
		String no = request.getParameter("no");
		String mid = (String)session.getAttribute("mid");
		
		dto.setLno(Integer.parseInt(no));
		dto.setLmid(mid);
		result = dao.likeUp(dto);
		System.out.println(result);
		
		PrintWriter pw = response.getWriter();
		pw.print(result);
	}
}
