package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.front.Command;
import com.model.function.pubsubDAO;
import com.model.master.DTO;

public class SubscriberCreateServiceCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		System.out.println("subSub Create Service con >> email:  "+email);
		pubsubDAO ps_dao = new pubsubDAO();
		DTO dto = new DTO(email);
		int cnt = ps_dao.insert(dto.getSql_subscriber_check(), dto.getSql_subscriber_insert(),email);
		return "main.jsp";
	}

}
