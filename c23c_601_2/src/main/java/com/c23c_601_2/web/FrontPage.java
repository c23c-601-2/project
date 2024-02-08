package com.c23c_601_2.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.c23c_601_2.dao.FoodDAO;
import com.c23c_601_2.daoGR.PdsDAO;
import com.c23c_601_2.daoGR.PdsDTO;
import com.c23c_601_2.dto.FoodDTO;

@WebServlet("/frontpage")
public class FrontPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontPage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		PdsDAO dao = new PdsDAO();
		ArrayList<PdsDTO> list = dao.list();
		List<String> imgdata = new ArrayList<>();
		String img1 = "";
		String img2 = "";
		String img3 = "";
		String img4 = "";
		
		for (int i = 0; i < 4; i++) {
			 imgdata.add(list.get(i).getBase64ImageData());
		}
		request.setAttribute("imgdata", imgdata);
		
		img1 = imgdata.get(0);
		img2 = imgdata.get(1);
		img3 = imgdata.get(2);
		img4 = imgdata.get(3);
		
		request.setAttribute("img1", img1);
		request.setAttribute("img2", img2);
		request.setAttribute("img3", img3);
		request.setAttribute("img4", img4);		
		
		//DAO랑 연결
		FoodDAO fooddao = new FoodDAO();
		FoodDTO dto = new FoodDTO();
		List<java.util.Map<String, Object>> foodlist = null;
		foodlist = fooddao.foodList();

		request.setAttribute("foodlist", foodlist);
		// 서블릿을 통과한 "list"를 jsp로 넘겨준다.
		
		
		RequestDispatcher rd = request.getRequestDispatcher("frontpage.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
	}

}
