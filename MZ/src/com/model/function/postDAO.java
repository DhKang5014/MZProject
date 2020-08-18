package com.model.function;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.master.*;
public class postDAO extends DAO{
	ResultSet rs = null;
	String sql_post_insert = "insert into post values(post_se.nextval, ? , ? , ? )";
	
	public int insert(String sql, String title, String email, String img_url) {
		psmt(sql);
		int cnt = 0;
		try {
			getPsmt().setString(1, title);
			getPsmt().setString(2, email);
			getPsmt().setString(3, img_url);
			cnt = getPsmt().executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	
	String html_path = "mkhtml";
	public int select_email_title(String sql, String email, String title){
		ArrayList<String> ar_String = new ArrayList<String>();
		String dto_out = null;
		try {
			psmt(sql);
			getPsmt().setString(1, email);
			getPsmt().setString(2, title);
			rs = getPsmt().executeQuery();
			int num = 0;
			
			while (rs.next()) {
				num = rs.getInt(1);
				try {
					ar_String.add(URLDecoder.decode(html_path+"/"+email+"/"+title,"UTF-8"));
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return 0;
	}
	
	
	
	String sql_post_select_email = "select * from post where email = ? ";
	public String select_email(String sql, String email){
		ArrayList<String> ar_String = new ArrayList<String>();
		ArrayList<String> ar_img_url = new ArrayList<String>();
		String dto_out = null;
		try {
			psmt(sql);
			getPsmt().setString(1, email);
			rs = getPsmt().executeQuery();
			int num = 0;
			String title = "";
			String img_url = "";
			while (rs.next()) {
				num = rs.getInt(1);
				title = rs.getString(2);
				img_url = rs.getString(4);
				ar_String.add(html_path+"/"+email+"/"+title);
				ar_img_url.add(img_url);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		String result = generate_email_html_tag(ar_String, ar_img_url);
		
		return result;
	}
	
	public String generate_email_html_tag(ArrayList<String> ar_dto, ArrayList<String> ar_img_url) {
		String str = "";
		if (ar_dto.size() > 0) {
			for (int i = 0; i < ar_dto.size(); i++) {
				str += "<div id='"+i+"'><a href='" + ar_dto.get(i)+"'>"+i+" 번째 다이어리</a>";
				str += "<img src='"+ar_img_url.get(i)+"'></div>";
				
			}
			return str;
		}
		return "";
	}
	
}
