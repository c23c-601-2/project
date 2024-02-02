package com.c23c_601_2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.c23c_601_2.dto.FoodDTO;

public class FoodDAO extends AbDAO{

//	public List<FoodDTO> foolList(FoodDTO foodDTO) {
//		List<FoodDTO> list = new ArrayList<FoodDTO>();
//		// db정보
//		Connection con = db.getConnection();
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql = "SELECT food_title, food_content, food_like, food_dislike, food_degree " +
//	             "FROM foodmap";
//		
//		try {
//			pstmt = con.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//	            FoodDTO dto = new FoodDTO();
//	            dto.setTitle(rs.getString("food_title"));
//	            dto.setContent(rs.getString("food_content"));
//	            dto.setLike(rs.getInt("food_like"));
//	            dto.setDislike(rs.getInt("food_dislike"));
//	            dto.setDegree(rs.getFloat("food_degree"));
//	            list.add(dto);
//	         }
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally{
//			close(rs, pstmt, con);
//		}
//		return list;
//	}

	public List<Map<String, Object>> foodList() {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT food_no, food_title, food_content, food_like, food_dislike, food_degree " +
	             "FROM foodmap LIMIT 0,5";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
	            Map<String, Object> dto = new HashMap<String, Object>();
	            dto.put("no", rs.getString("food_no"));
	            dto.put("food_title", rs.getString("food_title"));
	            dto.put("food_content",rs.getString("food_content"));
	            dto.put("food_like", rs.getInt("food_like"));
	            dto.put("food_dislike", rs.getInt("food_dislike"));
	            dto.put("food_degree", rs.getFloat("food_degree"));
	            list.add(dto);
	         }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		return list;
	}

	public int write(FoodDTO dto) {
		
		
		
		return 0;
	}
}