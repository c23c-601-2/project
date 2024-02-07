package com.c23c_601_2.webMap;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.c23c_601_2.dao.FoodDAO;
import com.c23c_601_2.dto.FoodDTO;
import com.c23c_601_2.util.Util;

@WebServlet("/board")
public class Board extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Board() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("보드");
		request.setCharacterEncoding("UTF-8");
		FoodDAO dao = new FoodDAO();
		int page = 1;
		
		if (request.getParameter("page") != null && request.getParameter("page") != "") {
			page = Util.str2Int2(request.getParameter("page"));
		}
		
		List<java.util.Map<String, Object>> list = null;
		list = dao.foodList();
		request.setAttribute("list", list);
		
		List<FoodDTO> list1 = null;
		if(request.getParameter("search") == null) {
			list1= dao.foodListAll(page);
		} else {			
			list1 = dao.foodListAll(request.getParameter("search"));
		}
		request.setAttribute("list1", list1);
		
		int totalCount = dao.totalCount();
		request.setAttribute("totalCount", totalCount);

		RequestDispatcher rd = request.getRequestDispatcher("/board.jsp");
		rd.forward(request, response);
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
}