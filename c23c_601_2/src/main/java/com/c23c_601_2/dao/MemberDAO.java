package com.c23c_601_2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.c23c_601_2.dto.MemberDTO;
import com.c23c_601_2.dto.TotalboardDTO;

public class MemberDAO extends AbstractDAO{
	
	public List<TotalboardDTO> detailBoard(String mid,int page){
		List<TotalboardDTO> list = new ArrayList<TotalboardDTO>();
		
		Connection conn = db.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT mid,subject,regdate,type FROM totalboard "
				+ "WHERE mno = (SELECT mno FROM member WHERE mid =?) "
				+ "LIMIT ?, 3";
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, (page-1)*3);
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				TotalboardDTO dto = new TotalboardDTO();
				dto.setMid(rs.getString("mid"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setType(rs.getString("type"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	
	
	
	public void lastLogin(String mid) {
		Connection conn = db.getConnection();
		
		String sql= "UPDATE member SET lastlogin = now() WHERE mid =?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public MemberDTO detailId(String mid) {
		MemberDTO dto = new MemberDTO();
		
		Connection conn = db.getConnection();
		
		String sql ="SELECT mid,mname,mphone,memail,lastlogin FROM member WHERE mid =?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			// id, name, phone, email
			while(rs.next()) {
				dto.setMid(rs.getString("mid"));
				dto.setMname(rs.getString("mname"));
				dto.setMphone(rs.getString("mphone"));
				dto.setMemail(rs.getString("memail"));
				dto.setLastlogin(rs.getString("lastlogin"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return dto;
	}
	
	
	
	public MemberDTO compareId(MemberDTO dto) {
		MemberDTO dto2 = new MemberDTO();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) AS count, mid, mname FROM member WHERE mid =? AND mpw =?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			pstmt.setString(2, dto.getMpw());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto2.setMid(rs.getString("mid"));
				dto2.setMname(rs.getString("mname"));
				dto2.setCount(rs.getInt("count"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return dto2;
	}
	
	
	public int idCheck(String id) {
		int result = 0;
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) AS count FROM member WHERE mid = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	public int insertMember(MemberDTO dto) {
		int result = 0;
		Connection conn = db.getConnection();
		PreparedStatement pstmt= null;
		String sql = "INSERT INTO member (mid,mpw,mname,memail,mphone,maddress) VALUES (?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMid());
			pstmt.setString(2, dto.getMpw());
			pstmt.setString(3, dto.getMname());
			pstmt.setString(4, dto.getMemail());
			pstmt.setString(5, dto.getMphone());
			pstmt.setString(6, dto.getMaddress());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return result;
	}
}
