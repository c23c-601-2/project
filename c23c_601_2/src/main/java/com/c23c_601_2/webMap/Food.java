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
		FoodDTO dto = new FoodDTO();
		List<java.util.Map<String, Object>> list = null;
		list= dao.foodList();

		request.setAttribute("list", list);
		// 서블릿을 통과한 "list"를 jsp로 넘겨준다.
		
		RequestDispatcher rd = request.getRequestDispatcher("/food.jsp");
	    rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//HttpSession session = request.getSession(); // 댓글 작성한사람 ID를 알아야한다.
	}

}
