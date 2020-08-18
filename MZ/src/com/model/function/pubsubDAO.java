package com.model.function;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.master.DAO;
import com.model.master.DTO;

public class pubsubDAO extends DAO {

	ResultSet rs = null;

	public int select(String sql, String email) {
		psmt(sql);
		String email_ck = null;
		String result = null;
		int cnt = 0;
		try {
			getPsmt().setString(1, email);
			rs = getPsmt().executeQuery();

			while (rs.next()) {
				email_ck = rs.getString(1);
				if (email.equals(email_ck)) {
					cnt = 1;
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();

		}
		return cnt;
	}

	String sql_publisher_check = "select * from publisher where email = ?";
	String sql_publisher_insert = "insert into publisher values( ? )";
	String sql_subscriber_check = "select * from subscriber where email = ?";
	String sql_subscriber_insert = "insert into subscriber values( ? )";

	public int insert(String sql_select, String sql_insert, String email) {
		int cnt = 0;
		cnt = select(sql_select, email);
		if (cnt == 0) {
			psmt(sql_insert);
			try {
				getPsmt().setString(1, email);
				cnt = getPsmt().executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close();
			}
		}
		return cnt;
	}
}
