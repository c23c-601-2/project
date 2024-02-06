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
import com.c23c_601_2.dto.DisLikeCountDTO;
import com.c23c_601_2.dto.LikeCountDTO;
import com.c23c_601_2.util.Util;

@WebServlet("/disLikeUp")
public class DisLikeUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DisLikeUp() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int result = 0 ;
		DisLikeCountDTO dto = new DisLikeCountDTO();
		FoodDAO dao = new FoodDAO();
		
		String no = request.getParameter("no");
		String mid = (String)session.getAttribute("mid");
		
		dto.setDno(Util.str2Int2(no));
		dto.setDmid(mid);
		result = dao.dislikeUp(dto);
		System.out.println(result);
		
		PrintWriter pw = response.getWriter();
		pw.print(result);
	}
}
