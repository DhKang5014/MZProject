package com.ajax.get;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.master.DTO;

@WebServlet("/getDiaryImg")
public class getDiaryImg extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		
		
		Object obj = session.getAttribute("user");
		DTO dto = (DTO)obj;
		String email = (String)dto.getEmail();
		String file_name = request.getParameter("file_name");
		System.out.println("getDiaryEmail >> email >> " + email);
		System.out.println("getDiaryEmail >> file_name >> " + file_name);
		String path = "C:/Users/SMHRD/git/MZProject/MZ/WebContent/"+file_name;
		File f1 = new File(path);
		PrintWriter out = response.getWriter();
		System.out.println("f1 = " + f1);
		//전달된 경로가 파일인지 점사
		// --> 존재하지 않는 파일로 검사할 경우 무조건 false
		boolean is_file = f1.isFile();
		System.out.println("지정된 경로가 파일인지 검사 - is_file = " + is_file);
		// 전달된 경로가 디렉토리인지 검사
		// --> 존재하지 않는 파일로 검사할 경우 무조건 false
		boolean is_hidden = f1.isHidden();
		System.out.println("전달된 경로가 디렉토리인지 검사 - is_hidden = " + is_hidden);
		BufferedReader bufferedReader = null;
        
        try {
            
            
            bufferedReader = new BufferedReader(new FileReader(path));
            
            while(true) {
                String line = bufferedReader.readLine();
                
                if(line == null) {
                    break;
                }
                
                out.print(line);
            }
            
            bufferedReader.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
        
	}

}
