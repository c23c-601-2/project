package com.c23c_601_2.webNK;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

@WebServlet("/itboad/newsBoard")
public class Test extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // 크롤링할 대상 URL
            String url = "https://news.naver.com/breakingnews/section/105/283";

            // JSoup을 사용하여 웹페이지 파싱
            Document document = Jsoup.connect(url).get();

            // 웹페이지에서 원하는 데이터 추출 (예: 기사 제목)
            Elements headlines = document.select("<div class=\"sa_text\">");

            // 추출한 데이터를 클라이언트에게 전송
            out.println("<html><head><title>News Headlines</title></head><body>");
            out.println("<h1>Latest News Headlines</h1>");
            out.println("<ul>");
            headlines.forEach(headline -> out.println("<li>" + headline.text() + "</li>"));
            out.println("</ul>");
            out.println("</body></html>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<html><head><title>Error</title></head><body>");
            out.println("<h1>Error Occurred</h1>");
            out.println("<p>" + e.getMessage() + "</p>");
            out.println("</body></html>");
        } finally {
            out.close();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
