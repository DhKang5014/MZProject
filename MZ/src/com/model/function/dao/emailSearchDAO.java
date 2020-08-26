package com.model.function.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.function.DTO.emailSearchDTO;
import com.model.master.DAO;

public class emailSearchDAO extends DAO {
	
	
	public ArrayList<emailSearchDTO> select_email(String sql, String email) {
		psmt(sql);
		//
		ArrayList<emailSearchDTO> ar = new ArrayList<emailSearchDTO>();
		//
		ResultSet rs = null;
		//
		String name = null;
		String age = null;
		String gender = null;
		String post_title = null;
		String img_url = null;
		String post_contents = null;
		//
		try {
			getPsmt().setString(1, "%"+email+"%");
			rs = getPsmt().executeQuery();
			while (rs.next()) {
				//
				name = rs.getString(2);
				age = rs.getString(3);
				gender = rs.getString(4);
				post_title = rs.getString(5);
				img_url = rs.getString(6);
				//
				System.out.println("emailSearchDAO >> name >> " + name);
				System.out.println("emailSearchDAO >> age >> " + age);
				System.out.println("emailSearchDAO >> gender >> " + gender);
				System.out.println("emailSearchDAO >> post_title >> " + post_title);
				System.out.println("emailSearchDAO >> img_url >> " + img_url);
				//
				emailSearchDTO dto = new emailSearchDTO(email, name, age, gender, post_title, img_url);
				//
				ar.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return ar;
	}
	
	public ArrayList<emailSearchDTO> select_name(String sql, String name) {
		psmt(sql);
		//
		ArrayList<emailSearchDTO> ar = new ArrayList<emailSearchDTO>();
		//
		ResultSet rs = null;
		//
		String email = null;
		//String name = null;
		String age = null;
		String gender = null;
		String post_title = null;
		String img_url = null;
		String post_contents = null;
		//
		try {
			getPsmt().setString(1, "%"+name+"%");
			rs = getPsmt().executeQuery();
			while (rs.next()) {
				//
				email = rs.getString(1);
				//name = rs.getString(2);
				age = rs.getString(3);
				gender = rs.getString(4);
				post_title = rs.getString(5);
				img_url = rs.getString(6);
				//
				System.out.println("emailSearchDAO >> email >> " + email);
				System.out.println("emailSearchDAO >> name >> " + name);
				System.out.println("emailSearchDAO >> age >> " + age);
				System.out.println("emailSearchDAO >> gender >> " + gender);
				System.out.println("emailSearchDAO >> post_title >> " + post_title);
				System.out.println("emailSearchDAO >> img_url >> " + img_url);
				//
				emailSearchDTO dto = new emailSearchDTO(email, name, age, gender, post_title, img_url);
				//
				ar.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return ar;
	}
	
	public ArrayList<emailSearchDTO> select_plu_name(String sql, String plu_name) {
		psmt(sql);
		//
		ArrayList<emailSearchDTO> ar = new ArrayList<emailSearchDTO>();
		//
		ResultSet rs = null;
		//
		String email = null;
		String name = null;
		String age = null;
		String gender = null;
		String post_title = null;
		String img_url = null;
		String post_contents = null;
		//
		try {
			getPsmt().setString(1, "%"+plu_name+"%");
			rs = getPsmt().executeQuery();
			while (rs.next()) {
				//
				email = rs.getString(1);
				name = rs.getString(2);
				age = rs.getString(3);
				gender = rs.getString(4);
				post_title = rs.getString(5);
				img_url = rs.getString(6);
				//
				System.out.println("emailSearchDAO >> email >> " + email);
				System.out.println("emailSearchDAO >> name >> " + name);
				System.out.println("emailSearchDAO >> age >> " + age);
				System.out.println("emailSearchDAO >> gender >> " + gender);
				System.out.println("emailSearchDAO >> post_title >> " + post_title);
				System.out.println("emailSearchDAO >> img_url >> " + img_url);
				//
				emailSearchDTO dto = new emailSearchDTO(email, name, age, gender, post_title, img_url);
				//
				ar.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return ar;
	}
	
	
}
