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
		String[] gender = request.getParameterValues("gender");
		for(int i=0;i<gender.length;i++) {
			System.out.println("gender >> "+gender[i]);
		}
		
		int gender_num = 0;//남자
		if(!gender[0].equals("male")) {
			gender_num = 1;//여자
		}
		System.out.println(pw);
		System.out.println(name);
		System.out.println(age);
		System.out.println(gender_num);
		

		HttpSession session = request.getSession();
		Object user = session.getAttribute("user");
		DTO dto = (DTO) user;
		updateDAO dao = new updateDAO();

		dto.setPw(pw);
		dto.setName(name);
		dto.setAge(age);
		dto.setAge(gender_num);

		System.out.println(dto.getSql_update());
		System.out.println(dto.getEmail());
		System.out.println(dto.getPw());
		System.out.println(dto.getName());
		System.out.println(dto.getAge());
		System.out.println(dto.getGender());
		int cnt = 0;
		cnt = dao.update(dto.getSql_update(), dto.getEmail(), dto.getPw(), dto.getName(), dto.getAge(),dto.getGender());
		System.out.println(cnt + "개 회원가입 성공하셨습니다.");
		moveURL = "index.jsp";
	
		return moveURL;
	}

}
