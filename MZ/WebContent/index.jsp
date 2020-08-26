<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model.master.*" %>

<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="ko">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<title>Made Three</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="favicon.ico">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!--Google Font link-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Droid+Serif:400,400i,700,700i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">


<link rel="stylesheet" href="assets_imgServer/css/slick.css">
<link rel="stylesheet" href="assets_imgServer/css/slick-theme.css">
<link rel="stylesheet" href="assets_imgServer/css/animate.css">
<link rel="stylesheet" href="assets_imgServer/css/iconfont.css">
<link rel="stylesheet" href="assets_imgServer/css/font-awesome.min.css">
<link rel="stylesheet" href="assets_imgServer/css/bootstrap.css">
<link rel="stylesheet" href="assets_imgServer/css/magnific-popup.css">
<link rel="stylesheet" href="assets_imgServer/css/bootsnav.css">



<!--For Plugins external css-->
<link rel="stylesheet" href="assets_imgServer/css/plugins.css" />

<!--Theme custom css -->
<link rel="stylesheet" href="assets_imgServer/css/style.css">

<!--Theme Responsive css-->
<link rel="stylesheet" href="assets_imgServer/css/responsive.css" />

<script src="assets_imgServer/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<style>
input.img-button {
	background: url("assets_imgServer/images/diary.png") no-repeat;
}

/*     	body {
  font-family: tahoma;
  height: 100vh;
  background-image: url(https://picsum.photos/g/3000/2000);
  background-size: cover;
  background-position: center;
  display: flex;
  align-items: center;
}
 */
.our-team {
	padding: 30px 0 40px;
	margin-bottom: 30px;
	background-color: #f7f5ec;
	text-align: center;
	overflow: hidden;
	position: relative;
}

.our-team .picture {
	display: inline-block;
	height: 130px;
	width: 130px;
	margin-bottom: 50px;
	z-index: 1;
	position: relative;
}

.our-team .picture::before {
	content: "";
	width: 100%;
	height: 0;
	border-radius: 50%;
	background-color: #D8EEE1;
	position: absolute;
	bottom: 135%;
	right: 0;
	left: 0;
	opacity: 0.9;
	transform: scale(3);
	transition: all 0.3s linear 0s;
}

.our-team:hover .picture::before {
	height: 100%;
}

.our-team .picture::after {
	content: "";
	width: 100%;
	height: 100%;
	border-radius: 50%;
	background-color: #D8EEE1;
	position: absolute;
	top: 0;
	left: 0;
	z-index: -1;
}

.our-team .picture img {
	width: 100%;
	height: auto;
	border-radius: 50%;
	transform: scale(1);
	transition: all 0.9s ease 0s;
}

.our-team:hover .picture img {
	box-shadow: 0 0 0 14px #f7f5ec;
	transform: scale(0.7);
}

.our-team .title {
	display: block;
	font-size: 15px;
	color: #4e5052;
	text-transform: capitalize;
}

.our-team .social {
	width: 100%;
	padding: 0;
	margin: 0;
	background-color: #D8EEE1;
	position: absolute;
	bottom: -100px;
	left: 0;
	transition: all 0.5s ease 0s;
}

.our-team:hover .social {
	bottom: 0;
}

.our-team .social li {
	display: inline-block;
}

.our-team .social li a {
	display: block;
	padding: 10px;
	font-size: 17px;
	color: white;
	transition: all 0.3s ease 0s;
	text-decoration: none;
}

.our-team .social li a:hover {
	color: #D8EEE1;
	background-color: #f7f5ec;
}
</style>
</head>


<body data-spy="scroll" data-target=".navbar-collapse" data-offset="100">
<% String email = request.getParameter("email"); 
	System.out.println("index >> email >> " + email);
	Object obj = session.getAttribute("user");
	DTO dto = (DTO)obj;
	if(dto == null){
		System.out.println("index >> dto >> null");
	}else{
		System.out.println("index >> dto email >> " + dto.getEmail());
		email = dto.getEmail();
	}
	//System.out.println("Session Email >> " + dto.getEmail());
