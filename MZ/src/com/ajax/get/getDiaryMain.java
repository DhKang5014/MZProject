package com.ajax.get;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.function.dao.diaryMainDAO;
import com.model.master.DTO;

/**
 * Servlet implementation class getDiaryMain
 */
@WebServlet("/getDiaryMain")
public class getDiaryMain extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		DTO dto = (DTO)session.getAttribute("user");
		String email = dto.getEmail();
		diaryMainDAO dm_dao = new diaryMainDAO();
		String result = dm_dao.getJsonHTML(dto.getSql_diary_main_select(), email);
		PrintWriter out = response.getWriter();
		out.print(result);
		
	}

}
