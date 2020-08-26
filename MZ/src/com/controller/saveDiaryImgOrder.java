package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.function.dao.diaryMainDAO;
import com.model.function.dao.photoOrderDAO;
import com.model.function.dao.postDAO;
import com.model.master.DTO;

public class saveDiaryImgOrder implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		DTO dto = (DTO)obj;
		String email = dto.getEmail();
		String file_name = request.getParameter("file_name");
		String src = request.getParameter("src");
		postDAO postdao = new postDAO(); 
		photoOrderDAO ph_or_dao = new photoOrderDAO();
		
		
		System.out.println("saveDiaryImgOrder .do in >> email >> " + email);
		System.out.println("saveDiaryImgOrder .do in >> file_name >> " + file_name);
		System.out.println("saveDiaryImgOrder .do in >> src >> " + src);
		
		
		
			String[] ar_src = src.split(",");
			String[] file_name_ar = file_name.split("/");
			for(int i=0;i<file_name_ar.length;i++) {
				System.out.println("file_name_ar >> " + i + " >> " + file_name_ar[i]);
			}	
			for(int i=0;i<ar_src.length;i++) {
				String file_name_ar_ar[] = ar_src[i].split("/");
				int cnt = postdao.getPostNumber(dto.getSql_diary_num_get_select(), email, file_name_ar[2]);
				System.out.println("po_num >> " + cnt);
				String flag = null;
				flag = ph_or_dao.select(dto.getSql_photo_order_select_one(), file_name_ar[2], email, ar_src[i]);
				if(flag == null) {
					ph_or_dao.insert(dto.getSql_photo_order_insert(),  file_name_ar_ar[file_name_ar_ar.length-1], email,  ar_src[i], i, cnt,file_name_ar[2]);
				}else {
					System.out.println(" saveDiaryImgOrder execute 이미 저장이 되어 있습니다.");
				}
			}	
		
		
		
		return "diary2.jsp";
	}

}
