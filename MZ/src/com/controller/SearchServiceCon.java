package com.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.front.Command;

import com.model.func.SearchDAO;
import com.model.func.SearchDAO;
import com.model.func.SearchDTO;

import com.model.master.DTO;
import com.model.master.DTO_suhyeon;

public class SearchServiceCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String moveURL = null;
		HttpSession session = request.getSession();
		ArrayList<SearchDTO> searchEmail = null;
		ArrayList<String> searchName = null;
		ArrayList<String> searchCategory = null;
		ArrayList<String> searchPlace = null;
		String title = null;
		String content = null;
		String img_url = null;
		ArrayList<String> title_list = new ArrayList<String>();
		ArrayList<String> content_list = new ArrayList<String>();
		
		System.out.println("검색 기능에 들어왔습니다. ");
		
		String value = request.getParameter("search");
		String selected = request.getParameter("select");

		
		System.out.println("search = "+ value);
		System.out.println("selected = "+ selected);
		
		
		SearchDTO searchdto = new SearchDTO();
		SearchDAO searchdao = new SearchDAO();
		DTO_suhyeon dto = new DTO_suhyeon();
		
		
		
		session.setAttribute("selected", selected);
		
		if (selected.equals("email")) {
			searchEmail = searchdao.searchEmail(dto.getSql_search_useremail(), "%"+value+"%");
			if (searchEmail != null) {
				System.out.println("이메일 검색 성공");
				System.out.println("파일 가지고 오기 >>>>>>>> "+searchdao.getFile(1));
				System.out.println("서치이메일 >>>>>>>>>> "+searchEmail);
				
				
				for (int i = 0; i < searchEmail.size(); i++) {
					 // 검색된 이메일의 모든 post 제목을 배열로 가지고 오면 댐! -> 이 후에 DB랑 연결 후 수정
					
					System.out.println("파일의"+i+"번째 >>>>>>>>>> "+searchdao.getFile(1).get(0));
					
					title = searchdao.getTitle(searchdao.getFile(1).get(0));
					content = searchdao.getcontent(searchdao.getFile(1).get(0));
					
					title_list.add(title);
					content_list.add(content);
					
					img_url = searchEmail.get(i).getImg_url();
					
					System.out.println("제목>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+title_list);
					System.out.println("내용>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+content_list);
					
					
				}
					
				session.setAttribute("img_url", img_url);
				session.setAttribute("title_list", title_list);
				session.setAttribute("content_list", content_list);
				session.setAttribute("email", searchEmail);
				moveURL = "Search.jsp";
			}else {
				System.out.println("이메일 검색 실패");
				moveURL = "Search.jsp";
			}
			
		}else if(selected.equals("name")) {
			searchName = searchdao.searchName(dto.getSql_search_username(), "%"+value+"%");
			if (searchName != null) {
				System.out.println("이름 검색 성공");
				session.setAttribute("name", value);
				moveURL = "Search.jsp";
			}else {
				System.out.println("이름 검색 실패");
				moveURL = "Search.jsp";
			}
		}else if(selected.equals("category")) {
			searchCategory = searchdao.searchCategory(dto.getSql_search_category(), "%"+value+"%");
			
			if (searchCategory != null) {
				System.out.println("테마 검색 성공");
				session.setAttribute("category", value);
				moveURL = "Search.jsp";
			}else {
				System.out.println("테마 검색 실패");
				moveURL = "Search.jsp";
			}
			
		}else {
			searchPlace = searchdao.searchPlace(dto.getSql_search_place(), "%"+value+"%");
			
			if (searchPlace != null) {
				System.out.println("장소 검색 성공");
				session.setAttribute("place", value);
				moveURL = "Search.jsp";
			}else {
				System.out.println("장소 검색 실패");
				moveURL = "Search.jsp";
			}
		}
		
		return moveURL;
	
	


	}
}