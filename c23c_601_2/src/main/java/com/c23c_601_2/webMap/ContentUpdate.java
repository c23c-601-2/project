package com.c23c_601_2.webMap;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.c23c_601_2.dao.FoodDAO;
import com.c23c_601_2.dto.FoodDTO;
import com.c23c_601_2.util.Util;

@WebServlet("/contentUpdate")
public class ContentUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ContentUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		FoodDAO dao = new FoodDAO();
		String updatecontent = request.getParameter("updateBox");
		String no = request.getParameter("no");
		
		updatecontent = Util.addBR(updatecontent);
		updatecontent = Util.removeTag(updatecontent);
		
		if (session.getAttribute("mid") != null && updatecontent != null && no != null ) {
			FoodDTO dto = new FoodDTO();
			dto.setContent(updatecontent);
			dto.setNo(Util.str2Int2(no));
			dto.setMid((String)session.getAttribute("mid"));
			int result = dao.UpdateContent(dto);
			
			if (result == 1) {
				response.sendRedirect("./board?no="+no);
//				System.out.println("처리 결과 :" + result);
			} else {
				response.sendRedirect("./error.jsp");
			}
		} else {
			response.sendRedirect("./error.jsp");
		}
		
	}
}
