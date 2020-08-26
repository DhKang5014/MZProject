package com.ajax.get;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.model.function.DTO.photoDTO;
import com.model.function.dao.photoDAO;
import com.model.master.DTO;

/**
 * Servlet implementation class getLocation
 */
@WebServlet("/getLocation")
public class getLocation extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// Get User Email Login
		HttpSession session = request.getSession();
		DTO dto = (DTO)session.getAttribute("user");
		String email = "a";
		if(dto != null) {
			email = dto.getEmail();
		}
		
		//Get lat, lon From PHOTO Information
		photoDAO po_dao = new photoDAO();
		photoDTO po_dto = new photoDTO();
		ArrayList<photoDTO> ar = po_dao.select_lat_lon_from_email(po_dto.getSql_select_email(), email);
		
		//output json
		PrintWriter out = response.getWriter();
		String json = new Gson().toJson(ar);
		out.println(json);
		
	}

}
