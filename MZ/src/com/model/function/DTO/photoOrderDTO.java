package com.model.function.DTO;

public class photoOrderDTO {
	String name;
	String email;
	String img_url;
	int order_num;
	int po_num;
	String po_title;

	public photoOrderDTO(String name, String email, String img_url, int order_num, int po_num, String po_title) {
		this.name = name;
		this.email = email;
		this.img_url = img_url;
		this.order_num = order_num;
		this.po_num = po_num;
		this.po_title = po_title;
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

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public int getPo_num() {
		return po_num;
	}

	public void setPo_num(int po_num) {
		this.po_num = po_num;
	}

	public String getPo_title() {
		return po_title;
	}

	public void setPo_title(String po_title) {
		this.po_title = po_title;
	}

}
