package com.c23c_601_2.daoGR;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class CommentDAO extends AbstractDAO {

	 public int commentWrite(CommentDTO dto) {
	        Connection conn = db.getConnection();
	        PreparedStatement pstmt = null;
	        int result = 0;
	        
	        try {
	            // 댓글을 데이터베이스에 추가하는 SQL 쿼리
	            String sql = "INSERT INTO tb_comments (comment,pdsno,cname) VALUES (?,?,?)";
	            
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, dto.getComment());
	            pstmt.setInt(2, dto.getPdsno());
	            pstmt.setString(3, dto.getCname());
	            result = pstmt.executeUpdate();
	            

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(null, pstmt, conn);
	            
	        }
	        return result;
	    }


	 public List<CommentDTO> getCommentList(int pdsno) {
		    Connection conn = db.getConnection();
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;

		    List<CommentDTO> commentList = new ArrayList<>();

		    String sql = "SELECT cname, comment, regdate FROM tb_comments WHERE pdsno=?" ; // 특정 게시물(pdsno)에 대한 댓글을 데이터베이스에서 가져오기

		    try {
		        
		        pstmt = conn.prepareStatement(sql);
		        pstmt.setInt(1, pdsno);
		        rs = pstmt.executeQuery();

		        while (rs.next()) {
		            CommentDTO comment = new CommentDTO();
		            //comment.setMname(rs.getString("mid"));
		            comment.setCname(rs.getString("cname"));
		            comment.setComment(rs.getString("comment"));
		            comment.setRegdate(rs.getString("regdate"));
		            
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