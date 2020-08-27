<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model.master.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% DTO dto = (DTO)session.getAttribute("user"); 
String email = "";
if(dto== null){
		email = "";
	}else{
		email = dto.getEmail();
	}
request.setCharacterEncoding("utf-8");
String r = request.getParameter("contents");
System.out.println("machineL, contents >> " + r);
%>
	<h1>다이어리 입력</h1>
	<form action="http://127.0.0.1:9200/diary/predict" method="post" name="frm">
		<div>
		
			<table>
			
				<tr>
					<td>내용</td>
					<td><textarea name ="contents" placeholder="내용을 입력하세요"><%=r %></textarea></td>
					<td><input type = "hidden" name = "email" value=<%=email%>></td>
				</tr>
				
			<!--    -->  
			
			</table>
		</div>
		<p>
		<div>
			<input type = "submit" value = "작성완료">
		</div>
	</form>
	<script>
		document.frm.submit();
	</script>

</body>
</html>