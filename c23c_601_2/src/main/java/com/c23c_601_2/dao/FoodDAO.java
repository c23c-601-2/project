package com.c23c_601_2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.c23c_601_2.dto.DisLikeCountDTO;
import com.c23c_601_2.dto.FoodDTO;
import com.c23c_601_2.dto.LikeCountDTO;

public class FoodDAO extends AbDAO{

	public List<Map<String, Object>> foodList() {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT food_no, food_title, food_content, food_write, food_date, food_like, food_dislike, grade FROM foodmapview ORDER BY food_no DESC LIMIT 0, 23";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
	            Map<String, Object> dto = new HashMap<String, Object>();
	            dto.put("food_no", rs.getString("food_no"));
	            dto.put("food_title", rs.getString("food_title"));
	            dto.put("food_content",rs.getString("food_content"));
	            dto.put("food_write",rs.getString("food_write"));
	            dto.put("food_date",rs.getString("food_date"));
	            dto.put("food_like", rs.getInt("food_like"));
	            dto.put("food_dislike", rs.getInt("food_dislike"));
	            dto.put("grade", rs.getInt("grade"));
	            list.add(dto);
	         }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		return list;
	}
	public List<FoodDTO> foodListAll(int page) {
		List<FoodDTO> list = new ArrayList<FoodDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT food_no, food_title, food_content, food_write, food_date, food_like, food_dislike, grade FROM foodmapview ORDER BY food_no DESC LIMIT ?, 10";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, (page - 1) * 10);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
	            FoodDTO e = new FoodDTO();
	            e.setNo(rs.getInt("food_no"));
	            e.setTitle(rs.getString("food_title"));
	            e.setContent(rs.getString("food_content"));
	            e.setWrite(rs.getString("food_write"));
	            e.setDate(rs.getString("food_date"));
	            e.setLike(rs.getInt("food_like"));
	            e.setDislike(rs.getInt("food_dislike"));
	            e.setGrade(rs.getInt("grade"));
	            list.add(e);
	         }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		return list;
	}
	public List<FoodDTO> foodListAll(String parameter) {
		List<FoodDTO> list = new ArrayList<FoodDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT food_no, food_title, food_content, food_write, food_date, food_like, food_dislike, grade"
	            + " FROM foodmapview"
	            + " WHERE food_title LIKE CONCAT('%', ?, '%') ORDER BY food_no DESC";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, parameter);
			rs = pstmt.executeQuery();

			
			while (rs.next()) {
				FoodDTO e = new FoodDTO();
				e.setNo(rs.getInt("food_no"));
	            e.setTitle(rs.getString("food_title"));
	            e.setContent(rs.getString("food_content"));
	            e.setWrite(rs.getString("food_write"));
	            e.setDate(rs.getString("food_date"));
	            e.setLike(rs.getInt("food_like"));
	            e.setDislike(rs.getInt("food_dislike"));
	            e.setGrade(rs.getInt("grade"));
				list.add(e);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		return list;
	}

	public int write(FoodDTO dto) {
		int result = 0; 

		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO foodmap (food_title, food_content, food_write, grade) VALUES (?, ?, (SELECT mid FROM member WHERE mid=?), ?)";
 
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getMid());
			pstmt.setInt(4, dto.getGrade());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		return result;
	}
	
	public List<Map<String, Object>> searchList(String parameter) {
	      List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
	      Connection con = db.getConnection();
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = "SELECT food_title, food_content, food_like, food_dislike, grade "
	               + " FROM foodmapview"
	               + " WHERE food_title LIKE CONCAT('%', ?, '%')"
	               + " ORDER BY food_like";
	      try {
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, parameter);
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            Map<String, Object> dto = new HashMap<String, Object>();
	            dto.put("food_title", rs.getString("food_title"));
	            dto.put("food_content", rs.getString("food_content"));
	            dto.put("food_like", rs.getInt("food_like"));
	            dto.put("food_dislike", rs.getInt("food_dislike"));
	            dto.put("grade", rs.getInt("grade"));
	            list.add(dto);
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rs, pstmt, con);
	      }
	      
	      return list;
	   }
	public int totalCount() {
		int result = 0;
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM foodmap";

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result= rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}

		return result;
	}
	public int likeUp(LikeCountDTO dto) {
		int result = 0;
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM likecount "
				+ "WHERE lno=? AND lmid=(SELECT mid FROM member WHERE mid=?) ";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getLno());
			pstmt.setString(2, dto.getLmid());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getInt(1) == 0) {
					result = realLikeUp(dto);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		
		return result;
	}
	
	public int realLikeUp(LikeCountDTO dto) {
		int result = 0;
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO likecount (lno, lmid) VALUES(?,(SELECT mid FROM member WHERE mid=?))";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getLno());
			pstmt.setString(2, dto.getLmid());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		
		return result;
	}
	
	public int dislikeUp(DisLikeCountDTO dto) {
		int result = 0;
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM dislikecount "
				+ "WHERE dno=? AND dmid=(SELECT mid FROM member WHERE mid=?) ";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getDno());
			pstmt.setString(2, dto.getDmid());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getInt(1) == 0) {
					result = realDislikeUp(dto);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		
		return result;
	}
	
	public int realDislikeUp(DisLikeCountDTO dto) {
		int result = 0;
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO dislikecount (dno, dmid) VALUES(?,(SELECT mid FROM member WHERE mid=?))";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getDno());
			pstmt.setString(2, dto.getDmid());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		
		return result;
	}
	public int UpdateContent(FoodDTO dto) {
		int result = 0;
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE foodmap SET food_content = ? WHERE food_no = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getContent());
			pstmt.setInt(2, dto.getNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		
		return result;
	}
	public int contentDelete(FoodDTO dto) {
		int result = 0;
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE foodmap SET food_del = '0' WHERE food_no = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getNo());
			pstmt.setString(2, dto.getMid());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		return result;
	}
}