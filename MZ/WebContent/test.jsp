<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = null;
PreparedStatement psmt = null;
ResultSet rs = null;
String email = null;
try {
	String path = "oracle.jdbc.driver.OracleDriver";
	Class.forName(path);
	String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
	String db_id= "hr";
	String db_pw = "hr";
	conn = DriverManager.getConnection(db_url,db_id,db_pw);
	psmt = conn.prepareStatement("select * from users where email = 'd' and pw = 'd'");
	//psmt.setString(1, "d");
	//psmt.setString(2, "d");
	rs = psmt.executeQuery();
	while(rs.next()){
		email = rs.getString(1);
		System.out.println(email);
	}
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	System.out.println("오류");
	e.printStackTrace();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	System.out.println("오류");
}
%>
<%=email %>

</body>
</html>