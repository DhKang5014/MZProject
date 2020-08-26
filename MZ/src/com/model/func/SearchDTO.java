package com.model.func;

public class SearchDTO {
	
	String email;
	String name;
	String category_name;
	String place_name;
	String po_num;
	String po_title;
	String img_url;
	
	
	public SearchDTO() {
		
	}
	public SearchDTO(String email, String po_num, String po_title, String img_url) {
		super();
		this.email = email;
		this.po_num = po_num;
		this.po_title = po_title;
		this.img_url = img_url;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getPo_num() {
		return po_num;
	}
	public void setPo_num(String po_num) {
		this.po_num = po_num;
	}
	public String getPo_title() {
		return po_title;
	}
	public void setPo_title(String po_title) {
		this.po_title = po_title;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	
	
	
	

}
