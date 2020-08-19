<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model.master.*" %>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.model.function.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




	<%
		session = request.getSession();
		DTO dto = (DTO) session.getAttribute("user");
		String email = dto.getEmail();
		postDAO po_dao = new postDAO();
		String result = po_dao.select_email(dto.getSql_post_select_email(), email);
	%>
	
	<%=result%>
	
	
</body>
</html>