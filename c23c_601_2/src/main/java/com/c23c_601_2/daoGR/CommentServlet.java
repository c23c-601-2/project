package com.c23c_601_2.daoGR;
import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

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
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	request.setCharacterEncoding("UTF-8");

        System.out.println("-------");
        // 클라이언트에서 전송한 댓글 내용과 게시물 번호 가져오기
        
        String pdsnoStr = request.getParameter("pdsno"); // 글 번호
        String commentContent = request.getParameter("commentContent");
        System.out.println(commentContent + " : " + pdsnoStr);
        
     // 댓글을 데이터베이스에 추가
        CommentDAO dao = new CommentDAO();
        List<CommentDTO> commentList = new ArrayList<>();
		
		if(commentList.size() > 0) {
			request.setAttribute("commentList", commentList);
		}
		// 저장하기
		CommentDTO dto = new CommentDTO();
		dto.setComment(commentContent);
		dto.setMid(pdsnoStr);
		
		HttpSession session = request.getSession();
		dto.setMid((String)session.getAttribute("mid"));
		
        
		int result = dao.commentWrite(dto);
		System.out.println("처리결과 : " + result);
		
		response.sendRedirect("./imgList");
    }
}

        
        ///////////////////////////////////////////
        // 게시물 번호가 유효한지 확인
/*        if (pdsnoStr != null && !pdsnoStr.isEmpty()) {
            int pdsno = Integer.parseInt(pdsnoStr);

            */

