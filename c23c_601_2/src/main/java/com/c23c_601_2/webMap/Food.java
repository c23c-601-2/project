package com.c23c_601_2.webMap;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.c23c_601_2.dao.FoodDAO;

@WebServlet("/food")
public class Food extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Food() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//DAO랑 연결
		FoodDAO dao = new FoodDAO();
		//FoodDTO dto = new FoodDTO();
		List<java.util.Map<String, Object>> list = null;
		list= dao.foodList();

		request.setAttribute("list", list);
		// 서블릿을 통과한 "list"를 jsp로 넘겨준다.
		
		RequestDispatcher rd = request.getRequestDispatcher("/food.jsp");
	    rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//System.out.println("search : "+ request.getParameter("search"));
		
		/* 수정 전
		FoodDAO dao = new FoodDAO();
		List<FoodDTO> list = dao.searchList(request.getParameter("search"));
		
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("/food.jsp");
	    rd.forward(request, response);
	    */
		
		HttpSession session = request.getSession();
		String mname = (String) session.getAttribute("mname");
		if (mname != null) {
		    System.out.println("현재 접속한 사용자의 mname: " + mname);
		} else {
		    System.out.println("mname이 세션에 저장되어 있지 않습니다.");
		}
		
		FoodDAO dao = new FoodDAO();
		List<Map<String, Object>> list = null;
	    if(request.getParameter("title") != null && !request.getParameter("title").equals("")) {
	    	list = dao.searchList(request.getParameter("title"));
	    	//request.setAttribute("list", list);
	    	
	    	// json 형식의 데이터 생성
			JSONObject jObj = new JSONObject();
			jObj.put("list", list);
			
			 //json 형식으로 잘 바뀌었는지 확인 테스트
			System.out.println("생성된 JSON 데이터: " + jObj.toString()); // 생성된 JSON 데이터 출력
			
			 //json 데이터를 클라이언트로 전송
			 response.setContentType("application/x-json; charset=utf-8");
			 response.getWriter().print(jObj);
	    	
	    	System.out.println(request.getParameter("title"));
	    }else {
	    	list= dao.foodList();
	    	request.setAttribute("list", list);
	    }
	    
	    /*
	    // json 형식의 데이터 생성
		JSONObject jObj = new JSONObject();
		jObj.put("list", list);
		 //json 형식으로 잘 바뀌었는지 확인 테스트
		System.out.println("생성된 JSON 데이터: " + jObj.toString()); // 생성된 JSON 데이터 출력
		 //json 데이터를 클라이언트로 전송
		 response.setContentType("application/x-json; charset=utf-8");
		 response.getWriter().print(jObj);
		 */
	    
	      //PrintWriter pw = response.getWriter();
	      //pw.print(jObj.toString());
	      //pw.flush();
			/*
			 * request.setAttribute("list", list); System.out.println(list);
			 */
	    
			/*
			 * RequestDispatcher rd = request.getRequestDispatcher("/food.jsp");
			 * rd.forward(request, response);
			 */
	}

}