package com.ajax.get;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
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

@WebServlet("/getDiaryHTML")
public class getDiaryHTML extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		DTO dto = (DTO)session.getAttribute("user");
		String email = "";
		if(dto!=null) {
			email = dto.getEmail();
		}
		String file_name = request.getParameter("file_name");
		System.out.println("getDiaryHTML >> email >> " + email);
		System.out.println("getDiaryHTML >> file_name >> " + file_name);
		String path = "C:/Users/SMHRD/git/MZProject/MZ/WebContent/" + file_name;
		PrintWriter out = response.getWriter();
		BufferedReader bufferedReader = null;
		try{
            //파일 객체 생성
            File file = new File(path);
            //입력 스트림 생성
            
            bufferedReader = new BufferedReader(new FileReader(path));
            
            while(true) {
                String line = bufferedReader.readLine();
                
                if(line == null) {
                    break;
                }
                
                out.println(line);
            }
            
            bufferedReader.close();
        }catch (FileNotFoundException e) {
            // TODO: handle exception
        	System.out.println("getDiaryHTML >> 파일을 찾지 못했습니다.");
        }catch(IOException e){
            System.out.println(e);
        }
		
		

	}

}
