package com.c23c_601_2.webNK;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.c23c_601_2.daoNK.ItboardDAO;

@WebServlet("/itboad/newsBoard")
public class NewsBoard extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ItboardDAO dao = new ItboardDAO();
        List<String> headlines = dao.newsTitle();
        List<String> headlines2 = dao.newsUrl();
        List<String> headlines3 = dao.newsDate();
        request.setAttribute("headlines", headlines);
        request.setAttribute("headlines2", headlines2);
        request.setAttribute("headlines3", headlines3);
        
        RequestDispatcher rd = request.getRequestDispatcher("/itboard/newsBoard.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
