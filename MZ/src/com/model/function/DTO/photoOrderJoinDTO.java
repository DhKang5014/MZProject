package com.model.function.DTO;

public class photoOrderJoinDTO {
	String name;
	String email;
	String img_url;
	int num;
	double lat;
	double lon;
	String plu_name;
	int order_num;
	int po_num;
	String po_title;
	  
	
	
	public photoOrderJoinDTO(String name, String email, String img_url, int num, double lat, double lon,
			String plu_name, int order_num, int po_num, String po_title) {
		this.name = name;
		this.email = email;
		this.img_url = img_url;
		this.num = num;
		this.lat = lat;
		this.lon = lon;
		this.plu_name = plu_name;
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

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLon() {
		return lon;
	}

	public void setLon(double lon) {
		this.lon = lon;
	}

	public String getPlu_name() {
		return plu_name;
	}

	public void setPlu_name(String plu_name) {
		this.plu_name = plu_name;
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
