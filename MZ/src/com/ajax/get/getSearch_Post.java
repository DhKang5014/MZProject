package com.ajax.get;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.model.function.DTO.emailSearchDTO;
import com.model.function.dao.emailSearchDAO;

@WebServlet("/getSearch_Post")
public class getSearch_Post extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("getSearch 최초 접근 code 1");

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String function = request.getParameter("select");
		String txt = request.getParameter("txt");
		String my_email = request.getParameter("email");
		System.out.println("category >> " + function);
		System.out.println("txt >> " + txt);
		System.out.println("my_email >> " + my_email);
		PrintWriter out = response.getWriter();

		if (function.equals("po_title")) {
			System.out.println("email logic access code 2");
			emailSearchDTO dto = new emailSearchDTO();
			emailSearchDAO dao = new emailSearchDAO();

			// SQL statement
			String sql = dto.getSql_search_diary_from_po_title();
			ArrayList<emailSearchDTO> ar = dao.select_email(dto.getSelect_join_email_post(), txt);
			// get html 확인
			for (int i = 0; i < ar.size(); i++) {
				System.out.println("getSearch >> email >> " + ar.get(i).getEmail());
				System.out.println("getSearch >> name >> " + ar.get(i).getName());
				System.out.println("getSearch >> age >> " + ar.get(i).getAge());
				System.out.println("getSearch >> gender >> " + ar.get(i).getGender());
				System.out.println("getSearch >> po_title >> " + ar.get(i).getPost_title());
				System.out.println("getSearch >> img_url >> " + ar.get(i).getImg_url());
			}

			// get html contents 불러오기
			for (int i = 0; i < ar.size(); i++) {
				String email = ar.get(i).getEmail();
				String file_name = ar.get(i).getPost_title();
				System.out.println("getDiaryHTML >> email >> " + email);
				System.out.println("getDiaryHTML >> file_name >> " + file_name);
				String path = "C:/Users/SMHRD/git/MZProject/MZ/WebContent/mkhtml/" + email + "/" + file_name;
				BufferedReader bufferedReader = null;
				try {

					System.out.println("getSearch file start code 1");
					// 파일 객체 생성
					File file = new File(path);
					// 입력 스트림 생성

					bufferedReader = new BufferedReader(new FileReader(path));
					String line = "";
					String touch = null;
					while (true) {
						System.out.println("getSearch file start code 2");
						touch = bufferedReader.readLine();
						line += touch;

						if (touch == null) {
							break;
						}

						// out.println(line);
					}
					System.out.println("getSearch file start code 3");
					line = line.substring(line.indexOf("<body>") - 1, line.indexOf("</body>") + 5);
					System.out.println("line sub 1 >> " + line);
					line = line.substring(line.indexOf("<div"), line.indexOf("</div>"));
					System.out.println("line sub 2 >> " + line);
					line = line.substring(line.indexOf("<p>") + 3, line.indexOf("</p>") - 1);
					System.out.println("line sub 3>> " + line);
					ar.get(i).setPost_contents(line);
					System.out.println("getSearch file start code 4");
					bufferedReader.close();
				} catch (FileNotFoundException e) {
					// TODO: handle exception
					System.out.println("getDiaryHTML >> 파일을 찾지 못했습니다.");
				} catch (IOException e) {
					System.out.println(e);
				}

			}
			// output json
			String json = new Gson().toJson(ar);
			out.println(json);

			System.out.println("getSearch last access point code n");
		} else if (function.equals("title")) {
			String name = txt; // my_email
			System.out.println("name logic access code 2");
			emailSearchDTO dto = new emailSearchDTO();
			emailSearchDAO dao = new emailSearchDAO();

			// get html 목록 불러오기
			ArrayList<emailSearchDTO> ar = dao.select_name(dto.getSelect_join_name_post(), name);
			// get html 확인
			for (int i = 0; i < ar.size(); i++) {
				System.out.println("getSearch >> email >> " + ar.get(i).getEmail());
				System.out.println("getSearch >> name >> " + ar.get(i).getName());
				System.out.println("getSearch >> age >> " + ar.get(i).getAge());
				System.out.println("getSearch >> gender >> " + ar.get(i).getGender());
				System.out.println("getSearch >> po_title >> " + ar.get(i).getPost_title());
				System.out.println("getSearch >> img_url >> " + ar.get(i).getImg_url());
			}

			// get html contents 불러오기
			for (int i = 0; i < ar.size(); i++) {
				String email = ar.get(i).getEmail();
				String file_name = ar.get(i).getPost_title();
				System.out.println("getDiaryHTML >> email >> " + email);
				System.out.println("getDiaryHTML >> file_name >> " + file_name);
				String path = "C:/Users/SMHRD/git/MZProject/MZ/WebContent/mkhtml/" + email + "/" + file_name;
				BufferedReader bufferedReader = null;
				try {

					System.out.println("getSearch file start code 1");
					// 파일 객체 생성
					File file = new File(path);
					// 입력 스트림 생성

					bufferedReader = new BufferedReader(new FileReader(path));
					String line = "";
					String touch = null;
					while (true) {
						System.out.println("getSearch file start code 2");
						touch = bufferedReader.readLine();
						line += touch;

						if (touch == null) {
							break;
						}

						// out.println(line);
					}
					System.out.println("getSearch file start code 3");
					line = line.substring(line.indexOf("<body>") - 1, line.indexOf("</body>") + 5);
					System.out.println("line sub 1 >> " + line);
					line = line.substring(line.indexOf("<div"), line.indexOf("</div>"));
					System.out.println("line sub 2 >> " + line);
					line = line.substring(line.indexOf("<p>") + 3, line.indexOf("</p>") - 1);
					System.out.println("line sub 3>> " + line);
					ar.get(i).setPost_contents(line);
					System.out.println("getSearch file start code 4");
					bufferedReader.close();
				} catch (FileNotFoundException e) {
					// TODO: handle exception
					System.out.println("getDiaryHTML >> 파일을 찾지 못했습니다.");
				} catch (IOException e) {
					System.out.println(e);
				}

			}
			// output json
			String json = new Gson().toJson(ar);
			out.println(json);

			System.out.println("getSearch last access point code n");

//End title
		} else if (function.equals("stitle")) {
			String plu_name = txt; // my_email
			System.out.println("name logic access code 2");
			emailSearchDTO dto = new emailSearchDTO();
			emailSearchDAO dao = new emailSearchDAO();

			// get html 목록 불러오기
			ArrayList<emailSearchDTO> ar = dao.select_plu_name(dto.getSelect_join_plu_name_post(), plu_name);
			// get html 확인
			for (int i = 0; i < ar.size(); i++) {
				System.out.println("getSearch >> email >> " + ar.get(i).getEmail());
				System.out.println("getSearch >> name >> " + ar.get(i).getName());
				System.out.println("getSearch >> age >> " + ar.get(i).getAge());
				System.out.println("getSearch >> gender >> " + ar.get(i).getGender());
				System.out.println("getSearch >> po_title >> " + ar.get(i).getPost_title());
				System.out.println("getSearch >> img_url >> " + ar.get(i).getImg_url());
			}

			// get html contents 불러오기
			for (int i = 0; i < ar.size(); i++) {
				String email = ar.get(i).getEmail();
				String file_name = ar.get(i).getPost_title();
				System.out.println("getDiaryHTML >> email >> " + email);
				System.out.println("getDiaryHTML >> file_name >> " + file_name);
				String path = "C:/Users/SMHRD/git/MZProject/MZ/WebContent/mkhtml/" + email + "/" + file_name;
				BufferedReader bufferedReader = null;
				try {

					System.out.println("getSearch file start code 1");
					// 파일 객체 생성
					File file = new File(path);
					// 입력 스트림 생성

					bufferedReader = new BufferedReader(new FileReader(path));
					String line = "";
					String touch = null;
					while (true) {
						System.out.println("getSearch file start code 2");
						touch = bufferedReader.readLine();
						line += touch;

						if (touch == null) {
							break;
						}

						// out.println(line);
					}
					System.out.println("getSearch file start code 3");
					line = line.substring(line.indexOf("<body>") - 1, line.indexOf("</body>") + 5);
					System.out.println("line sub 1 >> " + line);
					line = line.substring(line.indexOf("<div"), line.indexOf("</div>"));
					System.out.println("line sub 2 >> " + line);
					line = line.substring(line.indexOf("<p>") + 3, line.indexOf("</p>") - 1);
					System.out.println("line sub 3>> " + line);
					ar.get(i).setPost_contents(line);
					System.out.println("getSearch file start code 4");
					bufferedReader.close();
				} catch (FileNotFoundException e) {
					// TODO: handle exception
					System.out.println("getDiaryHTML >> 파일을 찾지 못했습니다.");
				} catch (IOException e) {
					System.out.println(e);
				}

			}
			// output json
			String json = new Gson().toJson(ar);
			out.println(json);

			System.out.println("getSearch last access point code n");

		}

	}

}
