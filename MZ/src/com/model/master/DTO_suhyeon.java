package com.model.master;

public class DTO_suhyeon {

	String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
	String db_id = "hr";
	String db_pw = "hr";
	String driver_url = "oracle.jdbc.driver.OracleDriver";

	String email;
	String pw;
	String name;
	int age;
	int gender;
	
	String category;
	String place_name;
	
	String sql_search_useremail = "select email, po_num, po_title, img_url from post where email like ? ";
	String sql_search_username = "select name from users where name like ?";
	String sql_search_category = "select cat_name from place_category where cat_name like ? ";
	String sql_search_place = "select pl_name from place where pl_name like ? ";
	

	
	
	public String getSql_search_useremail() {
		return sql_search_useremail;
	}
	public String getSql_search_username() {
		return sql_search_username;
	}
	public String getSql_search_category() {
		return sql_search_category;
	}
	public String getSql_search_place() {
		return sql_search_place;
	}

}
