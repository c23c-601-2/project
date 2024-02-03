package com.c23c_601_2.daoGR;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.c23c_601_2.daoGR.CommentDAO;
import com.c23c_601_2.daoGR.CommentDTO;

@WebServlet("/commentServlet")
public class CommentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");

        System.out.println("-------");
        // 클라이언트에서 전송한 댓글 내용과 게시물 번호 가져오기
        String pdsnoStr = request.getParameter("pdsno");
        String commentContent = request.getParameter("commentContent");

        // 게시물 번호가 유효한지 확인
        if (pdsnoStr != null && !pdsnoStr.isEmpty()) {
            int pdsno = Integer.parseInt(pdsnoStr);

            // 댓글을 데이터베이스에 추가
            CommentDAO dao = new CommentDAO();
            dao.addComment(pdsno, commentContent);

            // 댓글 목록을 가져와서 클라이언트에 전송
            List<CommentDTO> commentList = dao.getCommentList(pdsno);

            // JSON 형식으로 응답 작성
            PrintWriter out = response.getWriter();
            out.println("[");
            for (int i = 0; i < commentList.size(); i++) {
                CommentDTO comment = commentList.get(i);
                out.println("{");
                out.println("\"mname\": \"" + comment.getMname() + "\",");
                out.println("\"regdate\": \"" + comment.getRegdate() + "\",");
                out.println("\"comment\": \"" + comment.getComment() + "\"");
                out.println("}");
                if (i < commentList.size() - 1) {
                    out.println(",");
                }
            }
            out.println("]");
        } else {
            // 게시물 번호가 유효하지 않은 경우에 대한 오류 응답 처리
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid pdsno parameter");
        }
    }
}
