package com.ajax.get;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.model.function.DTO.photoOrderDTO;
import com.model.function.DTO.photoOrderJoinDTO;
import com.model.function.dao.photoOrderDAO;
import com.model.function.dao.postDAO;
import com.model.master.DTO;


@WebServlet("/getDiaryImgOrderFromDB")
public class getDiaryImgOrderFromDB extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		DTO dto  = (DTO)session.getAttribute("user");
		String email = dto.getEmail();
		String file_name = request.getParameter("file_name");
		System.out.println("com.front In getDiaryImgOrderFromDB ,, ajax >> email >> " + email);
		file_name = "mkhtml/"+email+"/"+file_name;
		System.out.println("com.front In getDiaryImgOrderFromDB ,, ajax >> file_name >> " + file_name);
		
		ArrayList<String> ar = null;
		postDAO postdao = new postDAO(); 
		//fileName split - /
		String[] file_name_ar = file_name.split("/");
		System.out.println(file_name_ar[0]);
		System.out.println(file_name_ar[1]);
		System.out.println(file_name_ar[2]);
		int cnt = postdao.getPostNumber(dto.getSql_diary_num_get_select(), email, file_name_ar[2]);
		
		
		photoOrderDAO ph_or_dao = new photoOrderDAO();
		ArrayList<photoOrderJoinDTO> ph_or_dto = ph_or_dao.join_select(dto.getSql_photo_order_join_select() ,email, cnt);
		
		
		 String json = new Gson().toJson(ph_or_dto);
		System.out.println("json 변환 : " + json);
		//String str = "{ \"obj\" : [";
		for(int i=0;i<ph_or_dto.size();i++) {
			System.out.println("com.front IN getDiaryImgOrderFromDB ,, photoDB  >> name >> " + ph_or_dto.get(i).getName());
			System.out.println("com.front IN getDiaryImgOrderFromDB ,, photoDB  >> email >> " + ph_or_dto.get(i).getEmail());
			System.out.println("com.front IN getDiaryImgOrderFromDB ,, photoDB  >> img_url >> " + ph_or_dto.get(i).getImg_url());
			System.out.println("com.front IN getDiaryImgOrderFromDB ,, photoDB  >> po_title >> " + ph_or_dto.get(i).getNum());
			System.out.println("com.front IN getDiaryImgOrderFromDB ,, photoDB  >> order_num >> " + ph_or_dto.get(i).getOrder_num());
			System.out.println("com.front IN getDiaryImgOrderFromDB ,, photoDB  >> lat >> " + ph_or_dto.get(i).getLat());
			System.out.println("com.front IN getDiaryImgOrderFromDB ,, photoDB  >> lat >> " + ph_or_dto.get(i).getLon());
			System.out.println("com.front IN getDiaryImgOrderFromDB ,, photoDB  >> po_num >> " + ph_or_dto.get(i).getPo_num());
			System.out.println("com.front IN getDiaryImgOrderFromDB ,, photoDB  >> po_title >> " + ph_or_dto.get(i).getPo_title());
			System.out.println("com.front IN getDiaryImgOrderFromDB ,, photoDB  >> plu_name >> " + ph_or_dto.get(i).getPlu_name());
			System.out.println();
			
	
//			str += "{\"name\" : \"" + ph_or_dto.get(i).getName() +"\",";
//			str += "\"email\" : \"" + ph_or_dto.get(i).getEmail() +"\",";
//			str += "\"img_url\" : \"" + ph_or_dto.get(i).getImg_url() +"\",";
//			str += "\"order_num\" : \"" + ph_or_dto.get(i).getOrder_num() +"\",";
//			str += "\"po_num\" : \"" + ph_or_dto.get(i).getPo_num() +"\",";
//			str += "\"po_title\" : \"" + ph_or_dto.get(i).getPo_title() +"\"}";
//			if(i!=ph_or_dto.size()-1) str+=",";
	
		}
		//str += "]}";
		PrintWriter out = response.getWriter();
		out.println(json);
	
		
	}

}
