<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page import="com.model.master.*" %> 
<%@ page import="com.model.function.*" %>
<!DOCTYPE HTML>
<!--
	Story by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Story by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		
		<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=e9d9cd0ecb58b9ec853477490747eb58&libraries=drawing"></script>
		
		
		
		<style>
			.map_wrap {width: 100%;position: relative;height:100%;}
			.modes {position: absolute;top: 10px;left: 10px;z-index: 1;}
			.edit {position: absolute;top: 62px;left: 10px;z-index: 1;}
			#drawingMap {width: 100%;height: 350px;height:100%;}
			#undo.disabled, #redo.disabled {background-color:#ddd;color:#9e9e9e;}
			.small_btn{
				font-size :10px;
			}
			.btn-primary{
				background-color: white;
				border-radius: 50px;
				font-size:20px;
				height:70px;
				width:250px;
				border-color: gray;
				margin-top: 30px;
				margin-bottom: 30px;
			}
			.btn-primary:hover{
				background-color: white;
				border-radius: 50px;
				font-size:20px;
				height:70px;
				width:250px;
				border-color: gray;
				margin-top: 30px;
				margin-bottom: 30px;
			}
			.btn-secondary{
				background-color:white;
				width:100%;
			}
			.submit-form{
				position: absolute;
				left : 25%;
			}
			.btn{
				text-align : center;
			}
			
			
		</style>
	
	
	
	</head>
	<body class="is-preload">
		<%
			Object user = session.getAttribute("user");
			String display_email = null;
			String display_name = null;
			String display_age = null;
			String display_gender = null;
			DTO dto = null;
			String msg = null;
			if(user == null){
				//display_email = "로그인 한 이메일을 출력해주세요";
				//display_name = "로그인 한 사람의 이름을 출력";
				//display_age = "로그인 한 사람의 나이를 출력";
				//display_gender = "로그인 한 사람의 성별을 출력해주세요.";
				//msg = "";
			}else{
				dto = (DTO)user;
				
				display_email = dto.getEmail();
				
				display_name = dto.getName();
				display_age = Integer.toString(dto.getAge());
				display_gender = Integer.toString(dto.getGender());
				
			}
		%>
		
		<!-- 아이디 중복체크 후  -->
		<%
			String dup_check = null;
			Object dup_temp = null;
			dup_temp =	session.getAttribute("dup_check");
			if(dup_temp != null){
				dup_check = (String) dup_temp;
			}
			System.out.println(dup_check + " scriptlet dup check ");
		%>

	<script>
	//dup alert()
	<%
	if(dup_check != null){
		if(dup_check.equals("dup")){%>
			alert("다른 이메일을 사용하여 주세요.");
			<%
			session.setAttribute("dup_check", null);
		}else if(dup_check.equals("ok")){%>
			alert("이메일이 중복되지 않습니다.");
	<%
		session.setAttribute("dup_check", null);
		}
	}
	%>
	</script>

		
		<!-- Wrapper -->
			<div id="wrapper" class="divided">

				<!-- One -->
					<section class="banner style1 orient-left content-align-left image-position-right fullscreen onload-image-fade-in onload-content-fade-right">
						<div class="content" style="background-image:URL()">
							<h1>여행을 닮다</h1>
							<p class="major">당신의 여행을 다이어리에 담아서<br/> 우리에게 가치를 공유해 주세요.<br/>
							<%if(display_email!=null){%>
								<div><p id="email"><%=display_email%></p>님 환영합니다.</div>		
							<%}%>
						
							<ul class="actions stacked">
								
								
								
								<%if(display_email!=null){%>
									<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">회원정보수정</button>
									<a href="LogoutServiceCon.do"><button type="submit" class="btn btn-primary">로그아웃</button></a>
									<button type="button" class="btn btn-primary" onclick="publihser()">PUBLISHER 신청</button>
									<button type="button" class="btn btn-primary" onclick="subscriber()">SUBSCRIBER 신청</button>
									<li><a href="#first" class="button big wide smooth-scroll-middle">Get Started</a></li>
							<%}else{%>
								<a href="login.html"><button type="submit" class="btn btn-primary">로그인</button></a>
							<% }%>
								
								<%if(display_email==null){%>
									<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog" role="document">
									<div class="modal-content">
									  <div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">로그인 페이지</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										  <span aria-hidden="true">&times;</span>
										</button>
									  </div>
									  <div class="modal-body" style='height:500px;'>
										<form action="LoginServiceCon.do">
										  <div class="form-group">
											<label for="recipient-name" class="col-form-label">EMAIL :</label>
											<input type="text" class="form-control" id="email" name="email">
										  </div>
										  <div class="form-group">
											<label for="message-text" class="col-form-label">PASSWORD :</label>
											<input type="password" class="form-control" id="pw" name="pw">
										  </div>
										  <div class="submit-form">
										 	 <button type="submit" class="btn btn-primary">LOGIN</button>
										  </div>
										  
										</form>
										
										
									  </div>
									 	
									</div>
								  </div>
								  
								  
								  <div class="modal-dialog" role="document">
									<div class="modal-content">
									  <div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">회원가입 페이지</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										  <span aria-hidden="true">&times;</span>
										</button>
									  </div>
									  <div class="modal-body" style='height:1100px;'>
										<form action="JoinServiceCon.do">
										
										  <div class="form-group">
											<label for="recipient-name" class="col-form-label">EMAIL :</label>
											<input type="text" class="form-control" id="email" name="email">
										  </div>
										  
										  <button onclick="action='./DupCheck.do'; submit();"> Email 중복체크 </button>

											
										  <div class="form-group">
											<label for="message-text" class="col-form-label">PASSWORD :</label>
											<input type="password" class="form-control" id="pw" name="pw">
										  </div>
										  <div class="form-group">
											<label for="recipient-name" class="col-form-label">NAME :</label>
											<input type="text" class="form-control" id="name" name="name">
										  </div>
										  <div class="form-group">
											<label for="message-text" class="col-form-label">AGE :</label>
											<input type="password" class="form-control" id="age" name="age">
										  </div>
										  <div class="form-group">
											<label for="message-text" class="col-form-label">GENDER :</label>
											<input type="password" class="form-control" id="gender" name="gender">
										  </div>
										  
										   <div class="submit-form">
										 	 <button type="submit" class="btn btn-primary">JOIN</button>
										 	 
										  </div>
										  
										</form>
										
										
									  </div>
									 	
									</div>
								  </div>
								</div>
								<%}else{%>
								<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog" role="document">
									<div class="modal-content">
									  <div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">회원정보수정</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										  <span aria-hidden="true">&times;</span>
										</button>
									  </div>
									  <div class="modal-body" style='height:800px;'>
										<form action="AlterJoinServiceCon.do">
										  <div class="form-group">
											<label for="message-text" class="col-form-label">PASSWORD :</label>
											<input type="password" class="form-control" id="pw" name="pw">
										  </div>
										  <div class="form-group">
											<label for="message-text" class="col-form-label">NAME :</label>
											<input type="text" class="form-control" id="name" name="name">
										  </div>
										  <div class="form-group">
											<label for="message-text" class="col-form-label">AGE :</label>
											<input type="text" class="form-control" id="age" name="age">
										  </div>
										  <div class="form-group">
											<label for="message-text" class="col-form-label">GENDER :</label>
											<input type="text" class="form-control" id="gender" name="gender">
										  </div>
										  <div class="submit-form">
										 	 <button type="submit" class="btn btn-primary">변경</button>
										  </div>
										</form>
										
										
									  </div>
									 	
									</div>
								  </div>
							  </div>
								<%} %>
								
								
								
							</ul>
							
							
						</div>
						<div class="image"><image src="https://cdn.pixabay.com/photo/2017/08/01/14/30/yellow-2565846_960_720.jpg"></div>
						<!-- <div class="image">
							<div class="map_wrap">
								<div id="drawingMap"></div>
								<p class="modes" style="margin-top:20px;">
									<button onclick="selectOverlay('MARKER')">마커</button>
									<button onclick="selectOverlay('POLYLINE')">선</button>
									<button onclick="selectOverlay('CIRCLE')">원</button>
									<button onclick="selectOverlay('RECTANGLE')">사각형</button>
									<button onclick="selectOverlay('POLYGON')">다각형</button>
								</p>
								
								<p class="edit" style="margin-top:50px;">
									<button id="undo" class="disabled" onclick="undo()" disabled>UNDO</button>
									<button id="redo" class="disabled" onclick="redo()" disabled>REDO</button>
								</p>
							</div>
						
						</div> -->
					</section>

				<!-- Two -->
					<section class="spotlight style1 orient-right content-align-left image-position-center onscroll-image-fade-in" id="first">
						<div class="content">
							<h2>다양한 컨텐츠를 즐겨보세요.</h2>
							<p><br/></p>

							
								<a href="#search" class="button btn-primary button big wide smooth-scroll-middle" style="position: relative;">여행검색</a>
								<a href="#diary" class="button btn-primary button big wide smooth-scroll-middle" style="position: relative;">내 다이어리</a>
								<a href="#write" class="button btn-primary button big wide smooth-scroll-middle" style="position: relative;">다이어리 작성</a>
								<a href="#theme" class="button btn-primary button big wide smooth-scroll-middle" style="position: relative;">테마여행</a>
								<a href="#diary_all" class="button btn-primary button big wide smooth-scroll-middle" style="position: relative;">다이어리 탐방</a>
								<a href="#map_all" class="button btn-primary button big wide smooth-scroll-middle" style="position: relative;">전체지도</a>
								
								
						</div>
						<div class="image">
							<img src="images/spotlight01.jpg" alt="" />
						</div>
					</section>

				<!-- Three -->
					<section class="spotlight style1 orient-left content-align-left image-position-center onscroll-image-fade-in">
						<div class="content">
							<h2 id="search">여행 검색</h2>
							<p></p>
							<ul class="actions stacked">
								<li><a href="#" class="button">Learn More</a></li>
							</ul>
						</div>
						<div class="image">
							<img src="images/spotlight02.jpg" alt="" />
						</div>
					</section>

				<!-- Four -->
					<section class="spotlight style1 orient-right content-align-left image-position-center onscroll-image-fade-in">
						<div class="content">
							<h2 id="diary">내 다이어리</h2>
							<p>최근 다이어리</p>
							<ul class="actions stacked">
								<li><a href="#" class="button">수정하기</a></li>
							</ul>
						</div>
						<div class="image">
							<img src="images/spotlight03.jpg" alt="" />
						</div>
					</section>

				<!-- Five -->
					<section class="wrapper style1 align-center">
						<div class="inner">
							<h2 id="write">다이어리 작성하기</h2>
							<p>당신이 작성한 다이어리는 많은 이들에게 가치를 줄 수 있습니다.</p>
							<a href="external.html" class="button">작성하기</a>
							<a href="diary2.jsp" class="button">내 다이어리 보기</a>
							<a href="MkDir.do" class="button">이미지 서버 만들기</a>
							<a href="imgDiary.jsp" class="button">이미지 서버 수정하기</a>
						</div>

						<!-- Gallery -->
							<div class="gallery style2 medium lightbox onscroll-fade-in">
								<article>
									<a href="images/gallery/fulls/01.jpg" class="image">
										<img src="images/gallery/thumbs/01.jpg" alt="" />
									</a>
									<div class="caption">
										<h3>테마여행</h3>
										<p>Lorem ipsum dolor amet, consectetur magna etiam elit. Etiam sed ultrices.</p>
										<ul class="actions fixed">
											<li><span class="button small">Details</span></li>
										</ul>
									</div>
								</article>
								<article id="theme">
									<a href="images/gallery/fulls/02.jpg" class="image">
										<img src="images/gallery/thumbs/02.jpg" alt="" />
									</a>
									<div class="caption">
										<h3>Feugiat Lorem</h3>
										<p>Lorem ipsum dolor amet, consectetur magna etiam elit. Etiam sed ultrices.</p>
										<ul class="actions fixed">
											<li><span class="button small">Details</span></li>
										</ul>
									</div>
								</article>
								<article>
									<a href="images/gallery/fulls/03.jpg" class="image">
										<img src="images/gallery/thumbs/03.jpg" alt="" />
									</a>
									<div class="caption">
										<h3>Magna Amet</h3>
										<p>Lorem ipsum dolor amet, consectetur magna etiam elit. Etiam sed ultrices.</p>
										<ul class="actions fixed">
											<li><span class="button small">Details</span></li>
										</ul>
									</div>
								</article>
								<article>
									<a href="images/gallery/fulls/04.jpg" class="image">
										<img src="images/gallery/thumbs/04.jpg" alt="" />
									</a>
									<div class="caption">
										<h3>Sed Tempus</h3>
										<p>Lorem ipsum dolor amet, consectetur magna etiam elit. Etiam sed ultrices.</p>
										<ul class="actions fixed">
											<li><span class="button small">Details</span></li>
										</ul>
									</div>
								</article>
								<article>
									<a href="images/gallery/fulls/05.jpg" class="image">
										<img src="images/gallery/thumbs/05.jpg" alt="" />
									</a>
									<div class="caption">
										<h3>Ultrices Magna</h3>
										<p>Lorem ipsum dolor amet, consectetur magna etiam elit. Etiam sed ultrices.</p>
										<ul class="actions fixed">
											<li><span class="button small">Details</span></li>
										</ul>
									</div>
								</article>
								<article>
									<a href="images/gallery/fulls/06.jpg" class="image">
										<img src="images/gallery/thumbs/06.jpg" alt="" />
									</a>
									<div class="caption">
										<h3>Sed Tempus</h3>
										<p>Lorem ipsum dolor amet, consectetur magna etiam elit. Etiam sed ultrices.</p>
										<ul class="actions fixed">
											<li><span class="button small">Details</span></li>
										</ul>
									</div>
								</article>
								<article>
									<a href="images/gallery/fulls/07.jpg" class="image">
										<img src="images/gallery/thumbs/07.jpg" alt="" />
									</a>
									<div class="caption">
										<h3>Ipsum Lorem</h3>
										<p>Lorem ipsum dolor amet, consectetur magna etiam elit. Etiam sed ultrices.</p>
										<ul class="actions fixed">
											<li><span class="button small">Details</span></li>
										</ul>
									</div>
								</article>
								<article>
									<a href="images/gallery/fulls/08.jpg" class="image">
										<img src="images/gallery/thumbs/08.jpg" alt="" />
									</a>
									<div class="caption">
										<h3>Magna Risus</h3>
										<p>Lorem ipsum dolor amet, consectetur magna etiam elit. Etiam sed ultrices.</p>
										<ul class="actions fixed">
											<li><span class="button small">Details</span></li>
										</ul>
									</div>
								</article>
								<article>
									<a href="images/gallery/fulls/09.jpg" class="image">
										<img src="images/gallery/thumbs/09.jpg" alt="" />
									</a>
									<div class="caption">
										<h3>Tempus Dolor</h3>
										<p>Lorem ipsum dolor amet, consectetur magna etiam elit. Etiam sed ultrices.</p>
										<ul class="actions fixed">
											<li><span class="button small">Details</span></li>
										</ul>
									</div>
								</article>
								<article>
									<a href="images/gallery/fulls/10.jpg" class="image">
										<img src="images/gallery/thumbs/10.jpg" alt="" />
									</a>
									<div class="caption">
										<h3>Sed Etiam</h3>
										<p>Lorem ipsum dolor amet, consectetur magna etiam elit. Etiam sed ultrices.</p>
										<ul class="actions fixed">
											<li><span class="button small">Details</span></li>
										</ul>
									</div>
								</article>
								<article>
									<a href="images/gallery/fulls/11.jpg" class="image">
										<img src="images/gallery/thumbs/11.jpg" alt="" />
									</a>
									<div class="caption">
										<h3>Magna Lorem</h3>
										<p>Lorem ipsum dolor amet, consectetur magna etiam elit. Etiam sed ultrices.</p>
										<ul class="actions fixed">
											<li><span class="button small">Details</span></li>
										</ul>
									</div>
								</article>
								<article>
									<a href="images/gallery/fulls/12.jpg" class="image">
										<img src="images/gallery/thumbs/12.jpg" alt="" />
									</a>
									<div class="caption">
										<h3>Ipsum Dolor</h3>
										<p>Lorem ipsum dolor amet, consectetur magna etiam elit. Etiam sed ultrices.</p>
										<ul class="actions fixed">
											<li><span class="button small">Details</span></li>
										</ul>
									</div>
								</article>
							</div>

					</section>

				<!-- Six -->
					<section class="wrapper style1 align-center">
						<div class="inner">
							<h2>다이어리 탐방</h2>
							<p id='diary_all'>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi id ante sed ex pharetra lacinia sit amet vel massa. Donec facilisis laoreet nulla eu bibendum. Donec ut ex risus. Fusce lorem lectus, pharetra pretium massa et, hendrerit vestibulum odio lorem ipsum.</p>
							<div class="items style1 medium onscroll-fade-in">
								<section>
									<span class="icon style2 major fa-gem"></span>
									<h3>Lorem</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon solid style2 major fa-save"></span>
									<h3>Ipsum</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon solid style2 major fa-chart-bar"></span>
									<h3>Dolor</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon solid style2 major fa-wifi"></span>
									<h3>Amet</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon solid style2 major fa-cog"></span>
									<h3>Magna</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon style2 major fa-paper-plane"></span>
									<h3>Tempus</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon solid style2 major fa-desktop"></span>
									<h3>Aliquam</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon solid style2 major fa-sync-alt"></span>
									<h3>Elit</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon solid style2 major fa-hashtag"></span>
									<h3>Morbi</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon solid style2 major fa-bolt"></span>
									<h3>Turpis</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon solid style2 major fa-envelope"></span>
									<h3>Ultrices</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
								<section>
									<span class="icon solid style2 major fa-leaf"></span>
									<h3>Risus</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dui turpis, cursus eget orci amet aliquam congue semper. Etiam eget ultrices risus nec tempor elit.</p>
								</section>
							</div>
						</div>
					</section>
				
				
				<!-- Seven -->
				
				
				
				
					<section>
						
						<div id="map" style="width:1180px;height:700px;margin-left:250px"></div>

    <p>
        <button class ="small_btn" onclick="panTo()">CGI센터로 이동</button><button class ="small_btn" onclick="createRoad()">교통정보 보기</button><button class ="small_btn" onclick="removeRoad()">교통정보 감추기</button> 
        <button class ="small_btn" onclick="setBounds()">지도 범위 마커의 위치로 재조정 하기</button> 
    </p>


    
    <p id="result"></p>




    <script>
        var container = document.getElementById('map'), //지도를 담을 영역의 DOM 레퍼런스
         options = { //지도를 생성할 때 필요한 기본 옵션
            center: new kakao.maps.LatLng(35.1107911,126.8751548), //지도의 중심좌표.
            level: 3 //지도의 레벨(확대, 축소 정도)
        };
        
        
        var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
        // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
        var mapTypeControl = new kakao.maps.MapTypeControl();   


        // 지도 타입 컨트롤을 지도에 표시합니다.
        map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
        // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
        var zoomControl = new kakao.maps.ZoomControl();
        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


        function panTo() {
            // 이동할 위도 경도 위치를 생성합니다 
            var moveLatLon = new kakao.maps.LatLng(35.1107911,126.8751548);
            // 지도 중심을 부드럽게 이동시킵니다
            // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
            map.panTo(moveLatLon);
        }

        // 지도에 교통정보를 표시하도록 지도타입을 추가합니다
        function createRoad(){
            map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);    
        }

        // 아래 코드는 위에서 추가한 교통정보 지도타입을 제거합니다
        function removeRoad(){
            map.removeOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);     
        }        
        

        //마커들의 좌표
        //버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다.
        var points = [
        new kakao.maps.LatLng(35.1107911,126.8751548),
        new kakao.maps.LatLng(35.1414794,126.9298364),
        new kakao.maps.LatLng(35.128644,126.8861603)
        ];

        // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
        var bounds = new kakao.maps.LatLngBounds();
        var i, marker;
        for (i = 0; i < points.length; i++) {
            // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
            marker =     new kakao.maps.Marker({ position : points[i] });
            marker.setMap(map);
            
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(points[i]);
        }
        function setBounds() {
            // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
            // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
            map.setBounds(bounds);
        }



        // 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        

    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng;
    
    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
    message += '경도는 ' + latlng.getLng() + ' 입니다';
    
    var resultDiv = document.getElementById('result'); 
    resultDiv.innerHTML = message;
    
});
    </script>
						<!-- <div class="image">
							<div class="map_wrap">
								<div id="drawingMap"></div>
								<p class="modes" style="margin-top:20px;">
									<button onclick="selectOverlay('MARKER')">마커</button>
									<button onclick="selectOverlay('POLYLINE')">선</button>
									<button onclick="selectOverlay('CIRCLE')">원</button>
									<button onclick="selectOverlay('RECTANGLE')">사각형</button>
									<button onclick="selectOverlay('POLYGON')">다각형</button>
								</p>
								
								<p class="edit" style="margin-top:50px;">
									<button id="undo" class="disabled" onclick="undo()" disabled>UNDO</button>
									<button id="redo" class="disabled" onclick="redo()" disabled>REDO</button>
								</p>
							</div>
						
						</div> -->
					</section>
				
				
				
				
				
				
				
				
				
				<!-- Eight -->
					<section class="wrapper style1 align-center">
						<div class="inner medium">
							<h2>Get in touch</h2>
							<form method="post" action="#">
								<div class="fields">
									<div class="field half">
										<label for="name">Name</label>
										<input type="text" name="name" id="name" value="" />
									</div>
									<div class="field half">
										<label for="email">Email</label>
										<input type="email" name="email" id="email" value="" />
									</div>
									<div class="field">
										<label for="message">Message</label>
										<textarea name="message" id="message" rows="6"></textarea>
									</div>
								</div>
								<ul class="actions special">
									<li><input type="submit" name="submit" id="submit" value="Send Message" /></li>
								</ul>
							</form>

						</div>
					</section>

				<!-- Footer -->
					<footer class="wrapper style1 align-center">
						<div class="inner">
							<ul class="icons">
								<li><a href="#" class="icon brands style2 fa-twitter"><span class="label">Twitter</span></a></li>
								<li><a href="#" class="icon brands style2 fa-facebook-f"><span class="label">Facebook</span></a></li>
								<li><a href="#" class="icon brands style2 fa-instagram"><span class="label">Instagram</span></a></li>
								<li><a href="#" class="icon brands style2 fa-linkedin-in"><span class="label">LinkedIn</span></a></li>
								<li><a href="#" class="icon style2 fa-envelope"><span class="label">Email</span></a></li>
							</ul>
							<p>&copy; Untitled. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
						</div>
					</footer>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			<script>
				// Drawing Manager로 도형을 그릴 지도 div
				var drawingMapContainer = document.getElementById('drawingMap'),
					drawingMap = { 
						center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						level: 3 // 지도의 확대 레벨
					};
				
				// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
				var drawingMap = new kakao.maps.Map(drawingMapContainer, drawingMap); 
				
				var options = { // Drawing Manager를 생성할 때 사용할 옵션입니다
					map: drawingMap, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
					drawingMode: [ // Drawing Manager로 제공할 그리기 요소 모드입니다
						kakao.maps.Drawing.OverlayType.MARKER,
						kakao.maps.Drawing.OverlayType.POLYLINE,
						kakao.maps.Drawing.OverlayType.RECTANGLE,
						kakao.maps.Drawing.OverlayType.CIRCLE,
						kakao.maps.Drawing.OverlayType.POLYGON
					],
					// 사용자에게 제공할 그리기 가이드 툴팁입니다
					// 사용자에게 도형을 그릴때, 드래그할때, 수정할때 가이드 툴팁을 표시하도록 설정합니다
					guideTooltip: ['draw', 'drag', 'edit'], 
					markerOptions: { // 마커 옵션입니다 
						draggable: true, // 마커를 그리고 나서 드래그 가능하게 합니다 
						removable: true // 마커를 삭제 할 수 있도록 x 버튼이 표시됩니다  
					},
					polylineOptions: { // 선 옵션입니다
						draggable: true, // 그린 후 드래그가 가능하도록 설정합니다
						removable: true, // 그린 후 삭제 할 수 있도록 x 버튼이 표시됩니다
						editable: true, // 그린 후 수정할 수 있도록 설정합니다 
						strokeColor: '#39f', // 선 색
						hintStrokeStyle: 'dash', // 그리중 마우스를 따라다니는 보조선의 선 스타일
						hintStrokeOpacity: 0.5  // 그리중 마우스를 따라다니는 보조선의 투명도
					},
					rectangleOptions: {
						draggable: true,
						removable: true,
						editable: true,
						strokeColor: '#39f', // 외곽선 색
						fillColor: '#39f', // 채우기 색
						fillOpacity: 0.5 // 채우기색 투명도
					},
					circleOptions: {
						draggable: true,
						removable: true,
						editable: true,
						strokeColor: '#39f',
						fillColor: '#39f',
						fillOpacity: 0.5
					},
					polygonOptions: {
						draggable: true,
						removable: true,
						editable: true,
						strokeColor: '#39f',
						fillColor: '#39f',
						fillOpacity: 0.5,
						hintStrokeStyle: 'dash',
						hintStrokeOpacity: 0.5
					}
				};
				
				// 위에 작성한 옵션으로 Drawing Manager를 생성합니다
				var manager = new kakao.maps.Drawing.DrawingManager(options);
				
				// undo, redo 버튼의 disabled 속성을 설정하기 위해 엘리먼트를 변수에 설정합니다
				var undoBtn = document.getElementById('undo');
				var redoBtn = document.getElementById('redo');
				
				// Drawing Manager 객체에 state_changed 이벤트를 등록합니다
				// state_changed 이벤트는 그리기 요소의 생성/수정/이동/삭제 동작 
				// 또는 Drawing Manager의 undo, redo 메소드가 실행됐을 때 발생합니다
				manager.addListener('state_changed', function() {
				
					// 되돌릴 수 있다면 undo 버튼을 활성화 시킵니다 
					if (manager.undoable()) {
						undoBtn.disabled = false;
						undoBtn.className = "";
					} else { // 아니면 undo 버튼을 비활성화 시킵니다 
						undoBtn.disabled = true;
						undoBtn.className = "disabled";
					}
				
					// 취소할 수 있다면 redo 버튼을 활성화 시킵니다 
					if (manager.redoable()) {
						redoBtn.disabled = false;
						redoBtn.className = "";
					} else { // 아니면 redo 버튼을 비활성화 시킵니다 
						redoBtn.disabled = true;
						redoBtn.className = "disabled";
					}
				
				});
				
				// 버튼 클릭 시 호출되는 핸들러 입니다
				function selectOverlay(type) {
					// 그리기 중이면 그리기를 취소합니다
					manager.cancel();
				
					// 클릭한 그리기 요소 타입을 선택합니다
					manager.select(kakao.maps.Drawing.OverlayType[type]);
				}
				
				// undo 버튼 클릭시 호출되는 함수입니다.
				function undo() {
					// 그리기 요소를 이전 상태로 되돌립니다
					manager.undo();
				}
				
				// redo 버튼 클릭시 호출되는 함수입니다.
				function redo() {
					// 이전 상태로 되돌린 상태를 취소합니다
					manager.redo();
				}
				
				//배포자 신청
				function publihser(){
					
						var email = document.getElementById("email").innerText;
						
						console.log("publisher() function >> " + email);
						$.ajax({  
						type: "POST" 
						,url: "/MZ/PublisherCreateServiceCon.do"
						,data: {email:email}
						,success:function(data){
							alert("성공");
						}
						,error:function(data){
							alert("error");
						}
						});
					
				}
				
				//구독자 신청
				function subscriber(){
					var email = document.getElementById("email").innerText;
					
					console.log("sublisher() function >> " + email);
					$.ajax({  
					type: "POST" 
					,url: "/MZ/SubscriberCreateServiceCon.do"
					,data: {email:email}
					,success:function(data){
						alert("성공");
					}
					,error:function(data){
						alert("error");
					}
					});
					
					
				}
				
				
				
				</script>
			

	</body>
</html>