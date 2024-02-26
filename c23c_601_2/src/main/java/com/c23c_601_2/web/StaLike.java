package com.c23c_601_2.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.el.parser.BooleanNode;
import org.json.simple.JSONObject;

import com.c23c_601_2.dao.StaLikeDAO;

@WebServlet("/staLike")
public class StaLike extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StaLike() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("mid");
		int pdsno = Integer.parseInt(request.getParameter("pdsno"));
//		int pdsno = 9;
		
		//좋아요 상태를 토글
		StaLikeDAO staLikeDAO = new StaLikeDAO();
		Boolean currentLikeStatus;
		int newLikeStatus ;
		
		
		if (staLikeDAO.getLikeStatus(mid, pdsno) == 1 ) {
			currentLikeStatus = true;
			newLikeStatus = 0;
		} else {
			currentLikeStatus = false;
			newLikeStatus = 1;
		}
		
		// 데이터베이스에 좋아요 정보 저장 또는 업데이트
		if (currentLikeStatus) {
			staLikeDAO.updateLike(mid, pdsno, newLikeStatus);
		} else {
			staLikeDAO.addLike(mid, pdsno);
		}

        // JSON 응답 생성
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("success", newLikeStatus);

        // 응답 전송
        response.setContentType("application/json");
        response.getWriter().write(jsonResponse.toJSONString());
	}
	

}