package com.controller;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.function.dao.photoDAO;
import com.model.master.DTO;

public class UserPlaceResisterServiceCon implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		
		
		
		String move_URL = null;
		String file_name = request.getParameter("file_name");
		double lat = Double.parseDouble(request.getParameter("lat"));
		double lon = Double.parseDouble(request.getParameter("lon"));
		String plu_name = request.getParameter("place_name");
		String date_time = request.getParameter("date_time");
		System.out.println("file_name : " + file_name);
		System.out.println("lat : " + lat);
		System.out.println("lon : " + lon);
		System.out.println("place_name : " + plu_name);
		System.out.println("date_time : " + date_time);
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		DTO dto = (DTO) obj;
		String email = dto.getEmail();
		photoDAO ph_dao = new photoDAO();
		System.out.println("UserPlaceResisterServiceCon 중간부");
		
		int cnt = ph_dao.insert_latlon(dto.getSql_photo_latlon_insert(), lat, lon, plu_name, file_name.toLowerCase(), email,date_time);
		if(cnt==0) {
			System.out.println("UserPlaceResisterServiceCon insert Error >> ");
			move_URL ="imgDiary.jsp";
		}else {
			System.out.println("UserPlaceResisterServiceCon insert Success >> ");
			move_URL = "imgDiary.jsp";
		}
		
		return move_URL;
	}

}
