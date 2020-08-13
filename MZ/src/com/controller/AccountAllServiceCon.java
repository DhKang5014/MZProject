package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.function.selectDAO;

public class AccountAllServiceCon implements Command{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;
		// GET email, pw, tel, addr
		selectDAO dao = new selectDAO();

		String account = dao.select("select * from web_member");

		HttpSession session = request.getSession();
		session.setAttribute("all_user", account);
		moveURL = "select.jsp";
		return moveURL;
	}
	
}
