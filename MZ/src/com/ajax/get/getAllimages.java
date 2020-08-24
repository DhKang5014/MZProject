package com.ajax.get;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.function.dao.photoDAO;
import com.model.master.DTO;

/**
 * Servlet implementation class getAllimages
 */
@WebServlet("/getAllimages")
public class getAllimages extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		DTO dto = (DTO)session.getAttribute("user");
		String email = dto.getEmail();
		photoDAO dao = new photoDAO();
		String result = dao.select_all(dto.getSql_photo_select_all(), email);
		
		session.setAttribute("photo_all", result);
		PrintWriter out = response.getWriter();
		out.println(result.toString());
		
	}

}
