package com.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.model.master.DTO;

public class MkDir implements Command{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Object user = session.getAttribute("user");
		DTO dto = (DTO) user;
		// 폴더를 만들 디렉토리 경로(Window 기반)
		
        String folderPath = "C:\\Users\\SMHRD\\git\\MZProject\\MZ\\WebContent\\upload\\"+dto.getEmail();
        File makeFolder = new File(folderPath);
 
        // folderPath의 디렉토리가 존재하지 않을경우 디렉토리 생성.
        if(!makeFolder.exists()) {
            
            // 폴더를 생성합니다.
            makeFolder.mkdir(); 
            System.out.println("폴더를 생성합니다.");
            
            // 정성적으로 폴더 생성시 true를 반환합니다.
            System.out.println("폴더가 존재하는지 체크 true/false : "+makeFolder.exists());
            
        } else {
            System.out.println("이미 해당 폴더가 존재합니다.");
        }
		
		return "main.jsp";
	}

}
