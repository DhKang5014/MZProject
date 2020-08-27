package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;

public class LogoutServiceCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// GET email.pw,tel,addr
		HttpSession session = request.getSession();
		// session.setAttribute("user", null);
		session.removeAttribute("user");
		return "index.jsp";
	}

}
