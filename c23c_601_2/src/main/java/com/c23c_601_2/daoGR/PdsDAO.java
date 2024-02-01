package com.c23c_601_2.daoGR;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class PdsDAO extends AbstractDAO{
	public boolean insert(PdsDTO dto){
	    boolean flag = false;
	    
	    try {
	        Connection con = db.getConnection();
	        StringBuilder sql = new StringBuilder();
	        
	        sql.append("INSERT INTO tb_pds(wname, subject, passwd, filename, filesize, regdate) ");
	        sql.append("VALUES (?, ?, ?, ?, ?, NOW()) ");
	    
	        PreparedStatement pstmt = con.prepareStatement(sql.toString(), Statement.RETURN_GENERATED_KEYS);
	        pstmt.setString(1, dto.getWname());
	        pstmt.setString(2, dto.getSubject());
	        pstmt.setString(3, dto.getPasswd());
	        pstmt.setString(4, dto.getFilename());
	        pstmt.setLong(5, dto.getFilesize());
	        
	        int cnt = pstmt.executeUpdate();
	        if(cnt == 1){
	            ResultSet generatedKeys = pstmt.getGeneratedKeys();
	            if (generatedKeys.next()) {
	                dto.setPdsno(generatedKeys.getInt(1));
	            }
	            flag = true;
	        }//if end
	    } catch (Exception e) {
	        System.out.println("사진 추가 실패 : " + e);
	    }//try end
	    return flag;
	}//insert end



	public synchronized ArrayList<PdsDTO> list(){
		ArrayList<PdsDTO> list=null;
	    try{
	    	Connection con= db.getConnection();
	        StringBuilder sql=new StringBuilder();
	        
	        sql.append(" SELECT pdsno, wname, subject, readcnt, regdate, filename ");
	        sql.append(" FROM tb_pds ");
	        sql.append(" ORDER BY regdate DESC ");
	        
	        PreparedStatement pstmt=con.prepareStatement(sql.toString());
	        ResultSet rs=pstmt.executeQuery();
	        if(rs.next()){
	        	list=new ArrayList<>();
	            do{
	            	PdsDTO dto=new PdsDTO();
	                dto.setPdsno(rs.getInt("pdsno"));
			dto.setWname(rs.getString("wname"));
			dto.setSubject(rs.getString("subject"));
			dto.setReadcnt(rs.getInt("readcnt"));
			dto.setFilename(rs.getString("filename"));
			dto.setRegdate(rs.getString("regdate"));
			list.add(dto);
	            }while(rs.next());
	        }else{
	        	list=null;
	        }//if end
	    }catch(Exception e){
	    	System.out.println("목록 불러오기 실패 : "+e);
	    }//try end
	    return list;
	}//list() end
}
