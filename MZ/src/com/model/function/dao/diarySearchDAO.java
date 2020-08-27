package com.model.function.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.function.DTO.diarySearchDTO;
import com.model.master.DAO;

public class diarySearchDAO extends DAO {

	public ArrayList<diarySearchDTO> select_po_title(String sql, String po_title) {
		psmt(sql);
		//
		ArrayList<diarySearchDTO> ar = new ArrayList<diarySearchDTO>();
		//
		ResultSet rs = null;
	//POST table
		int po_num = 0; // 1
		//String po_title = null; // 2 get parameter
		String email = null; // 3 join key
		String img_url = null;// 4
		String name = null; // 5
		//
		try {
			getPsmt().setString(1, "%"+po_title+"%");
			rs = getPsmt().executeQuery();
			while (rs.next()) {
				
				po_num = rs.getInt(1);
				//po_title = rs.getString(2);
				email = rs.getString(3);
				img_url = rs.getString(4);
				name = rs.getString(5);
				//
				System.out.println("emailSearchDAO >> po_num >> " + po_num);
				System.out.println("emailSearchDAO >> po_title >> " + po_title);
				System.out.println("emailSearchDAO >> email >> " + email);
				System.out.println("emailSearchDAO >> img_url >> " + img_url);
				System.out.println("emailSearchDAO >> name >> " + name);
				//
				diarySearchDTO dto = new diarySearchDTO(po_num, po_title, email, img_url, name);
				//
				ar.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return ar;
	}
	
	public ArrayList<diarySearchDTO> select_title(String sql, String title) {
		psmt(sql);
		//
		ArrayList<diarySearchDTO> ar = new ArrayList<diarySearchDTO>();
		//
		ResultSet rs = null;
		
		//Diary Main table
		String email = null; // 1
		//String title = null; // 2 get parameter
		String stitle = null; // 3
		String content = null; // 4
		//
		try {
			getPsmt().setString(1, "%"+title+"%");
			rs = getPsmt().executeQuery();
			while (rs.next()) {
				//
				email = rs.getString(1);
				title = rs.getString(2);
				stitle = rs.getString(3);
				content = rs.getString(4);
				//
				System.out.println("emailSearchDAO >> email >> " + email);
				System.out.println("emailSearchDAO >> name >> " + title);
				System.out.println("emailSearchDAO >> stitle >> " + stitle);
				System.out.println("emailSearchDAO >> content >> " + content);
				
				//
				diarySearchDTO dto = new diarySearchDTO(email, title, stitle, content);
				//
				ar.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ar;
	}
	
	public ArrayList<diarySearchDTO> select_stitle(String sql, String stitle) {
		psmt(sql);
		//
		ArrayList<diarySearchDTO> ar = new ArrayList<diarySearchDTO>();
		//
		ResultSet rs = null;
		//

		//Diary Main table
		String email = null; // 1
		String title = null; // 2 get parameter
		//String stitle = null; // 3 get parameter
		String content = null; // 4
		//
		try {
			getPsmt().setString(1, "%"+title+"%");
			rs = getPsmt().executeQuery();
			while (rs.next()) {
				//
				email = rs.getString(1);
				title = rs.getString(2);
				stitle = rs.getString(3);
				content = rs.getString(4);
				//
				System.out.println("emailSearchDAO >> email >> " + email);
				System.out.println("emailSearchDAO >> name >> " + title);
				System.out.println("emailSearchDAO >> stitle >> " + stitle);
				System.out.println("emailSearchDAO >> content >> " + content);
				
				//
				diarySearchDTO dto = new diarySearchDTO(email, title, stitle, content);
				//
				ar.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ar;
	}
}
