package com.c23c_601_2.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/imgIns")
public class imgIns extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public imgIns() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("imgIns.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            String saveDirectory = getServletContext().getRealPath("/webapp/storage");
            int maxPostSize = 1920 * 1080 * 10;
            String encoding = "UTF-8";

            MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding,
                    new DefaultFileRenamePolicy());

            // 여기에 이미지 업로드 처리 코드 추가

            // 이미지를 업로드하고 나서 imgList 페이지로 리다이렉트
            response.sendRedirect("imgList");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Image upload failed.");
        }
    }
}
