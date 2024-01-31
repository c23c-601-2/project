package com.green.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.green.db.DBConnection;

public class BoardDAO extends AbstractDAO{
	
	DBConnection db = DBConnection.getInstance();

	// Board(게시판)
	public List<Map<String, Object>> boardList() {

	      List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	      Connection conn = db.getConnection();
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String sql = "SELECT * FROM boardview";


		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Map<String, Object> e = new HashMap<String, Object>();

				e.put("Post_id", rs.getInt(1));
				e.put("Content", rs.getString(2));
				e.put("Image_url", rs.getString(3));
				e.put("Date", rs.getString(4));

				list.add(e);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return list;
	}


}
