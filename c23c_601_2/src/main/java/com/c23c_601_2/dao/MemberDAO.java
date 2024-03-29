package com.c23c_601_2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.c23c_601_2.daoGR.CommentDTO;
import com.c23c_601_2.dto.MemberDTO;
import com.c23c_601_2.dto.TotalboardDTO;

public class MemberDAO extends AbstractDAO{
	
	//ctotalpage 
		public int ctotalcount(String mid) {
			int result =0;
			
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT COUNT(*) AS count FROM tb_comments WHERE mid = ?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getInt("count");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			
			return result;
		}
	
	
	public List<CommentDTO> selectComment(String mid,int page){
		List<CommentDTO> list = new ArrayList<CommentDTO>();
		Connection conn = db.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String  sql = "SELECT mid, comment, if(date_format(current_timestamp(),'%Y-%m-%d') = date_format(regdate,'%Y-%m-%d'),date_format(regdate,'%h:%i'),date_format(regdate,'%m-%d')) AS regdate,"
				+ "(SELECT subject FROM tb_pds A WHERE A.pdsno = B.pdsno) AS subject "
				+ "FROM tb_comments B WHERE mid =? ORDER BY regdate DESC LIMIT ?,5";

		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, (page-1)*5);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CommentDTO dto = new CommentDTO();
				dto.setMid(rs.getString("mid"));
				dto.setComment(rs.getString("comment"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setSubject(rs.getString("subject"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int delMember(String id) {
		int result = 0;
		Connection conn = db.getConnection();
		String sql="UPDATE member SET mdel=0,updatedate=? WHERE mid =?";
		
		PreparedStatement pstmt = null;
		
		try {
			LocalDateTime now = LocalDateTime.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, now.format(formatter));
			pstmt.setString(2, id);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int updateMember(MemberDTO dto) {
		
		int result =0;
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql= "UPDATE member SET mpw =?, memail=?,mphone=?,maddress=?,updatedate =? WHERE mid =?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMpw());
			pstmt.setString(2, dto.getMemail());
			pstmt.setString(3, dto.getMphone());
			pstmt.setString(4, dto.getMaddress());
			pstmt.setString(5, dto.getUpdatedate());
			pstmt.setString(6, dto.getMid());
			result =pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	//totalpage 
	public int totalcount(String mid) {
		int result =0;
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT COUNT(*) AS count FROM totalboard WHERE mid = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	
	//totalboard 출력
	public List<TotalboardDTO> detailBoard(String mid,int page){
		List<TotalboardDTO> list = new ArrayList<TotalboardDTO>();
		
		Connection conn = db.getConnection();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT mid,subject,regdate,if(type='F','Foodmap','Instargram') AS type FROM totalboard "
				+ "WHERE mid =? "
				+ "LIMIT ?, 5";
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, (page-1)*5);
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
	
	public String changeEmailMasking(String str) {
		
		String[] email = str.split("@");
		String result = email[0].substring(0,2)+"*******@"+email[1].substring(0,1)+"*******.com";
		
		System.out.println(result);
		
		return result;
	}
	
	public String changephoneMasking(String str) {
		
		String[] phone = str.split("-");
		
		String result = phone[0]+"-"+phone[1].substring(0,1)+"***-"+phone[2].substring(0,1)+"***";
		
		return result;
	}
	
	public MemberDTO detailId(String mid) {
		MemberDTO dto = new MemberDTO();
		
		Connection conn = db.getConnection();
		
		String sql ="SELECT mid,mname,mphone,memail,maddress,lastlogin FROM member WHERE mid =?";
		
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
				dto.setMaddress(rs.getString("maddress"));
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
		String sql = "SELECT COUNT(*) AS count, mid, mname FROM member WHERE mid =? AND mpw =? AND mdel=1";
		
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
	
	public int pwCheck(String pw,String id) {
		int result = 0;
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) AS count FROM member WHERE mpw = ? AND mid=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return result;
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
