package com.model.function;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.master.DAO;

public class diaryMainDAO extends DAO{
	
	
	
	public int insert(String sql, String email, String title, String stitle, String content) {
		psmt(sql);
		int cnt = 0;
		try {
			getPsmt().setString(1, email);
			getPsmt().setString(2, title);
			getPsmt().setString(3, stitle);
			getPsmt().setString(4, content);
			cnt = getPsmt().executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public int update(String sql, String email, String title, String stitle, String content) {
		psmt(sql);
		int cnt = 0;
		try {
			getPsmt().setString(1, title);
			getPsmt().setString(2, stitle);
			getPsmt().setString(3, content);
			getPsmt().setString(4, email);
			cnt = getPsmt().executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	ArrayList<String> ar_str; 
	public ArrayList<String> select(String sql, String email) {
		psmt(sql);
		ResultSet rs = null;
		String title = null;
		String stitle = null;
		String content = null;
		try {
			getPsmt().setString(1, email);
			rs = getPsmt().executeQuery();	
			while(rs.next()) {
				ar_str = new ArrayList<String>();
				title = rs.getString(2);
				stitle = rs.getString(3);
				content = rs.getString(4);
				System.out.println("diaryMainDAO >> title >> " + title);
				System.out.println("diaryMainDAO >> stitle >> " + stitle);
				System.out.println("diaryMainDAO >> content >> " + content);
				ar_str.add(title);
				ar_str.add(stitle);
				ar_str.add(content);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return ar_str;
	}
	
	
	
	
	public String getJsonHTML(String sql, String email) {
		ArrayList<String> ar_str = select(sql, email);
		String result = "";
		result = "{\"title\":\""+ar_str.get(0) +"\"," ;
		result += "\"stitle\":\""+ar_str.get(1) +"\"," ;
		result += "\"content\":\""+ar_str.get(2) +"\"}" ;
		System.out.println(result);
		
		return result;
	}
	
	
	
	
}
