package com.model.function.DTO;

public class emailSearchDTO {
	String select_email = "select * from users where email = ? ";
	String select_join_email_post = "select * from (select u.email,u.name,u.age,u.gender,p.po_title,p.img_url from users u inner join post p on u.email = p.email) where email like ? ";
	String select_join_name_post = "select * from (select u.email,u.name,u.age,u.gender,p.po_title,p.img_url from users u inner join post p on u.email = p.email) where name like ? ";
	String select_join_plu_name_post = "select DISTINCT jo.email,jo.name,jo.age,jo.gender,jo.po_title,jo.img_url,ph.plu_name from (select u.email,u.name,u.age,u.gender,p.po_title,p.img_url from users u inner join post p on u.email = p.email) jo inner join photo ph on jo.email=ph.email where plu_name like ? ";
	String email;
	String name;
	String age;
	String gender;
	String post_title;
	String img_url;
	String post_contents;

	public emailSearchDTO() {
		super();
	}

	public emailSearchDTO(String email, String name, String age, String gender, String post_title, String img_url,
			String post_contents) {
		super();

		this.email = email;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.post_title = post_title;
		this.img_url = img_url;
		this.post_contents = post_contents;
	}

	public emailSearchDTO(String email, String name, String age, String gender, String post_title, String img_url) {
		super();

		this.email = email;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.post_title = post_title;
		this.img_url = img_url;
	}

	public String getSelect_join_name_post() {
		return select_join_name_post;
	}

	public void setSelect_join_name_post(String select_join_name_post) {
		this.select_join_name_post = select_join_name_post;
	}

	public String getSelect_join_plu_name_post() {
		return select_join_plu_name_post;
	}

	public void setSelect_join_plu_name_post(String select_join_plu_name_post) {
		this.select_join_plu_name_post = select_join_plu_name_post;
	}

	public String getSelect_email() {
		return select_email;
	}

	public void setSelect_email(String select_email) {
		this.select_email = select_email;
	}

	public String getSelect_join_email_post() {
		return select_join_email_post;
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

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPost_title() {
		return post_title;
	}

	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public String getPost_contents() {
		return post_contents;
	}

	public void setPost_contents(String post_contents) {
		this.post_contents = post_contents;
	}

}
