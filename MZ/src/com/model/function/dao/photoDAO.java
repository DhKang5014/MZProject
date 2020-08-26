package com.model.function.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.function.DTO.photoDTO;
import com.model.master.DAO;
import com.model.master.DTO;

public class photoDAO extends DAO {

	ResultSet rs = null;

	public int insert(String sql, String name, String email, String img_url) {
		psmt(sql);
		int cnt = 0;
		try {
			System.out.println("photoDAO insert IN IN IN");
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

	public String select_all(String sql, String email) {
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
				ar_dto.add(new photoDTO(name, email, img_url, num));
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

	public class temp {
		public String path;
		public String name;
		public String plu_name;
	}

	public ArrayList<temp> select_diary_img(String sql, String email) {
		ArrayList<photoDTO> ar_dto = new ArrayList<photoDTO>();
		ArrayList<temp> str_ar = new ArrayList<temp>();
		String dto_out = null;
		String result = "";
		try {
			psmt(sql);
			getPsmt().setString(1, email);
			rs = getPsmt().executeQuery();
			String name = "";
			String eamil = "";
			String img_url = "";
			int num = 0;
			String plu_name = "";
			temp temp = null;
			while (rs.next()) {
				temp = new temp();
				name = rs.getString(1);
				email = rs.getString(2);
				img_url = rs.getString(3);
				num = rs.getInt(4);
				plu_name = rs.getString(5);
				temp.name = name;
				temp.path = "upload/" + email + "/" + name;
				temp.plu_name = plu_name;
				str_ar.add(temp);
				ar_dto.add(new photoDTO(name, email, img_url, num));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return str_ar;
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

				System.out.println("photoDAO generate_all_img_tag IN IN IN >> " + ar_dto.get(i).getImg_url());
				String path = "" + ar_dto.get(i).getImg_url() + "\\" + ar_dto.get(i).getName();
				String[] a = path.split("\\\\");
				for (int k = 0; k < a.length; k++) {
					System.out.print(a[k] + " -- ");
				}
				path = "/img/" + a[8] + "/" + a[9];
				System.out.println();
				str += "<div class='container'>";
				str += "<a onclick='imgclick(" + i + ")'><img class='imgfile' src='" + path + "' style=\"width: 250px;\"/></a>";
				str += "<h4  id='" + i + "'>" + ar_dto.get(i).getName() + "</h4>";
				str += "<p class='hidden' >" + path + "</p>";
				str += "</div>";

				System.out.print(ar_dto.get(i).getName() + " img name ");
				System.out.print(ar_dto.get(i).getImg_url() + " img url ");
				System.out.print(ar_dto.get(i).getNum() + " img num ");
				System.out.println(ar_dto.get(i).getEmail() + " img email ");
			}
			return str;
		}
		return "";

	}

	String sql_photo_latlon_insert = "UPDATE photo SET lat = ? , lon = ? , plu_name = ? WHERE name = ? and email = ?";

	public int insert_latlon(String sql, double lat, double lon, String plu_name, String name, String email, String date_time) {
		psmt(sql);
		int cnt = 0;
		try {
			System.out.println("inser_latlon 1 >> photoDAO");
			getPsmt().setDouble(1, lat);
			getPsmt().setDouble(2, lon);
			System.out.println("inser_latlon 1.5 >> photoDAO");
			getPsmt().setString(3, plu_name);
			System.out.println("inser_latlon 1.6 >> photoDAO");
			getPsmt().setString(4, date_time);
			getPsmt().setString(5, name);
			getPsmt().setString(6, email);
			
			// getPsmt().setString(4, name);
			// getPsmt().setString(5, email);
			cnt = getPsmt().executeUpdate();
			System.out.println("inser_latlon 2 >> photoDAO");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("inser_latlon 3 >> photoDAO");
			System.out.println("photoDAO >> insert_latlon error >> ");
			e.printStackTrace();
		} finally {
			System.out.println("inser_latlon close >> photoDAO");
			close();
		}
		return cnt;

	}
	
	public ArrayList<photoDTO> select_lat_lon_from_email(String sql, String email) {
		ArrayList<photoDTO> ar_dto = new ArrayList<photoDTO>();
		String dto_out = null;
		try {
			psmt(sql);
			getPsmt().setString(1, email);
			rs = getPsmt().executeQuery();
			String name = null;
			//email
			String img_url = null;
			int num = 0;
			double lat = 0;
			double lon = 0;
			String plu_name = null;
			String day = null;
			while (rs.next()) {
				name = rs.getString(1);
				email = rs.getString(2);
				img_url = rs.getString(3);
				num = rs.getInt(4);
				lat = rs.getDouble(5);
				lon = rs.getDouble(6);
				plu_name = rs.getString(7);
				day = rs.getString(8);
				
				
				ar_dto.add(new photoDTO(name, email, img_url, num,lat,lon,plu_name,day));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return ar_dto;
	}
	
	
}
