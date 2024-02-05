package com.c23c_601_2.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.c23c_601_2.dao.ChatDAO;
import com.c23c_601_2.dto.ChatDTO;

@WebServlet(name = "ChatListServlet", urlPatterns = "/chatListServlet/*")
public class ChatListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChatListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String listType = request.getParameter("listType");
		if(listType == null || listType.equals("")) response.getWriter().write("");
		else if(listType.equals("today")) response.getWriter().write(getToday());
		else if(listType.equals("ten")) response.getWriter().write(getTen());
		else {
			try {
				Integer.parseInt(listType);
				response.getWriter().write(getID(listType));
			} catch (Exception e) {
				response.getWriter().write("");
			}
		}
	}
	
	public String getToday() {

		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ChatDAO chatDAO = new ChatDAO();
		ArrayList<ChatDTO> chatList = chatDAO.getChatList(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		for(int i = 0; i < chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getChatName() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
			if(i != chatList.size() - 1) result.append(",");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() -1).getChatID() +"\"}");
		return result.toString();
		
	}
	
	public String getTen() {

		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ChatDAO chatDAO = new ChatDAO();
		ArrayList<ChatDTO> chatList = chatDAO.getChatListByRecent(10);
		for(int i = 0; i < chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getChatName() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
//			System.out.println("cn : " + chatList.get(i).getChatName());
//			System.out.println("cl : " + chatList.get(i).getChatContent());
			if(i != chatList.size() - 1) result.append(",");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() -1).getChatID() +"\"}");
		return result.toString();
		
	}
	
	public String getID(String chatID) {

		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ChatDAO chatDAO = new ChatDAO();
		ArrayList<ChatDTO> chatList = chatDAO.getChatListByRecent(chatID);
		for(int i = 0; i < chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getChatName() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatContent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatTime() + "\"}]");
//			System.out.println("IDcn : " + chatList.get(i).getChatName());
//			System.out.println("IDcl : " + chatList.get(i).getChatContent());
			if(i != chatList.size() - 1) result.append(",");
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() -1).getChatID() +"\"}");
		return result.toString();
		
	}	

	private void appendKeyValuePair(StringBuilder stringBuilder, String key, String value) {
	    stringBuilder.append("\"").append(key).append("\":\"").append(value).append("\"");
	}

	private String escapeString(String input) {
	    return input.replace("\n", "\\n").replace("\r", "\\r");
	}

}
