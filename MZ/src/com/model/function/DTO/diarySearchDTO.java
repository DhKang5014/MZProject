package com.model.function.DTO;

public class diarySearchDTO {
//SQL statement
	// 포스트 제목으로 검색
	String sql_search_diary_from_po_title = "select * from post where po_title like ? ";
	// 다이어리 메인 대제목으로 검색
	String sql_search_diary_from_main_title = "select * from diary_main where title like ? ";
	// 다이어리 메인 소제목으로 검색
	String sql_search_diary_from_main_stitle = "select * from diary_main where stitle like ? ";
	// 다이어리 메인 소개글로 검색
	String sql_search_diary_from_main_contents = "select * from diary_main where content like ? ";

// Diary Main table
	String email;
	String title;
	String stitle;
	String content;
// Post table
	int po_num;
	String po_title;
	// String email; // join key
	String img_url;
	String name;

	public diarySearchDTO(int po_num, String po_title, String email, String img_url, String name) {
		this.po_num = po_num;
		this.po_title = po_title;
		this.img_url = img_url;
		this.name = name;
	}

	
	
	public diarySearchDTO(String email, String title, String stitle, String content) {
		this.email = email;
		this.title = title;
		this.stitle = stitle;
		this.content = content;
	}



	public String getSql_search_diary_from_po_title() {
		return sql_search_diary_from_po_title;
	}

	public void setSql_search_diary_from_po_title(String sql_search_diary_from_po_title) {
		this.sql_search_diary_from_po_title = sql_search_diary_from_po_title;
	}

	public String getSql_search_diary_from_main_title() {
		return sql_search_diary_from_main_title;
	}

	public void setSql_search_diary_from_main_title(String sql_search_diary_from_main_title) {
		this.sql_search_diary_from_main_title = sql_search_diary_from_main_title;
	}

	public String getSql_search_diary_from_main_stitle() {
		return sql_search_diary_from_main_stitle;
	}

	public void setSql_search_diary_from_main_stitle(String sql_search_diary_from_main_stitle) {
		this.sql_search_diary_from_main_stitle = sql_search_diary_from_main_stitle;
	}

	public String getSql_search_diary_from_main_contents() {
		return sql_search_diary_from_main_contents;
	}

	public void setSql_search_diary_from_main_contents(String sql_search_diary_from_main_contents) {
		this.sql_search_diary_from_main_contents = sql_search_diary_from_main_contents;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStitle() {
		return stitle;
	}

	public void setStitle(String stitle) {
		this.stitle = stitle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
