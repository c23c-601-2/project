package com.c23c_601_2.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.c23c_601_2.dao.MemberDAO;
import com.c23c_601_2.daoGR.CommentDTO;
import com.c23c_601_2.dto.MemberDTO;
import com.c23c_601_2.dto.TotalboardDTO;
import com.c23c_601_2.util.Util;


@WebServlet("/mypage")
public class Mypage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Mypage() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("mid")!=null) {
			int page=0;
			int cpage=0;
			
			if(request.getParameter("page") == null) {
				page =1;
			} else {
				page = Util.str2Int2(request.getParameter("page"));
			}
			
			if(request.getParameter("cpage") == null) {
				cpage =1;
			} else {
				cpage = Util.str2Int2(request.getParameter("cpage"));
			}
			
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = dao.detailId((String)session.getAttribute("mid"));
			
			dto.setMid(dto.getMid()+"@naver.com");
			if(dto.getMemail()!=null && !dto.getMemail().equals("")) {
				dto.setMemail(Util.changeEmailMasking(dto.getMemail()));				
			}
			if(dto.getMphone()!=null && !dto.getMemail().equals("")) {
				dto.setMphone(Util.changephoneMasking(dto.getMphone()));				
			}
			
		
			
			List<TotalboardDTO> list = dao.detailBoard((String)session.getAttribute("mid"),page);
			List<CommentDTO> clist = dao.selectComment((String)session.getAttribute("mid"),cpage);
			
			request.setAttribute("page", page);
			request.setAttribute("cpage", cpage);
			
			request.setAttribute("totalcount", dao.totalcount((String)session.getAttribute("mid")));
			request.setAttribute("ctotalcount", dao.ctotalcount((String)session.getAttribute("mid")));
			
			request.setAttribute("dto", dto);
			request.setAttribute("detail", list);
			request.setAttribute("clist", clist);
			
			RequestDispatcher rd = request.getRequestDispatcher("mypage.jsp");
			rd.forward(request, response);
						
		} else {
			response.sendRedirect("./frontpage");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/*
		 * HttpSession session = request.getSession(); int page = Util.str2Int2(
		 * request.getParameter("page")); MemberDAO dao = new MemberDAO();
		 * 
		 * List<TotalboardDTO> list =
		 * dao.detailBoard((String)session.getAttribute("mid"),page);
		 * 
		 * JSONArray arr = new JSONArray();
		 * 
		 * for(TotalboardDTO dto : list) { JSONObject obj = new JSONObject();
		 * obj.put("regdate", dto.getRegdate()); obj.put("subject", dto.getSubject());
		 * obj.put("mid", dto.getMid()); obj.put("type", dto.getType());
		 * 
		 * arr.add(obj); }
		 * 
		 * 
		 * 
		 * request.setAttribute("page", page);
		 * 
		 * response.setContentType("application/x-json; charset=utf-8"); PrintWriter pw
		 * = response.getWriter(); pw.print(arr);
		 */
	}

}























