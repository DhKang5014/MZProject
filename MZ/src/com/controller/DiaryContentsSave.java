package com.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.function.dao.diaryMainDAO;
import com.model.master.DTO;

public class DiaryContentsSave implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		DTO dto = (DTO)session.getAttribute("user");
		String email = dto.getEmail();
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		String stitle = request.getParameter("stitle");
		System.out.println("title : >> " + title);
		System.out.println("stitle : >> " + stitle);
		System.out.println("content : >> " + content);
		
		diaryMainDAO dm_dao = new diaryMainDAO();
		ArrayList<String> re = null;
		re = dm_dao.select(dto.getSql_diary_main_select(), email);
		if(re==null) {
			dm_dao.insert(dto.getSql_diary_main_insert(), email, title, stitle, content);
		}else {
			dm_dao.update(dto.getSql_diary_main_update(), email, title, stitle, content);
		}

		return "diary2.jsp";
	}
	
}
