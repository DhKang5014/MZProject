<%@page import="com.model.func.SearchDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.model.master.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src = 'https://code.jquery.com/jquery-3.5.1.min.js'></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<title>Insert title here</title>

<style>
/* 검색 스타일--------------------------------------------------------------------------------------------  */
@import
	url('https://fonts.googleapis.com/css?family=Raleway:400,700,900');

/* Base styling */
body {
	width: 100%;
	margin: 0 auto;
	background-color: white;
	font-family: 'Raleway', sans-serif;
	margin-top: 50px;
	text-align: center;
}

.search__container {
	width: 430px;
	margin: 0 auto;
	padding-top: 64px;
}

.search__title {
	font-size: 22px;
	font-weight: 900;
	text-align: center;
	color: #ff8b88;
}

.search__input {
	padding: 12px 24px;
	background-color: transparent;
	transition: transform 250ms ease-in-out;
	font-size: 14px;
	line-height: 18px;
	color: #575756;
	background-color: transparent;
	/*         background-image: url(http://mihaeltomic.com/codepen/input-search/ic_search_black_24px.svg); */
	background-image:
		url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'%3E%3Cpath d='M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z'/%3E%3Cpath d='M0 0h24v24H0z' fill='none'/%3E%3C/svg%3E");
	background-repeat: no-repeat;
	background-size: 18px 18px;
	background-position: 95% center;
	border-radius: 50px;
	border: 1px solid #575756;
	transition: all 250ms ease-in-out;
	backface-visibility: hidden;
	transform-style: preserve-3d;
}

.search__input::placeholder {
	color: rgba(87, 87, 86, 0.8);
	text-transform: uppercase;
	letter-spacing: 1.5px;
}

.search__input:hover, .search__input:focus {
	padding: 12px 0;
	outline: 0;
	border: 1px solid transparent;
	border-bottom: 1px solid #575756;
	border-radius: 0;
	background-position: 100% center;
}
/* 카테고리 선택창  */
select {
	width: 200px;
	padding: .8em .5em;
	border: 1px solid #999;
	font-family: inherit;
	border-radius: 50px;
}

/* 검색 스타일 끝--------------------------------------------------------------------------------------------  */
/* 테이블 스타일--------------------------------------------------------------------------------------------  */
/*//////////////////////////////////////////////////////////////////
[ FONT ]*/
@font-face {
	font-family: Lato-Regular;
	src: url('../fonts/Lato/Lato-Regular.ttf');
}

@font-face {
	font-family: Lato-Bold;
	src: url('../fonts/Lato/Lato-Bold.ttf');
}

/*//////////////////////////////////////////////////////////////////
[ RESTYLE TAG ]*/
* {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}

body, html {
	height: 100%;
	font-family: sans-serif;
}

/* ------------------------------------ */
a {
	margin: 0px;
	transition: all 0.4s;
	-webkit-transition: all 0.4s;
	-o-transition: all 0.4s;
	-moz-transition: all 0.4s;
}

a:focus {
	outline: none !important;
}

a:hover {
	text-decoration: none;
}

/* ------------------------------------ */
h1, h2, h3, h4, h5, h6 {
	margin: 0px;
}

p {
	margin: 0px;
}

ul, li {
	margin: 0px;
	list-style-type: none;
}

/* ------------------------------------ */
input {
	display: block;
	outline: none;
	border: none !important;
}

textarea {
	display: block;
	outline: none;
}

textarea:focus, input:focus {
	border-color: transparent !important;
}

/* ------------------------------------ */
button {
	outline: none !important;
	border: none;
	background: transparent;
}

button:hover {
	cursor: pointer;
}

iframe {
	border: none !important;
}

/*//////////////////////////////////////////////////////////////////
[ Scroll bar ]*/
.js-pscroll {
	position: relative;
	overflow: hidden;
}

.table100 .ps__rail-y {
	width: 9px;
	background-color: transparent;
	opacity: 1 !important;
	right: 5px;
}

.table100 .ps__rail-y::before {
	content: "";
	display: block;
	position: absolute;
	background-color: #ebebeb;
	border-radius: 5px;
	width: 100%;
	height: calc(100% - 30px);
	left: 0;
	top: 15px;
}

.table100 .ps__rail-y .ps__thumb-y {
	width: 100%;
	right: 0;
	background-color: transparent;
	opacity: 1 !important;
}