%>

	<!-- Preloader -->
	<div id="loading">
		<div id="loading-center">
			<div id="loading-center-absolute">
				<div class="object" id="object_one"></div>
				<div class="object" id="object_two"></div>
				<div class="object" id="object_three"></div>
				<div class="object" id="object_four"></div>
			</div>
		</div>
	</div>
	<!--End off Preloader -->


	<div class="culmn">
		<!--Home page style-->


		<nav
			class="navbar navbar-default bootsnav navbar-fixed no-background white">

			<!-- Start Top Search -->
			<div class="top-search">
				<div class="container">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-search"></i></span>
						<input type="text" class="form-control" placeholder="Search">
						<span class="input-group-addon close-search"><i
							class="fa fa-times"></i></span>
					</div>
				</div>
			</div>
			<!-- End Top Search -->


			<div class="container">
				<div class="attr-nav">
					<ul>
						<li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
					</ul>
				</div>

				<!-- Start Header Navigation -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#navbar-menu">
						<i class="fa fa-bars"></i>
					</button>
					<a class="navbar-brand" href="#brand"> <!-- <img src="assets/images/여행을담다.png" class="logo" alt=""> -->
						<img src="assets_imgServer/images/travel12.png" style="height : 50px; max-width : 100%;"  class="logo" alt="">
					</a>

				</div>
				<!-- End Header Navigation -->

				<!-- navbar menu -->
				<div class="collapse navbar-collapse" id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#home">Home</a></li>
						<li><a href="#features">About</a></li>
						<!-- 로그인 전 -->
						<%if(email==null){ %><li class="before_login"><a href="login.html" class="before_login">Login</a></li>
						<li class="before_login"><a href="join.html" class="before_login">Join</a></li>
						<!-- 로그인 후 -->
						<%}else{ %>
						<li class="after_login"><a href="imgServer.jsp" class="after_login">MyPhoto</a></li>
						<li class="after_login"><a href="diary.jsp" class="after_login">MyDiary</a></li>
						<li class="after_login"><a href="#teams" class="after_login">MZmember</a></li>
						<%} %>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>

		</nav>

		<!--Home Sections-->

		<section id="home" class="home bg-black fix">
			<div class="overlay">
				<!-- <img src="../images/map(1).jpg"> -->
			</div>
			<div class="container">
				<div class="row">
					<div class="main_home text-center">
						<div class="col-md-12">
							<div class="hello">
								<div class="slid_item">
									<div class="home_text ">
										<h1 class="text-yellow">Where to go?</h1>
										<h3 class="text-white text-uppercase">Let's make your own
											travel book</h3>
									</div>
								</div>
								<!-- End off slid item -->

							</div>
						</div>

					</div>


					<a class="mouse-scroll" href="#about"> <span class="mouse">
							<span class="mouse-movement"></span>
					</span> <span class="mouse-message fadeIn">Explore</span> <br /> <!--<i class="fa fa-angle-down m-top-10 fadeIn mouse-message"></i>-->
					</a>

				</div>
				<!--End off row-->
			</div>
			<!--End off container -->
		</section>
		<!--End off Home Sections-->



		<!--About Section-->
		<section id="about" class="about bg-yellow roomy-80">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<div class="main_about text-center">
							<!-- <h1 class="text-black">where to go? Make your books</h1>
							<h2 class="text-white">- & -</h2>
							<h3 class="text-black text-uppercase">We love to design a
								website and the other awesome graphic</h3>
 -->
 
 								<img src = "" >
							<a href="" class="btn btn-primary m-top-100">Get In Touch</a>
						</div>
					</div>
				</div>
			</div>
		</section>



		<!--Featured Section-->
		<section id="features" class="features bg-white">
			<div class="container">
				<div class="row">
					<div class="main_features fix roomy-70">

						<div class="col-md-5">
							<div class="features_item">
								<div class="head_title">
									<h2 class="text-uppercase">
										Our <strong>Service</strong>
									</h2>
								</div>
								<div class="featured_content">
									<p>여행의 소중한 순간을 생성하고, 기록하는 서비스 입니다. 사진, 위치를 간편하게 작성하면, ( )가
										멋진여행기를 만들어 드립니다. 멋진 나의 여행기를 책으로 만들어 간직하고 선물해보세요.</p>

									<a href="" class="btn btn-default m-top-40">Read More</a>
								</div>
							</div>
						</div>

						<div class="col-md-6 col-md-offset-1 sm-m-top-50">
							<div class="features_item2_area">
								<div class="features_item2 text-center">
									<div class="divider_horizontal"></div>
									<div class="divider_vertical"></div>
									<div class="col-xs-6">
										<div class="features_item_text">
											<!-- <input type="button" class="img-button"> -->
											<a href="editorDiary.html"><img src="assets_imgServer/images/diary.png"
												alt="" class="img-circle"/ ></a>
											<a href="editorDiary.html"><p class="m-top-20">나만의 다이어리 쓰기</p></a>
										</div>
									</div>
									<div class="col-xs-6">
										<div class="features_item_text">
											<a href="Search.jsp"><img src="assets_imgServer/images/search.png" alt="" class="img-circle" /></a>
											<a href="Search.jsp"><p class="m-top-20">검색하기</p></a>
										</div>
									</div>
									<div class="col-xs-6">
										<div class="features_item_text m-top-50">
											<a href="MachineLearningIndex.jsp"><img src="assets_imgServer/images/machinelearning.png" alt=""
												class="img-circle" /></a>
											<a href="MachineLearningIndex.jsp"><p class="m-top-20">머신러닝 페이지</p></a>
										</div>
									</div>
									<div class="col-xs-6">
										<div class="features_item_text m-top-50">
											<a href="entire_map.jsp"><img src="assets_imgServer/images/book.png"
												alt="" class="img-circle" /></a>
											
											<a href="entire_map.jsp"><p class="m-top-20">나의 여행지 지도</p></a>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- End off row -->
			</div>
			<!-- End off container -->
		</section>
		<!-- End off Featured Section-->
		<!--Choose section-->
		<section id="choose" class="choose bg-grey roomy-80">
			<div class="container">
				<div class="row">
					<div class="main_choose">
						<div class="col-md-6">
							<div class="choose_mac">
								<div class="choose_slide">
									<div class="choose_item">
										<img src="assets_imgServer/images/wh01.jpg" alt="" /style="width:600px; height: 377px;">
									</div>
									<div class="choose_item">
										<img src="assets_imgServer/images/wh02.jpg" alt="" /style="width:600px; height: 377px;">
									</div>
									<div class="choose_item">
										<img src="assets_imgServer/images/travel-2650303_1280.jpg" alt=""
											/style="width:600px; height: 377px;">
									</div>
								</div>
							</div>
						</div>
						<!-- End off col-md-6 -->

						<div class="col-md-5 col-md-offset-1">
							<div class="choose_content sm-m-top-40">
								<div class="head_title">
									<h2 class="text-uppercase">
										Why <strong>Choose Us</strong>
									</h2>
								</div>
								<div class="choose_item_text fix">
									<h6>
										<i class="fa fa-check-square-o"></i>간단히 써도 멋지고 유용한 여행기
									</h6>
									<p>간단하게 선택할 수 있는 경로와 지도로 여행기 기분을 한껏 낼 수 있어요</p>
								</div>
								<div class="choose_item_text fix m-top-20">
									<h6>
										<i class="fa fa-check-square-o"></i>여행 지역/테마별로 모아보기
									</h6>
									<p>여행따라 기분따라 맞춤 태그를 입력하고 같은 취향의 여행기를 찾아서 볼 수 있어요</p>
								</div>
								<div class="choose_item_text fix m-top-20">
									<h6>
										<i class="fa fa-check-square-o"></i>나만의 여행기 나만의 책
									</h6>
									<p>기록한 여행기를 한손에 쏙 들어오는 감각적인 책으로 만들어요</p>
								</div>
								<div class="choose_item_text fix m-top-20">
									<h6>
										<i class="fa fa-check-square-o"></i>나만의 장소 등록하기
									</h6>
									<p>지도에 없던 나만의 장소를 다른 사람에게 공유해보세요</p>
								</div>
							</div>
						</div>
						<!-- End off col-md-6 -->
					</div>
				</div>
				<!-- End off row -->
			</div>
			<!-- End off container -->
		</section>
		<!-- End off choose section -->


		<!--Business Section-->
		<section id="service" class="service bg-grey roomy-70">
			<div class="container">
				<div class="row">
					<div class="main_service">
						<div class="col-md-6">
							<div class="service_slid">
								<div class="slid_shap bg-yellow"></div>
								<div class="service_slid_item text-center">
									<div class="service_slid_text">
										<span class="icon icon icon-tools text-black"></span>
										<h5 class="text-black m-top-20">여행계획세우기</h5>
									</div>
									<div class="service_slid_text">
										<span class="icon icon icon-sports-2 text-black"></span>
										<h5 class="text-black m-top-20">나만의 책만들기</h5>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-5 col-md-offset-1">
							<div class="service_item sm-m-top-50">
								<div class="head_title">
									<h2 class="text-uppercase">
										Our <strong>Service</strong>
									</h2>
								</div>
								<div class="service_content">
									<p>기록한 여행기를 감각적인 책으로 만들 수 있어요, 함께 여행한 친구와 연인에게 선물도 할 수 있어요.
										여행기에 어울리는 여러가지 테마로 나만의 책 컬렉션을 만들어 보세요.</p>

									<a href="" class="btn btn-default m-top-40">Read More</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End off Business section -->







		<!--Portfolio Section-->



		<section id="portfolio" class="portfolio margin-top-120">

			<!-- Portfolio container-->
			<div class="container">
				<div class="row">
					<div class="main-portfolio roomy-80">

						<div class="col-md-4">
							<div class="head_title text-left sm-text-center wow fadeInDown">
								<h2>Our Works</h2>
							</div>
						</div>

						<div class="col-md-8">
							<div class="filters-button-group text-right sm-text-center">
								<button class="btn button is-checked" data-filter="*">all</button>
								<button class="btn button" data-filter=".metal">Web
									Design</button>
								<button class="btn button" data-filter=".transition">Logo
									Design</button>
								<button class="btn button" data-filter=".alkali">Branding</button>
								<button class="btn button" data-filter=".ar">Branding</button>
							</div>
						</div>

						<div style="clear: both;"></div>

						<div class="grid text-center">

							<div class="grid-item transition metal ium">
								<img alt="" src="assets_imgServer/images/porfolio-1.jpg">
								<div class="grid_hover_area text-center">
									<div class="girid_hover_text m-top-110">
										<h4 class="text-white">Your Work Title</h4>
										<p class="text-white">- Business Card, Branding</p>
										<a href="assets_imgServer/images/porfolio-1.jpg"
											class="btn btn-primary popup-img">View Project</a>
									</div>
								</div>
								<!-- End off grid Hover area -->
							</div>
							<!-- End off grid item -->

							<div class="grid-item metalloid ">
								<img alt="" src="assets_imgServer/images/porfolio-2.jpg">
								<div class="grid_hover_area text-center">
									<div class="girid_hover_text m-top-180">
										<h4 class="text-white">Your Work Title</h4>
										<p class="text-white">- Business Card, Branding</p>
										<a href="assets_imgServer/images/porfolio-2.jpg"
											class="btn btn-primary popup-img">View Project</a>
									</div>
								</div>
								<!-- End off grid Hover area -->
							</div>
							<!-- End off grid item -->

							<div class="grid-item post-transition metal numberGreaterThan50">
								<img alt="" src="assets_imgServer/images/porfolio-3.jpg">
								<div class="grid_hover_area text-center">
									<div class="girid_hover_text m-top-50">
										<h4 class="text-white">Your Work Title</h4>
										<p class="text-white">- Business Card, Branding</p>
										<a href="assets_imgServer/images/porfolio-3.jpg"
											class="btn btn-primary popup-img">View Project</a>
									</div>
								</div>
								<!-- End off grid Hover area -->
							</div>
							<!-- End off grid item -->

							<div class="grid-item post-transition metal ium">
								<img alt="" src="assets_imgServer/images/porfolio-4.jpg">
								<div class="grid_hover_area text-center">
									<div class="girid_hover_text m-top-180">
										<h4 class="text-white">Your Work Title</h4>
										<p class="text-white">- Business Card, Branding</p>
										<a href="assets_imgServer/images/porfolio-4.jpg"
											class="btn btn-primary popup-img">View Project</a>
									</div>
								</div>
								<!-- End off grid Hover area -->
							</div>
							<!-- End off grid item -->

							<div class="grid-item metal ar">
								<img alt="" src="assets_imgServer/images/porfolio-5.jpg">
								<div class="grid_hover_area text-center">
									<div class="girid_hover_text m-top-110">
										<h4 class="text-white">Your Work Title</h4>
										<p class="text-white">- Business Card, Branding</p>
										<a href="assets_imgServer/images/porfolio-5.jpg"
											class="btn btn-primary popup-img">View Project</a>
									</div>
								</div>
								<!-- End off grid Hover area -->
							</div>
							<!-- End off grid item -->

							<div class="grid-item alkali ar">
								<img alt="" src="assets_imgServer/images/porfolio-6.jpg">
								<div class="grid_hover_area text-center">
									<div class="girid_hover_text m-top-50">
										<h4 class="text-white">Your Work Title</h4>
										<p class="text-white">- Business Card, Branding</p>
										<a href="assets_imgServer/images/porfolio-6.jpg"
											class="btn btn-primary popup-img">View Project</a>
									</div>
								</div>
								<!-- End off grid Hover area -->
							</div>
							<!-- End off grid item -->

						</div>



						<div style="clear: both;"></div>


					</div>
				</div>
			</div>
			<!-- Portfolio container end -->
		</section>
		<!-- End off portfolio section -->



		<!--Test section-->
		<!--  <section id="test" class="test bg-grey roomy-60 fix">
                <div class="container">
                    <div class="row">                        
                        <div class="main_test fix">
                            <div class="col-md-6">
                                <div class="cbrand text-center">
                                    <div class="divider_horizontal"></div>
                                    <div class="divider_vertical"></div>
                                    <div class="col-xs-6">
                                        <div class="cbrand_item">
                                            <img src="assets_imgServer/images/cbrand-1.png" alt="" />
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="cbrand_item">
                                            <img src="assets_imgServer/images/cbrand-2.png" alt="" />
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="cbrand_item m-top-40">
                                            <img src="assets_imgServer/images/cbrand-3.png" alt="" />
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="cbrand_item m-top-40">
                                            <img src="assets_imgServer/images/cbrand-4.png" alt="" />
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div class="col-md-6 sm-m-top-40">
                                <div class="test_item1 fix ">
                                    <div class="head_title fix">
                                        <h2 class="text-uppercase">What <strong>Client Say</strong></h2>
                                    </div>
                                    <div class="item_img">
                                        <img class="img-circle" src="assets_imgServer/images/test-img1.jpg" alt="" />
                                        <i class="fa fa-quote-left"></i>
                                    </div>

                                    <div class="item_text">
                                        <h5>Sarah Smith</h5>
                                        <h6>envato.com</h6>

                                        <p>Natus voluptatum enim quod necessitatibus quis
                                            expedita harum provident eos obcaecati id culpa
                                            corporis molestias.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>End off test section -->
		<!--Team And Skill Section-->
		<section id="teams" class="teams roomy-80">
			<div class="container">
				<div class="row">
					<div class="col-12 col-sm-6 col-md-4 col-lg-3">
						<div class="our-team">
							<div class="picture">
								<img class="img-fluid" src="">
							</div>
							<div class="team-content">
								<h3 class="name">박수현</h3>
								<h4 class="title">팀장</h4>
							</div>
							<ul class="social">
								<li><a href="https://codepen.io/collection/XdWJOQ/"
									class="fa fa-facebook" aria-hidden="true"></a></li>
								<li><a href="https://codepen.io/collection/XdWJOQ/"
									class="fa fa-twitter" aria-hidden="true"></a></li>
								<li><a href="https://codepen.io/collection/XdWJOQ/"
									class="fa fa-google-plus" aria-hidden="true">
									..................................................</a></li>
								<li><a href="https://codepen.io/collection/XdWJOQ/"
									class="fa fa-linkedin" aria-hidden="true"></a></li>
							</ul>
						</div>
					</div>
					<div class="col-12 col-sm-6 col-md-4 col-lg-3">
						<div class="our-team">
							<div class="picture">
								<img class="img-fluid" src="">
							</div>
							<div class="team-content">
								<h3 class="name">장화수</h3>
								<h4 class="title">Web Developer</h4>
							</div>
							<ul class="social">
								<li><a href="https://codepen.io/collection/XdWJOQ/"
									class="fa fa-facebook" aria-hidden="true"></a></li>
								<li><a href="https://codepen.io/collection/XdWJOQ/"
									class="fa fa-twitter" aria-hidden="true"></a></li>
								<li><a href="https://codepen.io/collection/XdWJOQ/"
									class="fa fa-google-plus" aria-hidden="true"></a></li>
								<li><a href="https://codepen.io/collection/XdWJOQ/"
									class="fa fa-linkedin" aria-hidden="true"></a></li>
							</ul>
						</div>
					</div>
					<div class="col-12 col-sm-6 col-md-4 col-lg-3">
						<div class="our-team">
							<div class="picture">
								<img class="img-fluid" src="">
							</div>
							<div class="team-content">
								<h3 class="name">강다훈</h3>
								<h4 class="title">Web Developer</h4>
							</div>
							<ul class="social">
								<li><a href="https://codepen.io/collection/XdWJOQ/"
									class="fa fa-facebook" aria-hidden="true"></a></li>
								<li><a href="https://codepen.io/collection/XdWJOQ/"
									class="fa fa-twitter" aria-hidden="true"></a></li>
								<li><a href="https://codepen.io/collection/XdWJOQ/"
									class="fa fa-google-plus" aria-hidden="true"></a></li>
								<li><a href="https://codepen.io/collection/XdWJOQ/"
									class="fa fa-linkedin" aria-hidden="true"></a></li>
							</ul>
						</div>
					</div>
					<div class="col-12 col-sm-6 col-md-4 col-lg-3">
						<div class="our-team">
							<div class="picture">
								<img class="img-fluid" src="">
							</div>
							<div class="team-content">
								<h3 class="name">김지윤</h3>
								<h4 class="title">Web Developer</h4>
							</div>
							<ul class="social">
								<li><a href="https://codepen.io/collection/XdWJOQ/"
									class="fa fa-facebook" aria-hidden="true"></a></li>
								<li><a href="https://codepen.io/collection/XdWJOQ/"
									class="fa fa-twitter" aria-hidden="true"></a></li>
								<li><a href="https://codepen.io/collection/XdWJOQ/"
									class="fa fa-google-plus" aria-hidden="true"></a></li>
								<li><a href="https://codepen.io/collection/XdWJOQ/"
									class="fa fa-linkedin" aria-hidden="true"></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End off Team & Skill section -->


		<footer id="contact" class="footer action-lage bg-black p-top-80"
			style="background-image: none">
			<!--<div class="action-lage"></div>-->
			<div class="container">
				<div class="row">
					<div class="widget_area">
						<div class="col-md-3">
							<div class="widget_item widget_about">
								<h5 class="text-white">About Us</h5>
								<p class="m-top-30">Lorem ipsum dolor sit amet consec tetur
									adipiscing elit nulla aliquet pretium nisi in cursus maecenas
									nec eleifen.</p>
								<div class="widget_ab_item m-top-30">
									<div class="item_icon">
										<i class="fa fa-location-arrow"></i>
									</div>
									<div class="widget_ab_item_text">
										<h6 class="text-white">Location</h6>
										<p>123 suscipit ipsum nam auctor mauris dui, ac
											sollicitudin mauris, Bandung</p>
									</div>
								</div>
								<div class="widget_ab_item m-top-30">
									<div class="item_icon">
										<i class="fa fa-phone"></i>
									</div>
									<div class="widget_ab_item_text">
										<h6 class="text-white">Phone :</h6>
										<p>+1 2345 6789</p>
									</div>
								</div>
								<div class="widget_ab_item m-top-30">
									<div class="item_icon">
										<i class="fa fa-envelope-o"></i>
									</div>
									<div class="widget_ab_item_text">
										<h6 class="text-white">Email Address :</h6>
										<p>youremail@mail.com</p>
									</div>
								</div>
							</div>
							<!-- End off widget item -->
						</div>
						<!-- End off col-md-3 -->

						<div class="col-md-3">
							<div class="widget_item widget_latest sm-m-top-50">
								<h5 class="text-white">Latest News</h5>
								<div class="widget_latst_item m-top-30">
									<div class="item_icon">
										<img src="assets_imgServer/images/ltst-img-1.jpg" alt="" />
									</div>
									<div class="widget_latst_item_text">
										<p>Lorem ipsum dolor sit amet, consectetur</p>
										<a href="">21<sup>th</sup> July 2016
										</a>
									</div>
								</div>
								<div class="widget_latst_item m-top-30">
									<div class="item_icon">
										<img src="assets_imgServer/images/ltst-img-2.jpg" alt="" />
									</div>
									<div class="widget_latst_item_text">
										<p>Lorem ipsum dolor sit amet, consectetur</p>
										<a href="">21<sup>th</sup> July 2016
										</a>
									</div>
								</div>
								<div class="widget_latst_item m-top-30">
									<div class="item_icon">
										<img src="assets_imgServer/images/ltst-img-3.jpg" alt="" />
									</div>
									<div class="widget_latst_item_text">
										<p>Lorem ipsum dolor sit amet, consectetur</p>
										<a href="">21<sup>th</sup> July 2016
										</a>
									</div>
								</div>
							</div>
							<!-- End off widget item -->
						</div>
						<!-- End off col-md-3 -->

						<div class="col-md-3">
							<div class="widget_item widget_service sm-m-top-50">
								<h5 class="text-white">Latest News</h5>
								<ul class="m-top-20">
									<li class="m-top-20"><a href="#"><i
											class="fa fa-angle-right"></i> Web Design</a></li>
									<li class="m-top-20"><a href="#"><i
											class="fa fa-angle-right"></i> User Interface Design</a></li>
									<li class="m-top-20"><a href="#"><i
											class="fa fa-angle-right"></i> Web Hosting</a></li>
									<li class="m-top-20"><a href="#"><i
											class="fa fa-angle-right"></i> Themes</a></li>
									<li class="m-top-20"><a href="#"><i
											class="fa fa-angle-right"></i> Support Forums</a></li>
								</ul>

							</div>
							<!-- End off widget item -->
						</div>
						<!-- End off col-md-3 -->

						<div class="col-md-3">
							<div class="widget_item widget_newsletter sm-m-top-50">
								<h5 class="text-white">Newsletter</h5>
								<form class="form-inline m-top-30">
									<div class="form-group">
										<input type="email" class="form-control"
											placeholder="Enter you Email">
										<button type="submit" class="btn text-center">
											<i class="fa fa-arrow-right"></i>
										</button>
									</div>

								</form>
								<div class="widget_brand m-top-40">
									<a href="" class="text-uppercase">여행을, 담다</a>
									<p>Lorem ipsum dolor sit amet consec tetur adipiscing elit
										nulla aliquet pretium nisi in</p>
								</div>
								<ul class="list-inline m-top-20">
									<li>- <a href=""><i class="fa fa-facebook"></i></a></li>
									<li><a href=""><i class="fa fa-twitter"></i></a></li>
									<li><a href=""><i class="fa fa-linkedin"></i></a></li>
									<li><a href=""><i class="fa fa-google-plus"></i></a></li>
									<li><a href=""><i class="fa fa-behance"></i></a></li>
									<li><a href=""><i class="fa fa-dribbble"></i></a> -</li>
								</ul>

							</div>
							<!-- End off widget item -->
						</div>
						<!-- End off col-md-3 -->
					</div>
				</div>
			</div>
			<div
				class="main_footer fix bg-mega text-center p-top-40 p-bottom-30 m-top-80">
				<div class="col-md-12">
					<p class="wow fadeInRight" data-wow-duration="1s">
						Made with <i class="fa fa-heart"></i> by <a target="_blank"
							href="http://bootstrapthemes.co">Bootstrap Themes</a> 2016. All
						Rights Reserved
					</p>
				</div>
			</div>
		</footer>




	</div>

	<!-- JS includes -->

	<script src="assets_imgServer/js/vendor/jquery-1.11.2.min.js"></script>
	<script src="assets_imgServer/js/vendor/bootstrap.min.js"></script>

	<script src="assets_imgServer/js/jquery.magnific-popup.js"></script>
	<!--<script src="assets/js/jquery.easypiechart.min.js"></script>-->
	<script src="assets_imgServer/js/jquery.easing.1.3.js"></script>
	<!--<script src="assets/js/slick.js"></script>-->
	<script src="assets_imgServer/js/slick.min.js"></script>
	<script src="assassets_imgServerets/js/js.isotope.js"></script>
	<script src="assets_imgServer/js/jquery.collapse.js"></script>
	<script src="assets_imgServer/js/bootsnav.js"></script>

	<script
		src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
	
	<script src="assets_imgServer/js/plugins.js"></script>
	<script src="assets_imgServer/js/main.js"></script>
	

</body>
</html>
