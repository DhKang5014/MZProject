package com.model.function.DTO;

import java.util.Date;

public class photoDTO {
	String name;
	String email;
	String img_url;
	int num;
	double lat;
	double lon;
	String plu_name;
	String day;
	String sql_select_email = "select * from photo where email = ? ";
	
	public photoDTO() {
		
	}
	
	public photoDTO(String name, String email, String img_url, int num) {
		this.name = name;
		this.email = email;
		this.img_url = img_url;
		this.num = num;
	}
	
	

	public photoDTO(String name, String email, String img_url, int num, double lat, double lon, String plu_name,
			String day) {
		super();
		this.name = name;
		this.email = email;
		this.img_url = img_url;
		this.num = num;
		this.lat = lat;
		this.lon = lon;
		this.plu_name = plu_name;
		this.day = day;
	}
	
	public String getSql_select_email() {
		return sql_select_email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}


}
