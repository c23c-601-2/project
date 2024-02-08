package com.c23c_601_2.daoGR;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;


public class PdsDAO extends com.c23c_601_2.daoGR.AbstractDAO{
	public boolean insert(PdsDTO dto){
	    boolean flag = false;
	    
	    
	    try {
	    	Connection con = db.getConnection();
	        StringBuilder sql = new StringBuilder();
	        
	        sql.append("INSERT INTO tb_pds(wname, subject, passwd, filename, filesize, regdate, image_data) ");
	        sql.append("VALUES (?, ?, ?, ?, ?, NOW(), ?)");
	        sql.append(" ORDER BY regdate DESC ");
	    
	        PreparedStatement pstmt = con.prepareStatement(sql.toString(), Statement.RETURN_GENERATED_KEYS);
	        pstmt.setString(1, dto.getWname());
	        pstmt.setString(2, dto.getSubject());
	        pstmt.setString(3, dto.getPasswd());
	        pstmt.setString(4, dto.getFilename());
	        pstmt.setLong(5, dto.getFilesize());
	        
	        // 이미지 데이터를 InputStream으로 변환하여 PreparedStatement에 설정
            ByteArrayInputStream inputStream = new ByteArrayInputStream(dto.getImageData());
            pstmt.setBinaryStream(6, inputStream, dto.getImageData().length);
	        
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

	public byte[] getImageData() {
        Connection conn = db.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        byte[] imageData = null;

        try {
            String sql = "SELECT image_data FROM tb_pds ORDER BY regdate ";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                InputStream inputStream = rs.getBinaryStream("image_data");
                if (inputStream != null) {
                    imageData = inputStream.readAllBytes();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }

        return imageData;
    }

	public synchronized ArrayList<PdsDTO> list(){
		ArrayList<PdsDTO> list=null;
	    try{
	    	Connection con= db.getConnection();
	        StringBuilder sql=new StringBuilder();
	        
	        sql.append(" SELECT pdsno, wname, subject, readcnt, regdate, filename, filesize, image_data");
	        sql.append(" FROM tb_pds ");
	        sql.append(" ORDER BY pdsno DESC ");
	        
	        PreparedStatement pstmt=con.prepareStatement(sql.toString());
	        ResultSet rs=pstmt.executeQuery();
	        if(rs.next()){
	        	list=new ArrayList<>();
	            do{
	            	PdsDTO dto=new PdsDTO();
	            	InputStream inputStream = rs.getBinaryStream("image_data");
	            	byte[] imageData = inputStream.readAllBytes();
	            	String base64ImageData = Base64.getEncoder().encodeToString(imageData);
	                dto.setPdsno(rs.getInt("pdsno"));
			dto.setWname(rs.getString("wname"));
			dto.setSubject(rs.getString("subject"));
			dto.setReadcnt(rs.getInt("readcnt"));
			dto.setFilename(rs.getString("filename"));
			dto.setRegdate(rs.getString("regdate"));
			dto.setFilesize(rs.getInt("filesize")); // 파일사이즈 int로 추가..?
			dto.setBase64ImageData(base64ImageData);
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
