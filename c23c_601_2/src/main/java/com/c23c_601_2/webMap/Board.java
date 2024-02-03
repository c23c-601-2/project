package com.c23c_601_2.webMap;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		System.out.println("sdfsd");
		request.setCharacterEncoding("UTF-8");
		int page = 1;
		if (request.getParameter("page") != null && request.getParameter("page") != "") {
			page = Util.str2Int2(request.getParameter("page"));
		}
		// DAO랑 연결
		FoodDAO dao = new FoodDAO();
		List<java.util.Map<String, Object>> list = null;
		list = dao.foodList();
		
		request.setAttribute("list", list);
		// 서블릿을 통과한 "list"를 jsp로 넘겨준다.
		
		FoodDTO dto = new FoodDTO();
		List<FoodDTO> list1 = dao.foodListAll(page);
		
		list1= dao.foodListAll(page);
		
		int totalCount = dao.totalCount();
		
		request.setAttribute("list1", list1);
		request.setAttribute("totalCount", totalCount);
		
		RequestDispatcher rd = request.getRequestDispatcher("/board.jsp");
		rd.forward(request, response);
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}
}