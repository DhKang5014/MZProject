package com.model.function;

import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.ResultSet;

import com.model.function.*;
import com.model.master.*;

public class selectDAO extends DAO {
	ResultSet rs = null;
	ArrayList<DTO> dto_array = null;

	public String select(String sql) {
		psmt(sql);
		dto_array = new ArrayList<DTO>();
		String result = null;
		try {
			DTO dto_out = null;
			rs = getPsmt().executeQuery();
			String email = null;
			String pw = null;
			String name = null;
			int age = 0;
			int gender = 0;
			while (rs.next()) {
				email = rs.getString(1);
				pw = rs.getString(2);
				name = rs.getString(3);
				age = rs.getInt(4);
				gender = rs.getInt(5);
				dto_out = new DTO(email, pw, name, age, gender);
				dto_array.add(dto_out);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
			if(dto_array.size()>0) result = getHtml(dto_array);
		}
		return result;
	}

	public String getHtml(ArrayList<DTO> dto_array) {
		String str = null;
		for (int i = 0; i < dto_array.size(); i++) {
			str += "<tr>";
			str += "<td>" + dto_array.get(i).getEmail() + "</td>";
			str += "<td>" + dto_array.get(i).getName() + "</td>";
			str += "<td>" + dto_array.get(i).getGender() + "</td>";
			str += "</tr>";
			System.out.println(dto_array.get(i).getEmail());
			System.out.println(dto_array.get(i).getName());
			System.out.println(dto_array.get(i).getGender());
		}

		return str;
	}
}
