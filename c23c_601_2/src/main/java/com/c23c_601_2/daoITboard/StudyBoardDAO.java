package com.c23c_601_2.daoITboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.c23c_601_2.dao.AbstractDAO;
import com.c23c_601_2.db.DBConnection;
import com.c23c_601_2.dtoITboard.StudyBoardDTO;

public class StudyBoardDAO extends AbstractDAO {
	
	public List<StudyBoardDTO> boardList() {
		List<StudyBoardDTO> list = null;
		Connection con = DBConnection.getInstance().getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM studyboard";

		try {
			pstmt = con.prepareStatement(sql);
			//pstmt.setInt(1, (page - 1) * 10);
			// 수정해야합니다. (page-1) 0번째부터 계산하기위해 ->10개 가져오기
			rs = pstmt.executeQuery();
			list = new ArrayList<StudyBoardDTO>();

			while (rs.next()) {
				StudyBoardDTO e = new StudyBoardDTO();
				e.setStudyboard_no(rs.getInt("studyboard_no")); // 첫번째 컬럼에 있는 내용 가져오기
				e.setStudyboard_title(rs.getString("studyboard_title"));
				e.setStudyboard_write(rs.getString("studyboard_write"));
				e.setStudyboard_date(rs.getString("studyboard_date"));
				e.setStudyboard_count(rs.getInt("studyboard_count"));
				list.add(e);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}

		return list;
	}

	public int totalCount() {
		int result = 0;
		Connection con = DBConnection.getInstance().getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM studyboard";

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
}
