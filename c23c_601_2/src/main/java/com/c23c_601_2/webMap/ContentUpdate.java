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
		String edit = request.getParameter("edit");
		//System.out.println(edit);
		String no = request.getParameter("no");
		//System.out.println(no);
		
		edit = Util.removeBR(edit);
		edit= Util.removeP(edit);
		edit= Util.removeP2(edit);
		edit = Util.removeTag(edit);
		int result = 0;
		
		if (session.getAttribute("mid") != null && edit != null && no != null ) {
			FoodDTO dto = new FoodDTO();
			dto.setContent(edit);
			dto.setNo(Util.str2Int2(no));
			dto.setMid((String)session.getAttribute("mid"));
			result = dao.UpdateContent(dto);
			//System.out.println(result);
		}
		
		PrintWriter pw = response.getWriter();
		pw.print(result);
	}
}
