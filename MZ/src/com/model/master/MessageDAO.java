package com.model.master;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MessageDAO {
	
	Connection conn = null;
	private PreparedStatement psmt = null;
	ResultSet rs = null;
	
	public void conn() {
		try {
			String path = "oracle.jdbc.driver.OracleDriver";
			Class.forName(path);
			String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id= "hr";
			String db_pw = "hr";
			conn = DriverManager.getConnection(db_url,db_id,db_pw);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void psmt(String sql) {
		conn();
		try {
			setPsmt(conn.prepareStatement(sql));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public void close() {
		try {
			if(getPsmt() != null) {
				getPsmt().close();
				psmt = null;
			}if(rs != null) {
				rs.close();
				rs= null;
			}
			if(conn != null) {
				conn.close();
				conn = null;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}

	public PreparedStatement getPsmt() {
		return psmt;
	}

	public void setPsmt(PreparedStatement psmt) {
		this.psmt = psmt;
	}
	
	
	
}
