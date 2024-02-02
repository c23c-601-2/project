package com.c23c_601_2.webITboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.c23c_601_2.daoITboard.StudyBoardDAO;
import com.c23c_601_2.dtoITboard.StudyBoardDTO;
import com.c23c_601_2.util.Util;

@WebServlet("/studyBoard")
public class StudyBoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
    public StudyBoardList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//DAO랑 연결
//		int page = 1;
//		if (request.getParameter("page") != null && request.getParameter("page") != "") {
//			page = Util.str2Int2(request.getParameter("page"));
//		}
		//Map<String, Object> log = new HashMap<String, Object>();
		//log.put("data", "page="+page);
		
		StudyBoardDAO dao = new StudyBoardDAO();
		List<StudyBoardDTO> list = dao.boardList();
		//int totalCount = dao.totalCount();
		
		request.setAttribute("list", list);
		//request.setAttribute("totalCount", totalCount);
		//request.setAttribute("page", page);
		
		RequestDispatcher rd = request.getRequestDispatcher("studyBoard.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
