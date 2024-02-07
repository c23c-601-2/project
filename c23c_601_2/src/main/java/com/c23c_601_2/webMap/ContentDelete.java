package com.c23c_601_2.webMap;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.c23c_601_2.dao.FoodDAO;
import com.c23c_601_2.dto.FoodDTO;
import com.c23c_601_2.util.Util;

@WebServlet("/contentDelete")
public class ContentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ContentDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		int result = 0;
		FoodDAO dao = new FoodDAO();
		FoodDTO dto = new FoodDTO();
		String no = request.getParameter("no");
		System.out.println(no);
		if (session.getAttribute("mid") != null && no != null ) {
			dto.setNo(Util.str2Int2(no));
			dto.setMid((String)session.getAttribute("mid"));
			result = dao.contentDelete(dto);
			System.out.println(result);
		}
		
		PrintWriter pw = response.getWriter();
		pw.print(result);
	}
}