.table100 .ps__rail-y .ps__thumb-y::before {
	content: "";
	display: block;
	position: absolute;
	background-color: #cccccc;
	border-radius: 5px;
	width: 100%;
	height: calc(100% - 30px);
	left: 0;
	top: 15px;
}

/*//////////////////////////////////////////////////////////////////
[ Table ]*/
.limiter {
	width: 1366px;
	margin: 0 auto;
}

.container-table100 {
	width: 100%;
	min-height: 100vh;
	background: #fff;
	display: -webkit-box;
	display: -webkit-flex;
	display: -moz-box;
	display: -ms-flexbox;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-wrap: wrap;
	padding: 33px 30px;
}

.wrap-table100 {
	width: 1170px;
}

/*//////////////////////////////////////////////////////////////////
[ Table ]*/
.table100 {
	background-color: #fff;
}

table {
	width: 100%;
}

th, td {
	font-weight: unset;
	padding-right: 10px;
}

.column1 {
	width: 33%;
	padding-left: 40px;
}

.column2 {
	width: 13%;
}

.column3 {
	width: 22%;
}

.column4 {
	width: 19%;
}

.column5 {
	width: 13%;
}

.table100-head th {
	padding-top: 18px;
	padding-bottom: 18px;
}

.table100-body td {
	padding-top: 16px;
	padding-bottom: 16px;
}

/*==================================================================
[ Fix header ]*/
.table100 {
	position: relative;
	padding-top: 60px;
}

.table100-head {
	position: absolute;
	width: 100%;
	top: 0;
	left: 0;
}

.table100-body {
	max-height: 585px;
	overflow: auto;
}

/*==================================================================
[ Ver5 ]*/
.table100.ver5 {
	margin-right: -30px;
}

.table100.ver5 .table100-head {
	padding-right: 30px;
}

.table100.ver5 th {
	font-family: Lato-Bold;
	font-weight: bold;
	font-size: 14px;
	color: #555555;
	line-height: 1.4;
	text-transform: uppercase;
	background-color: transparent;
}

.table100.ver5 td {
	font-family: Lato-Regular;
	font-size: 15px;
	color: #808080;
	line-height: 1.4;
	background-color: #f7f7f7;
}

.table100.ver5 .table100-body tr {
	overflow: hidden;
	border-bottom: 10px solid #fff;
	border-radius: 10px;
}

.table100.ver5 .table100-body table {
	border-collapse: separate;
	border-spacing: 0 10px;
}

.table100.ver5 .table100-body td {
	border: solid 1px transparent;
	border-style: solid none;
	padding-top: 10px;
	padding-bottom: 10px;
}

.table100.ver5 .table100-body td:first-child {
	border-left-style: solid;
	border-top-left-radius: 10px;
	border-bottom-left-radius: 10px;
}

.table100.ver5 .table100-body td:last-child {
	border-right-style: solid;
	border-bottom-right-radius: 10px;
	border-top-right-radius: 10px;
}

.table100.ver5 tr:hover td {
	background-color: #ebebeb;
	cursor: pointer;
}

.table100.ver5 .table100-head th {
	padding-top: 25px;
	padding-bottom: 25px;
}

/*---------------------------------------------*/
.table100.ver5 {
	overflow: hidden;
}

.table100.ver5 .table100-body {
	padding-right: 30px;
}

.table100.ver5 .ps__rail-y {
	right: 0px;
}

.table100.ver5 .ps__rail-y::before {
	background-color: #ebebeb;
}

.table100.ver5 .ps__rail-y .ps__thumb-y::before {
	background-color: #cccccc;
}

/* 테이블 스타일 끝--------------------------------------------------------------------------------------------  */

<!-- HOME BUTTON STYLE -->
#setBounds{
	width: 10%;
	height:45px;
}
.button5 {
  background-color: #555555;
  color: white;
  border: 2px solid #555555;
  width:10%;
  height : 45px;
  margin-top:0px;
  border-radius : 30px;
}

.button5:hover {
  background-color: white;
  color: black;
}
<!-- END HOME BUTTON STYLE -->



</style>

</head>
<!-- 검색 바디 시작---------------------------------------------------------------------------------------  */ -->
<body>
<% 
	session = request.getSession();
	DTO dto = (DTO)session.getAttribute("user");
	String email = "a";
	if(dto != null){
		email = dto.getEmail();
		System.out.println("email get complete >> " + email);
	}
