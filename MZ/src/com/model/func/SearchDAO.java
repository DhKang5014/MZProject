package com.model.func;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.model.master.DAO;

public class SearchDAO extends DAO{

	int cnt = 0;
	ResultSet rs = null;
	SearchDTO result = null;
	
	String email = null;
	String po_num = null;
	String po_title = null;
	String img_url = null;
	
	ArrayList<SearchDTO> list = null;
	ArrayList<String> list2 = null;
	
	SearchDTO dto = null;
	
	String txt = null;
	
	public ArrayList<SearchDTO> searchEmail(String sql, String value) {
		
		list = new ArrayList<SearchDTO>();
		System.out.println("SearchEmail 메소드");
		psmt(sql);
		System.out.println("sql문 가지고 왔다리");
		try {
			getPsmt().setString(1, value);
			
			rs = getPsmt().executeQuery();
			System.out.println("rs");
			
			while (rs.next()) {
				email = rs.getString("email");
				po_num = rs.getString("po_num");
				po_title = rs.getString("po_title");
				img_url = rs.getString("img_url");
				
				
				System.out.println(email);
				System.out.println(po_num);
				System.out.println(img_url);
				System.out.println(po_title);
				
				dto = new SearchDTO(email, po_num, po_title, img_url);
				list.add(dto);

			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	
	public ArrayList<String> searchName(String sql, String name) {
		
		list2 = new ArrayList<String>();
		psmt(sql);
		try {
			getPsmt().setString(1, name);
			
			rs = getPsmt().executeQuery();
			while (rs.next()) {
				name = rs.getString("name");
				list.add(result);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list2;
	}
	public ArrayList<String> searchCategory(String sql, String category) {
		
		list2 = new ArrayList<String>();
		psmt(sql);
		try {
			getPsmt().setString(1, category);
			
			rs = getPsmt().executeQuery();
			if (rs.next()) {
				category = rs.getString("category");
				list.add(result);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list2;
	}
	public ArrayList<String> searchPlace(String sql, String place) {
		
		list2 = new ArrayList<String>();
		psmt(sql);
		try {
			getPsmt().setString(1, place);
			
			rs = getPsmt().executeQuery();
			if (rs.next()) {
				place = rs.getString("place");
				list.add(result);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list2;
	}
		
	public ArrayList<String> getFile(int i){
		ArrayList<String> list_html = new ArrayList<String>();
		StringBuilder contentBuilder = new StringBuilder();
		String path = "C:\\Users\\SMHRD\\Desktop\\html\\sue"+i+".html";
		System.out.println("sue"+i+".html");
		File file = new File(path);
		boolean is_file = file.isFile();
		System.out.println(is_file);
		
		try {
			System.out.println("파일 가지러 들어옴");
			FileReader file_read = new FileReader(file);
			BufferedReader in = new BufferedReader(file_read);
			String str;
			
			while((str = in.readLine()) != null) {
				contentBuilder.append(str);
			}
			
			in.close();
			
			String content = contentBuilder.toString();
			list_html.add(content);
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		System.out.println("파일 가지고 나간다.");
		return list_html;
	}
	
	public String getTitle(String po_title) {

		System.out.println("제목 가져오기");
        Pattern p = Pattern.compile("<title>.*</title>");
        Matcher m = p.matcher(po_title);
        while(m.find()){
        	txt += m.group().replace("<title>", "").replace("</title>", "");
        }

        txt = txt.trim();

        
		return txt;
	}
	
	public String getcontent(String po_title) {
		
		System.out.println("내용 가져오기");
        Pattern p = Pattern.compile("<p>.*</p>");
        Matcher m = p.matcher(po_title);
        while(m.find()){
        	txt += m.group().replace("<p>", "").replace("</p>", "");
        }

        txt = txt.trim();
        
		return txt;
	}
}
