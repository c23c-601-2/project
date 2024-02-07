package com.c23c_601_2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StaLikeDAO extends AbstractDAO{
	
	public int addLike(String mid, int pdsno) {
		int result = 0; 
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO staLike (pdsno, mid, liked) VALUES (?, ?, 1)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pdsno);
			pstmt.setString(2, mid);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public int updateLike(String mid, int pdsno, int newLikeStatus) {
		int result = 0; 
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE staLike SET liked=? WHERE pdsno=? AND mid=?"; 
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, newLikeStatus);
			pstmt.setInt(2, pdsno);
			pstmt.setString(3, mid);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}	
	
	public int getLikeStatus(String mid, int pdsno) {
		int result = 0; 
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "SELECT liked FROM staLike WHERE pdsno=? AND mid=?";
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pdsno);
			pstmt.setString(2, mid);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
			result = rs.getInt("liked");
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}	

}
