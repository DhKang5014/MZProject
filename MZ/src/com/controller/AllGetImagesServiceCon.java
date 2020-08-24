package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.function.DTO.photoDTO;
import com.model.function.dao.photoDAO;
import com.model.master.DTO;

public class AllGetImagesServiceCon implements Command {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		DTO dto = (DTO)session.getAttribute("user");
		String email = dto.getEmail();
		photoDAO dao = new photoDAO();
		String result = dao.select_all(dto.getSql_photo_select_all(), email);
		
		session.setAttribute("photo_all", result);
		return "imgServer.jsp";
	}

}
