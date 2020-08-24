package com.model.function.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.function.DTO.MessageDTO;
import com.model.master.DTO;

public class MessageFunctionDAO extends MessageDAO {
	ResultSet rs = null;
	ArrayList<MessageDTO> dto_array = null;

	public int delete_all(String receive) {
		int cnt = 0;
		conn();
		String sql = "delete from message where receive = ?";
		psmt(sql);
		try {
			getPsmt().setString(1, receive);
			cnt = getPsmt().executeUpdate();
			if (cnt > 0) {
				System.out.println("모든 내용 삭제");
			} else {
				System.out.println("모든 내용 삭제 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public int insert(String send, String recieve, String message) {
		int cnt = 0;
		conn();
		String sql = "insert into message values(num.nextval, ?,?,?, sysdate)";
		psmt(sql);
		try {
			getPsmt().setString(1, send);
			getPsmt().setString(2, recieve);
			getPsmt().setString(3, message);
			cnt = getPsmt().executeUpdate();
			if (cnt > 0) {
				System.out.println("메시지 인설트 성공");
			} else {
				System.out.println("메시지 인설트 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public String select(String recieve) {
		conn();
		String sql = "select * from message where receive = ?";
		String html = "";
		psmt(sql);
		try {
			getPsmt().setString(1, recieve);
			rs = getPsmt().executeQuery();
			dto_array = new ArrayList<MessageDTO>();
			while (rs.next()) {
				int num = Integer.parseInt(rs.getString("num"));
				String send = rs.getString("send");
				String receive = rs.getString("receive");
				String message = rs.getString("message");
				String curdate = rs.getString("curdate");
				MessageDTO dto = new MessageDTO(num, send, receive, message, curdate);
				dto_array.add(dto);
			}
			html = "";
			if (rs != null) {
				html = getHtml(dto_array);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return html;
	}

	public String getHtml(ArrayList<MessageDTO> dto_array) {
		if (dto_array.size() > 0) {
			String str = "<table style=\"text-align: center;\">";
			str += "<tr style=\"text-align: center;\">";
			str += "<th>번호</th>";
			str += "<th>보내는이</th>";
			str += "<th>받는이</th>";
			str += "<th>메시지</th>";
			str += "<th>날짜</th>";
			str += "<th>삭제하기</th>";
			str += "</tr>";
			for (int i = 0; i < dto_array.size(); i++) {
				str += "<tr>";
				str += "<td>" + i + "</td>";
				str += "<td>" + dto_array.get(i).getSend() + "</td>";
				str += "<td>" + dto_array.get(i).getReceive() + "</td>";
				str += "<td>" + dto_array.get(i).getMessage() + "</td>";
				str += "<td>" + dto_array.get(i).getDate() + "</td>";
				str += "<td><a href = " + "MessageOneDeleteServiceCon.do?num=" + dto_array.get(i).getNum()
						+ ">삭제하기</a></td>";
				str += "</tr>";
				System.out.print(dto_array.get(i).getNum() + " ");
				System.out.print(dto_array.get(i).getSend() + " ");
				System.out.print(dto_array.get(i).getReceive() + " ");
				System.out.print(dto_array.get(i).getMessage() + " ");
				System.out.print(dto_array.get(i).getDate() + " \n");
			}
			str += "</table>";
			return str;
		}
		return "";
	}

	public int delete(String email, int num) {
		int cnt = 0;
		conn();
		String sql = "delete from message where num = ?";
		psmt(sql);
		try {
			getPsmt().setInt(1, num);
			cnt = getPsmt().executeUpdate();
			if (cnt > 0) {
				System.out.println("개별 삭제 성공");

			} else {
				System.out.println("개별 삭제 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}

}