%>
	<!-- form start -->
	<div style="width: 100%;">
	<a href="index.jsp"><button id="home" class="button button5">HOME</button></a>
		<div style="width: 40%; display: inline;">
			<select name="select" id="select">
				<!-- 포스트 제목으로 검색  -->
				<option value="po_title">포스트제목</option>
				<!-- 다이어리 대제목으로 검색  -->
				<option value="title">다이어리 대제목</option>
				<!-- 다이어리 소제목으로 검색  -->
				<option value="stitle">다이어리 소제목</option>
				<!-- 다이어리 소개글으로 검색  -->
				<option value="content">소개글</option>
			</select>
		</div>
		<div class="search__container" style="width: 50%; display: inline;">
			<input class="search__input" type="text" placeholder="Search"
				name="search" style="display: inline;" id="search_text">
			<button class="search__button" onclick="Display()" style="width:30px; height:30px">
				<img src="img_suhyeon/Q.png" alt="">
			</button>
		</div>
	</div>
	<!-- 검색 바디 끝------------------------------------------------------------------------------------------->
	<!-- 테이블 바디 시작------------------------------------------------------------------------------------------->
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100 ver5 m-b-110">
					<div class="table100-title">
						<table>
							<thead>
								
								<tr class="row100 head">
									
									<th class="cell100 column1"> <!-- < selected  목록  -->
									
								</tr>
							</thead>
						</table>
					</div>
					
					<div class="table100-head">
						<table>
						
							<thead>
								<tr>
									<th class="cell100 column1"> 게시글 번호 </th>
									<th class="cell100 column2"> 대표 사진 </th>
									<th class="cell100 column3"> 제목 </th>
									<th class="cell100 column4"> 내용 </th>
									<th class="cell100 column5"> 작성자 </th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody id="tdb">
								
								<tr class="row100 body">
									<td class="cell100 column1">  </td>
									<td class="cell100 column2">  </td>
									<td class="cell100 column3"> </td>
									<td class="cell100 column4">  </td>
									<td class="cell100 column5">  </td>
								</tr>
									
								<tr class="row100 body">
								<td class="cell100 column1"> 검색 된 결과가 없습ㄴ디ㅏ. </td>
								</tr>
								

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- form End -->
	<div id="temp"></div>
	<!-- 테이블 끝 시작------------------------------------------------------------------------------------------->
	<script>
	
		function Display(){
			var txt = $('#search_text').val();
			var category = $('#select option:selected').val();
			console.log("txt",txt);
			console.log("category",category);

			$.ajax({ 

						url: "getSearch_Post",

						data: {				

							select : category,
							txt : txt,
							email : '<%=email %>' // 추후 수정

						}, // HTTP 요청과 함께 서버로 보낼 데이터 

						method: 'POST', // HTTP 요청 메소드(GET, POST 등) 

						//dataType: 'json' // 서버에서 보내줄 데이터의 타입 

			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.

			.done(function(data) { 

				console.log("done getSearch data >> ", data);
				console.log(JSON.parse(data));
				var obj = JSON.parse(data)
				console.log("post_contents",obj[0]['post_contents']);
				var result = "";
				// table making
				for(i in obj){
					console.log("loop >> "+ i +" >> ",obj[i].post_contents);
					result += '<tr class="row100 body" onclick="going('+i+')">';
					result += '<td class="cell100 column1">'+ eval(i+'+1') +  '</td>'
					result += '<td class="cell100 column2">'+'<img src="/img/'+obj[i].email+'/'+obj[i].img_url+'" style="width:100px;height:100px;"></img></td>';
					result += '<td class="cell100 column3" id="to'+i+'">'+ obj[i].post_title +'</td>';
					result += '<td class="cell100 column4">'+obj[i].post_contents+'</td>';
					result += '<td class="cell100 column5">'+ obj[i].name+'</td>';
					result += '</tr>';
				}
				$('#tdb').html(result);
				
				/* $('#temp').html(obj[0]['post_contents']);
				var temp = $('#temp div').html();
				console.log("temp > ", temp) */
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 

			.fail(function(xhr, status, errorThrown) { 

			})

			//Ajax End

		}
		
		$(document).keydown(function(event) {
			  if (event.keyCode == '13') {
				  Display();
			  }
		});
		
		function going(num){
			var file_name = $('#to'+num).text();
			console.log("file_name", file_name);
			var email = '<%=email%>';
			location.href="http://localhost:8087/MZ/mkhtml/"+email+"/"+file_name;
		}
		
	</script>
</body>
</html>