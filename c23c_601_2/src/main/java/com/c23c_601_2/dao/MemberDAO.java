package com.c23c_601_2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.c23c_601_2.dto.MemberDTO;

public class MemberDAO extends AbstractDAO{
	
	public int insertMember(MemberDTO dto) {
		int result = 0;
		Connection conn = db.getConn();
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
