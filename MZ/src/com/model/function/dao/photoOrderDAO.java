package com.model.function.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.function.DTO.photoOrderDTO;
import com.model.function.DTO.photoOrderJoinDTO;
import com.model.master.DAO;

public class photoOrderDAO extends DAO {

	public int insert(String sql, String file_name, String email, String img_url, int order_num, int po_num,
			String po_title) {
		psmt(sql);
		int cnt = 0;
		try {
			System.out.println("insert >> file_name >> " + file_name);
			System.out.println("insert >> email >> " + email);
			System.out.println("insert >< img_url >> " + img_url);
			System.out.println("insert >> order_num >> " + order_num);
			System.out.println("insert >> po_num >> " + po_num);
			System.out.println("insert >> po_title >> " + po_title);
			getPsmt().setString(1, file_name);
			getPsmt().setString(2, email);
			getPsmt().setString(3, img_url);
			getPsmt().setInt(4, order_num);
			getPsmt().setInt(5, po_num);
			getPsmt().setString(6, po_title);
			cnt = getPsmt().executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public ArrayList<photoOrderJoinDTO> join_select(String sql, String email, int po_num) {
		psmt(sql);
		photoOrderJoinDTO ph_or_jo_DTO = null;
		ResultSet rs = null;
		ArrayList<photoOrderJoinDTO> ph_or_dto = new ArrayList<photoOrderJoinDTO>();
		try {
			
			System.out.println("select photoOrderDAO >> email >> " + email);
			System.out.println("select photoOrderDAO >> po_num >> " + po_num);

			
			getPsmt().setString(1, email);
			getPsmt().setInt(2, po_num);
			rs = getPsmt().executeQuery();
			while (rs.next()) {
				String img_name = rs.getString(1);
				//String email = rs.getString(2);
				String img_url = rs.getString(3);
				int num = rs.getInt(4);
				double lat = rs.getDouble(5);
				double lon = rs.getDouble(6);
				String plu_name = rs.getString(7);
				int order_num = rs.getInt(8);
				//int po_num = rs.getInt(9);
				String po_title = rs.getString(10);
				
				ph_or_jo_DTO = new photoOrderJoinDTO(img_name,email,img_url,num,lat,lon,plu_name,order_num,po_num,po_title);
				ph_or_dto.add(ph_or_jo_DTO);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return ph_or_dto;
	}
	
	public String select(String sql, String file_name, String email, String img_src) {
		psmt(sql);
		String result = null;
		ResultSet rs = null;
		try {
			System.out.println("select photoOrderDAO >> file_name >> " + file_name);
			System.out.println("select photoOrderDAO >> email >> " + email);
			System.out.println("select photoOrderDAO >> img_src >> " + img_src);

			getPsmt().setString(1, file_name);
			getPsmt().setString(2, email);
			getPsmt().setString(3, img_src);
			rs = getPsmt().executeQuery();
			while (rs.next()) {
				result = rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	public String select_plu_name(String sql, String file_name, String email) {
		psmt(sql);
		String result = null;
		ResultSet rs = null;
		try {
			System.out.println("select photoOrderDAO >> file_name >> " + file_name);
			System.out.println("select photoOrderDAO >> email >> " + email);

			getPsmt().setString(1, file_name);
			getPsmt().setString(2, email);
			rs = getPsmt().executeQuery();
			while (rs.next()) {
				result = rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	public ArrayList<photoOrderDTO> select(String sql, String file_name, String email, int po_num) {
		psmt(sql);
		String result = null;
		ResultSet rs = null;
		ArrayList<photoOrderDTO> ar = new ArrayList<photoOrderDTO>();
		try {
			System.out.println("select photoOrderDAO >> file_name >> " + file_name);
			System.out.println("select photoOrderDAO >> email >> " + email);
			System.out.println("select photoOrderDAO >> cnt >> " + po_num);
			
			getPsmt().setString(1, file_name);
			getPsmt().setString(2, email);
			getPsmt().setInt(3, po_num);
			rs = getPsmt().executeQuery();
			while (rs.next()) {
				String name = rs.getString(1);
				//email
				String img_url = rs.getString(3);
				int order_num = rs.getInt(4);
				//po_num
				String po_title = rs.getString(6);
				photoOrderDTO dto = new photoOrderDTO(name,email,img_url,order_num,po_num,po_title);
				ar.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return ar;
	}
	
	public ArrayList<photoOrderDTO> select(String sql, String email) {
		ArrayList<photoOrderDTO> ar = new ArrayList<photoOrderDTO>();
		psmt(sql);
		String result = null;
		ResultSet rs = null;
		try {
			System.out.println("select photoOrderDAO >> email >> " + email);

			getPsmt().setString(1, email);
			rs = getPsmt().executeQuery();
			while (rs.next()) {
				String name = rs.getString(1);
				String img_url = rs.getString(3);
				int order_num = rs.getInt(4);
				int po_num = rs.getInt(5);
				String po_title = rs.getString(6);
				photoOrderDTO po_or_dto = new photoOrderDTO(name,email,img_url,order_num,po_num,po_title);
				ar.add(po_or_dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return ar;
	}
}
