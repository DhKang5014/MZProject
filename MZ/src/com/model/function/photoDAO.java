package com.model.function;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.master.DAO;
import com.model.master.DTO;


public class photoDAO extends DAO {

	ResultSet rs = null;
	String sql_photo_insert = "insert into photo values ( ? , ? , ? , photo_se.nextval )";
	String sql_photo_dup_check = "select * from photo where name = ? and email = ?";
	public int insert(String sql, String name, String email,String img_url) {
		psmt(sql);
		int cnt = 0;
		try {
			
			getPsmt().setString(1, name);
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

	public String dup_check(String sql, String name, String email) {
		String dto_out = null;
		try {
			psmt(sql);
			getPsmt().setString(1, name);
			getPsmt().setString(2, email);
			rs = getPsmt().executeQuery();
			while (rs.next()) {
				dto_out = rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return dto_out;
	}
	
	public String select_all(String sql, String email){
		ArrayList<photoDTO> ar_dto = new ArrayList<photoDTO>();
		String dto_out = null;
		try {
			psmt(sql);
			getPsmt().setString(1, email);
			rs = getPsmt().executeQuery();
			String name = "";
			String eamil = "";
			String img_url = "";
			int num = 0;
			while (rs.next()) {
				name = rs.getString(1);
				email = rs.getString(2);
				img_url = rs.getString(3);
				num = rs.getInt(4);
				ar_dto.add(new photoDTO(name,email,img_url,num));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		String result = null;
		
		result = generate_all_img_tag(ar_dto);
		
		return result;
	}
	
//	<article class="thumb">
//	<a href="images/fulls/01.jpg" class="image"><img src="images/thumbs/01.jpg" alt="" /></a>
//	<h2></h2>
//	<p>Nunc blandit nisi ligula magna sodales lectus elementum non. Integer id venenatis velit.</p>
//	
//</article>
	
	public String generate_all_img_tag(ArrayList<photoDTO> ar_dto) {
		String str = "";
		if (ar_dto.size() > 0) {
			for (int i = 0; i < ar_dto.size(); i++) {
				str += "<article class='thumb'>";
				
				String path = ""+ar_dto.get(i).getImg_url()+"\\"+ar_dto.get(i).getName();
				String[] a = path.split("\\\\");
				for(int k=0;k<a.length;k++) {
					System.out.print(a[k] +" -- ");
				}
				path = "/img/" + a[8] + "/" + a[9];
				System.out.println();
				str += "<a class='image' onclick='imgclick("+i+")'><img src='"+path+"'/></a>";
				str += "<h2 id='"+i+"'>"+ar_dto.get(i).getName() + "</h2>";
				str += "<p>"+path+"</p>";
				str += "</article>";
				System.out.print(ar_dto.get(i).getName() + " img name ");
				System.out.print(ar_dto.get(i).getImg_url() + " img url ");
				System.out.print(ar_dto.get(i).getNum() + " img num ");
				System.out.println(ar_dto.get(i).getEmail() + " img email ");
			}
			return str;
		}
		return "";
		
	}

	public int insert_latlon(String sql, double lat, double lon, String plu_name, String name, String email) {
		psmt(sql);
		int cnt = 0;
		try {
			getPsmt().setDouble(1, lat);
			getPsmt().setDouble(2, lon);
			getPsmt().setString(3, plu_name);
			getPsmt().setString(4, name);
			getPsmt().setString(5, email);
			cnt = getPsmt().executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	
	}
}
