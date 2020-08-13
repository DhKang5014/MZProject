package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.front.Command;
import com.model.function.MessageFunctionDAO;
import com.model.master.MessageDTO;

public class MessageServiceCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String send = request.getParameter("send");
		String receive = request.getParameter("recieve");
		String message = request.getParameter("message");
		System.out.println(send + " " + receive + " " + message);

		MessageDTO dto = new MessageDTO(send, receive, message);
		MessageFunctionDAO dao = new MessageFunctionDAO();
		dao.insert(send, receive, message);
		dao.select(receive);
		return "main.jsp";
	}

}
