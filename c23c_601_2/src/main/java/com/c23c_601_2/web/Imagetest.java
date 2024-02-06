package com.c23c_601_2.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.c23c_601_2.daoGR.CommentDAO;
import com.c23c_601_2.daoGR.CommentDTO;

@WebServlet("/imagetest")
public class Imagetest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Imagetest() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 댓글 출력부
        CommentDAO commentDAO = new CommentDAO();
        List<CommentDTO> loadCommentList = commentDAO.getCommentList();

        // 댓글 목록을 request에 설정
        request.setAttribute("commentList", loadCommentList);

        // 댓글 목록을 출력하는 JSP 페이지로 포워딩
        //RequestDispatcher dispatcher = request.getRequestDispatcher("/imgList.jsp");
        //dispatcher.forward(request, response);
		
		RequestDispatcher rd = request.getRequestDispatcher("imagetest.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
