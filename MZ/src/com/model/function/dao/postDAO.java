package com.model.function.dao;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.master.*;
public class postDAO extends DAO{
	ResultSet rs = null;
	
	public int getPostNumber(String sql,String email, String title) {
		psmt(sql);
		int cnt = 0;
		
		try {
			getPsmt().setString(1, email);
			getPsmt().setString(2, title);
			rs = getPsmt().executeQuery();
			while(rs.next()) {
				cnt = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	}
	
	
	
	
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
		ArrayList<String> ar_title = new ArrayList<String>();
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
				ar_title.add(title);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		String result = generate_email_html_tag(ar_String, ar_img_url,ar_title);
		
		return result;
	}
	
	public String generate_email_html_tag(ArrayList<String> ar_dto, ArrayList<String> ar_img_url, ArrayList<String> ar_title) {
		String str = "";
		if (ar_dto.size() > 0) {
			for (int i = 0; i < ar_dto.size(); i++) {
				str += "<article>";
				str += "<div id='"+i+"'>" + "<img src='"+ar_img_url.get(i)+"' class='img_diary'><br/>";
				
				//str += "<h3 class='img_title'>"+ar_title.get(i).replace(".html","")+"<h3/>";
				//str += "<a class='diary_title' href='" + ar_dto.get(i)+"'>"+(i+1)+" 번째 다이어리</a><br/>";
				
				str += "<h3 class='diary_title'>"+ (i+1)+" 번째 다이어리"+"</h3>";
				str += "<a id='diary_" + i + "' class='diary_title' href='" + ar_dto.get(i)+"'>"+"제목 : "+ar_title.get(i).replace(".html","")+"</a><br/>";
				//str += "<input type='submit' onclick='diary(diary_"+i+")' value='여행 루트 저장하기'>";
				//str += "<input type='submit' onclick='diary2(diary_"+i+")' value='여행 루트 다이어리에 넣기'>";
				str += "</article>";
			}
			return str;
		}
		return "";
	}
	
}
