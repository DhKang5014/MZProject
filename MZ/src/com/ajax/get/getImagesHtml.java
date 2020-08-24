package com.ajax.get;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.master.DTO;

@WebServlet("/getImagesHtml")
public class getImagesHtml extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		DTO dto = (DTO)session.getAttribute("user");
		String email = dto.getEmail();
		String res = request.getParameter("res");
		System.out.println(res);
		
		PrintWriter out = response.getWriter();
		out.println(res);
	}

}
