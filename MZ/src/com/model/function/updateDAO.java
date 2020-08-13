package com.model.function;
import java.sql.SQLException;

import com.model.master.DAO;


public class updateDAO extends DAO {

	public int update(String sql, String email, String pw, String name, int age, int gender) {
		psmt(sql);
		int cnt = 0;
		try {
			getPsmt().setString(5, email);
			getPsmt().setString(1, pw);
			getPsmt().setString(2, name);
			getPsmt().setInt(3, age);
			getPsmt().setInt(4, gender);
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
