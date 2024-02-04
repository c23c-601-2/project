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

@WebServlet("/boardSearch")
public class BoardSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardSearch() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("search : " + request.getParameter("search"));
		
				//데이터 
				FoodDAO dao = new FoodDAO();
				List<FoodDTO> list = null;
				list = dao.searchTitle(request.getParameter("search"));
//				if(request.getParameter("search") != null && !request.getParameter("search").equals("")) {
//				} else {			
//					list = dao.searchTitle();
//				}
				
				request.setAttribute("list1", list);
				
				RequestDispatcher rd = request.getRequestDispatcher("/board.jsp");
				rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
