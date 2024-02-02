package com.c23c_601_2.webMap;

import java.io.IOException;

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

@WebServlet("/write")
public class Write extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Write() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("write.jsp"); // url 고정, 화면만 변환
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int grade = Util.str2Int(request.getParameter("grade"));
		
		FoodDTO dto = new FoodDTO();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setGrade(grade);
		
		FoodDAO dao = new FoodDAO();
		int result = dao.write(dto);
		
		if (result == 1) {
			response.sendRedirect("./board");
		} else {
			response.sendRedirect("./error");
		}
	}

}
