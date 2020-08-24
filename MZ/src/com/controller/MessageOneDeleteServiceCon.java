package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.function.dao.MessageFunctionDAO;
import com.model.master.DTO;

public class MessageOneDeleteServiceCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println(num);
		HttpSession session = request.getSession();
		Object user = session.getAttribute("user");
		DTO dto = (DTO) user;
		MessageFunctionDAO dao = new MessageFunctionDAO();
		int cnt = 0;
		cnt = dao.delete(dto.getEmail(), num);
		
		if (cnt > 0) {
			System.out.println("개별삭제성공");
		} else {
			System.out.println("개별삭제실패");
		}
		
		return "main.jsp";
	}

}
