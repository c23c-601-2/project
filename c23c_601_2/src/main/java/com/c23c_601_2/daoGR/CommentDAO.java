package com.c23c_601_2.daoGR;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO extends AbstractDAO {

	 public void addComment(int postId, String content) {
	        Connection conn = null;
	        PreparedStatement pstmt = null;

	        try {
	            conn = db.getConnection();

	            // 댓글을 데이터베이스에 추가하는 SQL 쿼리
	            String sql = "INSERT INTO tb_comments (content, postId) VALUES (?, ?)";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, content);
	            pstmt.setInt(2, postId);
	            pstmt.executeUpdate();

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(null, pstmt, conn);
	            
	        }
	    }


	 public List<CommentDTO> getCommentList(int pdsno) {
		    Connection conn = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;

		    List<CommentDTO> commentList = new ArrayList<>();

		    try {
		        conn = db.getConnection();  // Connection 객체 초기화 추가

		        // 특정 게시물(pdsno)에 대한 댓글을 데이터베이스에서 가져오기
		        String sql = "SELECT mname, regdate, comment FROM tb_comments WHERE pdsno = ? ORDER BY regdate DESC";
		        pstmt = conn.prepareStatement(sql);
		        pstmt.setInt(1, pdsno);
		        rs = pstmt.executeQuery();

		        while (rs.next()) {
		            CommentDTO comment = new CommentDTO();
		            comment.setMname(rs.getString("mname"));
		            comment.setRegdate(rs.getString("regdate"));
		            comment.setComment(rs.getString("comment"));

		            commentList.add(comment);
		        }

		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        close(rs, pstmt, conn);
		    }

		    return commentList;
		}
}