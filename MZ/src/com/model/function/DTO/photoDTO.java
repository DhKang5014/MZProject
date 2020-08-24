package com.model.function.DTO;

public class photoDTO {
	String name;
	String email;
	String img_url;
	int num;

	public photoDTO(String name, String email, String img_url, int num) {
		this.name = name;
		this.email = email;
		this.img_url = img_url;
		this.num = num;
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
