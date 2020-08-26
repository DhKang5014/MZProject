<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model.master.*" %>
<%@ page import="com.model.function.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<%
		String advice = request.getParameter("advice");
		String result = advice.equals("자연") ? "자연" : "관광명소";
		String email = "";
		email = request.getParameter("email");
		DTO dto = new DTO(email);
		loginDAO dao = new loginDAO();
		if(email.equals("")){
			email = "아무개";
		}else{
			DTO dto_out = dao.login(dto.getSql_login_only_email() , dto.getEmail());
			
			if (dto_out != null) {
				System.out.println("LoginServiceCon >> email >>" + dto_out.getEmail());
				System.out.println("LoginServiceCon >> pw >>" + dto_out.getPw());
				System.out.println("LoginServiceCon >> name >>" + dto_out.getName());
				System.out.println("LoginServiceCon >> age >>" + dto_out.getAge());
				System.out.println("LoginServiceCon >> gender >>" + dto_out.getGender());
				session.setAttribute("user", dto_out);
			} 
			email = dto.getEmail();
		}
		
	%>
	
	<h1><%=email %>님에게 추천 드릴 여행지는 <%=result %> 입니다.</h1>
	


</body>
</html>