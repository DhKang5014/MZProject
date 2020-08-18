package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.function.photoDAO;
import com.model.master.DTO;

public class UserPlaceResisterServiceCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String move_URL = null;
		String file_name = request.getParameter("file_name");
		double lat = Double.parseDouble(request.getParameter("lat"));
		double lon = Double.parseDouble(request.getParameter("lon"));
		String plu_name = request.getParameter("place_name");
		System.out.println("file_name : " + file_name);
		System.out.println("lat : " + lat);
		System.out.println("lon : " + lon);
		System.out.println("place_name : " + plu_name);
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		DTO dto = (DTO) obj;
		String email = dto.getEmail();
		String sql_photo_latlon_insert = "insert into photo(lat,lon,plu_name) where name = ? and email = ?";
		photoDAO ph_dao = new photoDAO();
		int cnt = ph_dao.insert_latlon(dto.getSql_photo_latlon_insert(), lat, lon, plu_name, file_name, email);
		if(cnt==0) {
			move_URL ="imgDiary.jsp";
		}else {
			move_URL = "imgDiary.jsp";
		}
		
		return move_URL;
	}

}
