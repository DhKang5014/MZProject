package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.function.dao.MessageFunctionDAO;
import com.model.master.DTO;

public class MessageDeleteServiceCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		DTO dto = (DTO) obj;
		int cnt = 0;
		if (dto != null) {
			String receive = dto.getEmail();
			MessageFunctionDAO dao = new MessageFunctionDAO();
			cnt = dao.delete_all(receive);
		}
		if (cnt > 0) {
			System.out.println("delete all serviceCon");
		} else {
			System.out.println("delete all serviceCon");
		}
		
		return "main.jsp";
	}

}
