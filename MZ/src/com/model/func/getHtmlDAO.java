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

public class getHtmlDAO extends DAO{
	
	ArrayList<String> list_html = new ArrayList<String>();
	String txt = null;
	
	public ArrayList<String> getFile(int i){
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
	
	public String getTitle(String strSource) {
		
		
		System.out.println("제목만 가져오기");
        Pattern p = Pattern.compile("<h1>.*</h1>");
        Matcher m = p.matcher(strSource);
        while(m.find())
        {
        	txt += m.group().replace("<h1>", "").replace("</h1>", "");
        }

        txt = txt.trim();
 
        
		return txt;
	}
	
	public String getcontent(String strSource) {
		
		System.out.println("내용 가져오기");
        Pattern p = Pattern.compile("<p>.*</p>");
        Matcher m = p.matcher(strSource);
        while(m.find())
        {
        	txt += m.group().replace("<p>", "").replace("</p>", "");
        }

        txt = txt.trim();
        
		return txt;
	}
	
}
