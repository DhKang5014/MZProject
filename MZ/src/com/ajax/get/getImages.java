package com.ajax.get;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.function.dao.photoDAO;
import com.model.function.dao.photoDAO.temp;
import com.model.master.DTO;

/**
 * Servlet implementation class getImages
 */
@WebServlet("/getImages")
public class getImages extends HttpServlet {
  
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
	    System.out.println("GetImages IN NOW...");
	    PrintWriter out = response.getWriter();
	    HttpSession session = request.getSession();
		DTO dto = (DTO)session.getAttribute("user");
		String email = dto.getEmail();
		photoDAO dao = new photoDAO();
		ArrayList<temp> result = dao.select_diary_img(dto.getSql_photo_select_all(), email);
		String str = "{";
		for(int i=0;i<result.size();i++) {
			System.out.println("getImages IN IN IN " + result.get(i).path.split("/").toString());
			String new_path = "/img/"+result.get(i).path.split("/")[1] + "/" + result.get(i).path.split("/")[2];
			System.out.println("new Path >> " + new_path);
			str += "\""+i + "\":\"" + new_path +"\",";
			str += "\""+i + "_name\":\"" + result.get(i).name+"\",";
			str += "\""+i + "_plu_name\":\"" + result.get(i).plu_name + "\"";
			if(i!=result.size()-1) {
				str += ",";
			}else {
				str += "}";
			}
		}
		out.println(str);
	}

}
