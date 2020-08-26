package com.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.function.dao.MessageFunctionDAO;
import com.model.function.dao.loginDAO;
import com.model.master.DTO;

public class LoginServiceCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String html = null;
		// GET email.pw,tel,addr
		System.out.println("로그인 설피스");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		System.out.println(email + " " + pw);

		DTO dto = new DTO(email, pw);
		System.out.println(dto.getEmail() + " " + dto.getPw());
		loginDAO dao = new loginDAO();

		DTO dto_out = dao.login(dto.getSql_login(), dto.getEmail(), dto.getPw());
		MessageFunctionDAO dao_msg = new MessageFunctionDAO();
		if (dto_out != null) {
			System.out.println("LoginServiceCon >> email >>" + dto_out.getEmail());
			System.out.println("LoginServiceCon >> pw >>" + dto_out.getPw());
			System.out.println("LoginServiceCon >> name >>" + dto_out.getName());
			System.out.println("LoginServiceCon >> age >>" + dto_out.getAge());
			System.out.println("LoginServiceCon >> gender >>" + dto_out.getGender());
			html = dao_msg.select(email);
			HttpSession session = request.getSession();
			session.setAttribute("user", dto_out);
			session.setAttribute("msg", html);
		} 
		return "index.jsp?email="+email;
		
	}

}
