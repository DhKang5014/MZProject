package com.model.function;
import java.sql.SQLException;

import com.model.master.DAO;

public class joinDAO extends DAO {

	public int join(String sql, String email, String pw,String name,int age, int gender) {
		psmt(sql);
		int cnt = 0;
		try {
			getPsmt().setString(1, email);
			getPsmt().setString(2, pw);
			getPsmt().setString(3, name);
			getPsmt().setInt(4, age);
			getPsmt().setInt(5, gender);
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
