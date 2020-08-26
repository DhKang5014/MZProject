package com.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import com.front.Command;
import com.model.func.getHtmlDAO;

import com.model.master.DTO;

public class getHtmlServiceCon implements Command {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("들어옴");
		int i = (Integer.parseInt(request.getParameter("i")));
		System.out.println(i);
		
		getHtmlDAO dao = new getHtmlDAO();
		ArrayList<String> list = null;
		
		String title = null;
		String content = null;
	

		for (int j= 1; j < i+1; j++) {
			System.out.println("getHtmlServiceCon >> dao 들어갑니다.");
			list =  dao.getFile(j);
			System.out.println("getHtmlServiceCon >> list는 >>>>>>>>>>>>>>>>>>>>>>>> "+list.get(j-1));
			
			title = dao.getTitle(list.get(j-1));
			System.out.println("getHtmlServiceCon의 제목 >> " + title);
			content = dao.getcontent(list.get(j-1));
			System.out.println("getHtmlServiceCon의 내용>> " + content);
		}

		
		
		HttpSession session = request.getSession();
		session.setAttribute("title", title);
		session.setAttribute("content", content);
		session.setAttribute("list", list);
		String moveURL = "gethtml.jsp";
		
		
		return moveURL;
	}

	
}
