package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.function.dao.joinDAO;
import com.model.master.DTO;

public class DupCheck implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		System.out.println(email);
		joinDAO dao = new joinDAO();
		DTO dto = new DTO(email);
		DTO new_dto = null;
		new_dto = dao.dup_check(dto.getSql_email_dup_check(), email);
		if(new_dto == null) {
			HttpSession session = request.getSession();
			session.setAttribute("dup_check", "ok");
			System.out.println("email is not dup");
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("dup_check", "dup");
			System.out.println("email is dup");
		}
		return "main.jsp";
	}

}
