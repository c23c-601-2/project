package com.c23c_601_2.webMap;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.c23c_601_2.dao.FoodDAO;
import com.c23c_601_2.dto.FoodDTO;

@WebServlet("/food")
public class Food extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Food() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//DAO랑 연결
		FoodDAO dao = new FoodDAO();
		//FoodDTO dto = new FoodDTO();
		List<java.util.Map<String, Object>> list = null;
		list= dao.foodList();

		request.setAttribute("list", list);
		// 서블릿을 통과한 "list"를 jsp로 넘겨준다.
		
		RequestDispatcher rd = request.getRequestDispatcher("/food.jsp");
	    rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//System.out.println("search : "+ request.getParameter("search"));
		
		/* 수정 전
		FoodDAO dao = new FoodDAO();
		List<FoodDTO> list = dao.searchList(request.getParameter("search"));
		
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("/food.jsp");
	    rd.forward(request, response);
	    */
		
		HttpSession session = request.getSession();
		String mname = (String) session.getAttribute("mname");
		if (mname != null) {
		    System.out.println("현재 접속한 사용자의 mname: " + mname);
		} else {
		    System.out.println("mname이 세션에 저장되어 있지 않습니다.");
		    RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
		    rd.forward(request, response);
		}
		
		FoodDAO dao = new FoodDAO();
		List<Map<String, Object>> list = null;
	    if(request.getParameter("search") != null && !request.getParameter("search").equals("")) {
	    	list = dao.searchList(request.getParameter("search"));
	    	//request.setAttribute("list", list);
	    	System.out.println(request.getParameter("search"));
	    }else {
	    	list= dao.foodList();
	    }
	    request.setAttribute("list", list);
	    System.out.println(list);
	    
	    RequestDispatcher rd = request.getRequestDispatcher("/food.jsp");
	    rd.forward(request, response);
	    
	}

}