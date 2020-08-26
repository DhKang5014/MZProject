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
		String[] gender = request.getParameterValues("gender");
		for(int i=0;i<gender.length;i++) {
			System.out.println("gender >> "+gender[i]);
		}
		System.out.println(email + " / " + pw + " / " + name + " / " + age + " / " );
		int gender_num = 0;//남자
		if(!gender[0].equals("male")) {
			gender_num = 1;//여자
		}
		DTO dto = new DTO(email, pw, name, age, gender_num);
		joinDAO dao = new joinDAO();
		int cnt = dao.join(dto.getSql_join(), dto.getEmail(), dto.getPw(), dto.getName(), dto.getAge(),dto.getGender());
		if (cnt == 0) {
			moveURL = "fail";
		} else {
			moveURL = "index.jsp?email="+email;
		}
		return moveURL;
	}
	
}
