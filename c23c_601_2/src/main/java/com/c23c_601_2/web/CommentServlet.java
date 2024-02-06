package com.c23c_601_2.web;
import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.c23c_601_2.daoGR.CommentDAO;
import com.c23c_601_2.daoGR.CommentDTO;

@WebServlet("/commentServlet")
public class CommentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String pdsnoStr = request.getParameter("pdsno");
	    int pdsno = Integer.parseInt(pdsnoStr);
	    
		// 댓글 출력부
        CommentDAO commentDAO = new CommentDAO();
        List<CommentDTO> loadCommentList = commentDAO.getCommentList(pdsno);

        // 댓글 목록을 request에 설정
        request.setAttribute("commentList", loadCommentList);

        // 댓글 목록을 출력하는 JSP 페이지로 포워딩
        RequestDispatcher dispatcher = request.getRequestDispatcher("/imgList.jsp");
        dispatcher.forward(request, response);
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	request.setCharacterEncoding("UTF-8");

        // 클라이언트에서 전송한 댓글 내용과 게시물 번호 가져오기
        
        String pdsnoStr = request.getParameter("pdsno"); // 글 번호
        String commentContent = request.getParameter("commentContent");
        
     // 댓글을 데이터베이스에 추가
        CommentDAO dao = new CommentDAO();
        //List<CommentDTO> commentList = new ArrayList<>();
		
		//if(commentList.size() > 0) {
		//	request.setAttribute("commentList", commentList);
		//}
		// 저장하기
		CommentDTO dto = new CommentDTO();
		dto.setComment(commentContent);		
		dto.setPdsno(Integer.parseInt(pdsnoStr)); // 게시물 번호 설정
        
		int result = dao.commentWrite(dto);
		
		/*
		 * CommentDAO commentDAO = new CommentDAO(); List<CommentDTO> loadCommentList =
		 * commentDAO.getCommentList(Integer.parseInt(pdsnoStr));
		 */
		HttpSession session = request.getSession();
		request.setAttribute("mid", (String)session.getAttribute("mid"));
		request.setAttribute("mname", (String) session.getAttribute("mname"));
		request.setAttribute("commentList", dao.getCommentList(Integer.parseInt(pdsnoStr)));
		
		PrintWriter pw = response.getWriter();
		pw.print(result);
	}
		
}

	// response.sendRedirect("./imgList");
		
		/*
		 * //댓글 출력부 
	    List<CommentDTO> loadCommentList = dao.getCommentList(Integer.parseInt(pdsnoStr));
		 */
 
        
        ///////////////////////////////////////////
        // 게시물 번호가 유효한지 확인
/*        if (pdsnoStr != null && !pdsnoStr.isEmpty()) {
            int pdsno = Integer.parseInt(pdsnoStr);

            */

