package com.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.function.dao.joinDAO;
import com.model.master.DTO;

public class JoinServiceCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;
		// GET email.pw,tel,addr
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		int gender = Integer.parseInt(request.getParameter("gender"));
		System.out.println(email + " / " + pw + " / " + name + " / " + age + " / " + gender);

		DTO dto = new DTO(email, pw, name, age, gender);
		joinDAO dao = new joinDAO();
		int cnt = dao.join(dto.getSql_join(), dto.getEmail(), dto.getPw(), dto.getName(), dto.getAge(),dto.getGender());
		if (cnt == 0) {
			moveURL = "fail";
		} else {
			moveURL = "main.html";
		}
		return moveURL;
	}
	
}
