package com.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.front.Command;
public class LoginCheckServiceCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// Get email
		System.out.print("이메일 중복 체크");
		String email = request.getParameter("email");
		System.out.println("email : " + email);
		
		
		
		return null;
	}
	
}
