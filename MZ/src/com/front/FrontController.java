package com.front;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.*;
import com.model.function.MessageFunctionDAO;
import com.model.function.joinDAO;
import com.model.function.loginDAO;
import com.model.function.selectDAO;
import com.model.function.updateDAO;
import com.model.master.DTO;
import com.model.master.MessageDTO;

@WebServlet("*.do")
public class FrontController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		String reqURI = request.getRequestURI();
		String path = request.getContextPath();
		String resultURI = reqURI.substring(path.length() + 1);

		
		Command command = null;
		String moveURL = null;
		
		if (resultURI.equals("AccountAllServiceCon.do")) {
			command = new AccountAllServiceCon();
		} else if (resultURI.equals("AlterJoinServiceCon.do")) {
			command = new AlterJoinServiceCon();
		} else if (resultURI.equals("JoinServiceCon.do")) {
			command = new JoinServiceCon();
		} else if (resultURI.equals("LoginServiceCon.do")) {
			command = new LoginServiceCon();
		} else if (resultURI.equals("LogoutServiceCon.do")) {
			command = new LogoutServiceCon();
		} else if (resultURI.equals("MessageDeleteServiceCon.do")) {
			command = new MessageDeleteServiceCon();
		} else if (resultURI.equals("MessageOneDeleteServiceCon.do")) {
			command = new MessageOneDeleteServiceCon();
		} else if (resultURI.equals("MessageServiceCon.do")) {
			command = new MessageServiceCon();
		} else {

		}
		moveURL = command.execute(request,response);
		response.sendRedirect(moveURL);
	}

}
