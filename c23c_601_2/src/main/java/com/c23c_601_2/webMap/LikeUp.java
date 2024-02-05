package com.c23c_601_2.webMap;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.c23c_601_2.dao.FoodDAO;
import com.c23c_601_2.dto.FoodDTO;
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
		int result = 0 ;
		FoodDTO dto = new FoodDTO();
		FoodDAO dao = new FoodDAO();
		
		String no = request.getParameter("no");
		String mid = request.getParameter("mid");
		String like = request.getParameter("like");
		
		dto.setNo(Util.str2Int2(no));
		dto.setMid(mid);
		dto.setLike(Util.str2Int2(like));
		
		dao.likeUp(dto);
		
		System.out.println(result);
		request.setAttribute("list1", result);
		
		
		if (result == 1) {
			response.sendRedirect("./board");
		} else {
			response.sendRedirect("./error");
		}
		
	}
}
