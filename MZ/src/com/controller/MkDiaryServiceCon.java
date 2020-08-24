package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.function.dao.photoDAO;
import com.model.function.dao.postDAO;
import com.model.master.DAO;
import com.model.master.DTO;
import com.oreilly.servlet.MultipartRequest;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;


public class MkDiaryServiceCon implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		String file_name = request.getParameter("file_name")+".html";
		String meta = request.getParameter("meta");
		String img_url = request.getParameter("img_title_url");
		System.out.println(content);
		System.out.println(title);
		System.out.println(file_name);
		System.out.println(meta);
		System.out.println("img_url >> " + img_url);
		HttpSession session = request.getSession();
		DTO dto =  (DTO)session.getAttribute("user");
		String email = dto.getEmail();
		
		
		
		////////////////MAKE FILE HTML//////////////////////////
		
		// 절대경로나 상대경로를 생성자 파라미터로 전달한다.
		// 이클립스에서 상대경로를 사용할 경우, 현재 프로젝트가 기준이된다.
		// 1번 예시 : 경로가 미리 있어야만 저장이 가능하다.
		String path = "C:/Users/SMHRD/git/MZProject/MZ/WebContent/mkhtml/"+email+"/"+file_name;
		File f1 = new File(path);
		System.out.println("f1 = " + f1);
		//전달된 경로가 파일인지 점사
		// --> 존재하지 않는 파일로 검사할 경우 무조건 false
		boolean is_file = f1.isFile();
		System.out.println("지정된 경로가 파일인지 검사 - is_file = " + is_file);
		// 전달된 경로가 디렉토리인지 검사
		// --> 존재하지 않는 파일로 검사할 경우 무조건 false
		boolean is_hidden = f1.isHidden();
		System.out.println("전달된 경로가 디렉토리인지 검사 - is_hidden = " + is_hidden);
		
		// 절대 경로값을 추출
		String abs = f1.getAbsolutePath();
		System.out.println("지정된 절대경로 : " + abs);
		
		// 생성자에 전달된 파일이나 디렉토리가 물리적으로 존재하는지를 검사
		boolean is_exist = f1.exists();
		System.out.println("저장 전 html 존재여부 : " + is_exist);
		
		if(is_exist == false) {
			File f2 = new File(f1.getParent());
			f2.mkdir();
		}
		
		//파일 만들기
		try {
			f1.createNewFile();
		}catch(IOException e) {
			e.printStackTrace();
		}
		is_exist = f1.exists();
		System.out.println("저장 후 html 존재 여부 : " + is_exist);
				
		
		
		
		//파일에 저장할 내용 - title + content
		String res = meta;
		
		/** 특정 인코딩 방식 적용 **/
		// 객체나 배열이 선언과 할당에 대한 블록이 서로분리되어 있을 경우
		// 명시적으로 빈 영역임을 알리기 위해 null로 초기화 한다.
		byte[] buffer = null;
		
		// 문자열을 "utf-8"로 인코딩해서 저장 =>
		// 영어, 숫자, : 1byte , 한글 : 3byte
		try {
			buffer = res.getBytes("UTF-8");
		}catch(UnsupportedEncodingException e) {
			System.out.print("encoding 지정 에러");
		}
		
		/** 파일 저장 절차 시작 **/
		OutputStream out = null;
		// 파일이 없으면 파일을 만들면서, 오픈시킴
		try {
			out = new FileOutputStream(path, true);
			out.write(buffer);
			System.out.println("[INFO] 파일 저장됨 >> " + path);
		}catch(FileNotFoundException e) {
			System.out.println("[ERROR] 저장 경로를 찾을 수 없습니다.");
		}catch (IOException e) {
			e.printStackTrace();
		}catch(Exception e) {
			System.out.println("[ERROR] 알 수 없는 에러가 발생했습니다.");
		}finally {
			if(out != null) {
				try {
					out.close();
				}catch(IOException e) {
					System.out.println("파일 닫기 실패");
					//e.printStackTrace();
					//파일 스트림 닫기
				}
			}
		}
		
		
		//DB에 다이어리 정보 저장하기
		postDAO po_dao = new postDAO();
		DTO dao = new DTO(email);
		int cnt = po_dao.select_email_title(dto.getSql_post_select_email_file(), email, file_name);
		if(cnt==0) {
			po_dao.insert(dto.getSql_post_insert(), file_name, email, img_url);
		}
		
		return "saveDiaryImgOrder";
	}

}
