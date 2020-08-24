package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.function.dao.updateDAO;
import com.model.master.DTO;

public class AlterJoinServiceCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;
		String pw = (String) request.getParameter("pw");
		String name = (String) request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		int gender = Integer.parseInt(request.getParameter("gender"));

		System.out.println(pw);
		System.out.println(name);
		System.out.println(age);
		System.out.println(gender);
		

		HttpSession session = request.getSession();
		Object user = session.getAttribute("user");
		DTO dto = (DTO) user;
		updateDAO dao = new updateDAO();

		dto.setPw(pw);
		dto.setName(name);
		dto.setAge(age);
		dto.setAge(gender);

		System.out.println(dto.getSql_update());
		System.out.println(dto.getEmail());
		System.out.println(dto.getPw());
		System.out.println(dto.getName());
		System.out.println(dto.getAge());
		System.out.println(dto.getGender());
		int cnt = 0;
		cnt = dao.update(dto.getSql_update(), dto.getEmail(), dto.getPw(), dto.getName(), dto.getAge(),dto.getGender());
		System.out.println(cnt + "개 회원가입 성공하셨습니다.");
		moveURL = "main.jsp";
	
		return moveURL;
	}

}
