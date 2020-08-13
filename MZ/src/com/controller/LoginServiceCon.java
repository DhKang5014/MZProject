package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.function.MessageFunctionDAO;
import com.model.function.loginDAO;
import com.model.master.DTO;

public class LoginServiceCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String html = null;
		// GET email.pw,tel,addr
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		System.out.println(email + " " + pw);

		DTO dto = new DTO(email, pw);
		System.out.println(dto.getEmail() + " " + dto.getPw());
		loginDAO dao = new loginDAO();

		DTO dto_out = dao.login(dto.getSql_login(), dto.getEmail(), dto.getPw());
		MessageFunctionDAO dao_msg = new MessageFunctionDAO();
		if (dto_out != null) {
			System.out.println(dto_out.getEmail());
			System.out.println(dto_out.getPw());
			System.out.println(dto_out.getName());
			System.out.println(dto_out.getAge());
			System.out.println(dto_out.getGender());
			html = dao_msg.select(email);
			HttpSession session = request.getSession();
			session.setAttribute("user", dto_out);
			session.setAttribute("msg", html);
		} else {
			System.out.println("로그인 실패하셨습니다.");
		}
		return "login.jsp";
	}

}
