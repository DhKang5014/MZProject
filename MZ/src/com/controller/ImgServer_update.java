package com.controller;

import java.io.File;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.master.DTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.model.function.*;
import com.model.function.dao.photoDAO;

public class ImgServer_update implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
		DTO dto = (DTO) obj;
		System.out.println("ImgServer_update IN IN IN");
		String email = dto.getEmail();
		System.out.println("이미지 저장한 사람의 email : " + email);
		String fileName = "";
		String orgfileName = "";

		String uploadPath = "C:\\Users\\SMHRD\\git\\MZProject\\MZ\\WebContent\\upload\\" + email; // upload는 폴더명 / 폴더의
																									// 경로를 구해옴
		System.out.println("저장 경로  :  " + uploadPath);
		File f1 = new File(uploadPath);
		// 생성자에 전달된 파일이나 디렉토리가 물리적으로 존재하는지를 검사
		boolean is_exist = f1.exists();
		System.out.println("저장 전 dir 존재여부 : " + is_exist);
		
		if(is_exist == false) {
			f1.mkdir();
		}
		photoDAO dao = new photoDAO();
			try {
				MultipartRequest multi = new MultipartRequest( // MultipartRequest 인스턴스 생성(cos.jar의 라이브러리)
						request, uploadPath, // 파일을 저장할 디렉토리 지정
						10000 * 1024, // 첨부파일 최대 용량 설정(bite) / 10KB / 용량 초과 시 예외 발생
						"utf-8"//, // 인코딩 방식 지정
						//new DefaultFileRenamePolicy() // 중복 파일 처리(동일한 파일명이 업로드되면 뒤에 숫자 등을 붙여 중복 회피)
				);
				
				// email = multi.getParameter("email"); // form의 name="id"인 값을 구함

				/*
				 * form의 <input type="file"> name값을 모를 경우 name을 구할때 사용 Enumeration
				 * files=multi.getFileNames(); // form의 type="file" name을 구함 String file1
				 * =(String)files.nextElement(); // 첫번째 type="file"의 name 저장 String file2
				 * =(String)files.nextElement(); // 두번째 type="file"의 name 저장
				 */
				String[] name = uploadPath.split("\\\\");
				System.out.println(name.toString());
				fileName = multi.getFilesystemName("file"); // name=file1의 업로드된 시스템 파일명을 구함(중복된 파일이 있으면, 중복 처리 후 파일 이름)
				orgfileName = multi.getOriginalFileName("file"); // name=file1의 업로드된 원본파일 이름을 구함(중복 처리 전 이름)
				System.out.println("ImgServer_update fileName 2 IN IN IN >> "+fileName);
				String result = dao.dup_check(dto.getSql_photo_dup_check(), fileName, email);
				if(result == null)dao.insert( dto.getSql_photo_insert(),fileName, email,uploadPath);

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("ImgServer_update 오류 오류 오류");
			} // 업로드 종료
		
		return "imgServer.jsp";
	}

}
