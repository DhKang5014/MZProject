package com.model.master;

public class DTO {

	String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
	String db_id = "hr";
	String db_pw = "hr";
	String driver_url = "oracle.jdbc.driver.OracleDriver";

	String email;
	String pw;
	String name;
	int age;
	int gender;
	String html_path = "C:/Users/SMHRD/git/MZProject/MZ/WebContent/mkhtml";
	String img_path = "C:/Users/SMHRD/git/MZProject/MZ/WebContent/upload";
	String sql_join = "insert into USERS values ( ? , ? , ? , ? , ? )";
	String sql_login = "select * from USERS where EMAIL = ? and PW = ?";
	String sql_update = "update USERS set pw = ?, NAME = ?, AGE= ?, GENDER= ? where EMAIL= ?";
	String sql_email_dup_check = "select * from users where email = ?";
	String sql_photo_insert = "insert into photo(name,email,img_url,num) values ( ? , ? , ? , photo_se.nextval )";
	String sql_photo_dup_check = "select name,email,img_url,num from photo where name = ? and email = ?";
	String sql_photo_select_all = "select name,email,img_url,num,plu_name from photo where email = ?";
	String sql_photo_latlon_insert = "UPDATE photo SET lat = ? , lon = ? , plu_name = ? WHERE name = ? and email = ?";
	String sql_publisher_check = "select * from publisher where email = ?";
	String sql_publisher_insert = "insert into publisher values( ? )";
	String sql_subscriber_check = "select * from subscriber where email = ?";
	String sql_subscriber_insert = "insert into subscriber values( ? )";
	String sql_post_insert = "insert into post values(post_se.nextval, ? , ? , ? )";
	String sql_post_select_email = "select * from post where email = ? ";
	String sql_post_select_email_file = "select * from post where email = ? and po_title = ? ";
	String sql_diary_main_select = "select * from diary_main where email = ? ";
	String sql_diary_main_insert = "insert into diary_main values ( ? , ? , ? , ? )";
	String sql_diary_main_update = "update diary_main set title = ? , stitle = ? , content = ? where email = ?";

	public DTO(String email, String pw, String name, int age, int gender) {
		super();
		this.email = email;
		this.pw = pw;
		this.name = name;
		this.age = age;
		this.gender = gender;
		System.out.println(email + " " + pw + " " + name + " " + age + " " + gender + " dto 생성 full");
	}

	public DTO(String email, String pw) {
		super();
		this.email = email;
		this.pw = pw;
		System.out.println(email + " " + pw + " " + name + " " + age + " " + gender + " dto 생성 small");
	}

	public DTO(String email) {
		super();
		this.email = email;
		System.out.println(email + " " + pw + " " + name + " " + age + " " + gender + " dto 생성 small");
	}


	public String getSql_diary_main_update() {
		return sql_diary_main_update;
	}
	

	public String getSql_diary_main_select() {
		return sql_diary_main_select;
	}
	

	public String getSql_diary_main_insert() {
		return sql_diary_main_insert;
	}
	
	

	public String getSql_post_select_email_file() {
		return sql_post_select_email_file;
	}

	public String getSql_post_select_email() {
		return sql_post_select_email;
	}
	
	public String getSql_post_insert() {
		return sql_post_insert;
	}
	
	public String getSql_publisher_check() {
		return sql_publisher_check;
	}

	public String getSql_publisher_insert() {
		return sql_publisher_insert;
	}

	public String getSql_subscriber_check() {
		return sql_subscriber_check;
	}

	public String getSql_subscriber_insert() {
		return sql_subscriber_insert;
	}

	public String getSql_photo_latlon_insert() {
		return sql_photo_latlon_insert;
	}

	public String getSql_photo_select_all() {
		return sql_photo_select_all;
	}

	public String getSql_photo_insert() {
		return sql_photo_insert;
	}

	public String getSql_photo_dup_check() {
		return sql_photo_dup_check;
	}

	public String getSql_email_dup_check() {
		return sql_email_dup_check;
	}

	public String getDb_url() {
		return db_url;
	}

	public void setDb_url(String db_url) {
		this.db_url = db_url;
	}

	public String getDb_id() {
		return db_id;
	}

	public void setDb_id(String db_id) {
		this.db_id = db_id;
	}

	public String getDb_pw() {
		return db_pw;
	}

	public void setDb_pw(String db_pw) {
		this.db_pw = db_pw;
	}

	public String getDriver_url() {
		return driver_url;
	}

	public void setDriver_url(String driver_url) {
		this.driver_url = driver_url;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getSql_join() {
		return sql_join;
	}

	public void setSql_join(String sql_join) {
		this.sql_join = sql_join;
	}

	public String getSql_login() {
		return sql_login;
	}

	public void setSql_login(String sql_login) {
		this.sql_login = sql_login;
	}

	public String getSql_update() {
		return sql_update;
	}

	public void setSql_update(String sql_update) {
		this.sql_update = sql_update;
	}

}
