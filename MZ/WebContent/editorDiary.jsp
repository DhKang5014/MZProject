<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model.master.*"%>
<!DOCTYPE html>
<html id="ko">

<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css2/froala_editor.css">
<link rel="stylesheet" href="css2/froala_style.css">
<link rel="stylesheet" href="css2/plugins/code_view.css">
<link rel="stylesheet" href="css2/plugins/colors.css">
<link rel="stylesheet" href="css2/plugins/emoticons.css">
<link rel="stylesheet" href="css2/plugins/file.css">
<link rel="stylesheet" href="css2/plugins/image_manager.css">
<link rel="stylesheet" href="css2/plugins/image.css">
<link rel="stylesheet" href="css2/plugins/line_breaker.css">
<link rel="stylesheet" href="css2/plugins/table.css">
<link rel="stylesheet" href="css2/plugins/video.css">
<link rel="stylesheet" href="css2/plugins/fullscreen.css">
<link rel="stylesheet" href="css2/plugins/quick_insert.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.css">

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

<!-- Style sheet bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
body {
	text-align: center;
	margin: 0;
	margin-top: 100px;
}

div#editor {
	width: 81%;
	margin: auto;
	text-align: left;
}

#foo {
	
}

.button {
	padding: 12px 24px;
	background-color: transparent;
	transition: transform 250ms ease-in-out;
	font-size: 14px;
	line-height: 18px;
	color: #575756;
	background-color: transparent;
	background-repeat: no-repeat;
	background-size: 18px 18px;
	background-position: 95% center;
	border-radius: 50px;
	border: 1px solid #575756;
	transition: all 250ms ease-in-out;
	backface-visibility: hidden;
	transform-style: preserve-3d;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button:hover span {
	padding-right: 25px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}

#res {
	text-align: left;
	align-content: flex-start;
}
</style>
</head>
<%
	DTO dto = (DTO)session.getAttribute("user");
	String email = dto.getEmail();
%>
<body id='kk'>
	<div style="">
		<div
			style="background-color: lightgray; width: 700px; margin: 0 auto;">
			<h1 style="font-family: 'Kaushan Script', cursive; font-size: 80px;">Write
				a Diary</h1>
		</div>
	</div>
	<button class="button" onclick='insertTitle()'>제목 추가</button>
	<button class="button" onclick='insertPage()'>페이지 추가</button>
	<button class="button" onclick='deletePage()'>페이지 삭제</button>
	<button class="button" onclick='savePage()'>저장</button>
	<!-- 전체공개, 구독자공개, 비공개 라디오 버튼 -->
	<label><input type="radio" name="optradio" checked>전체공개</label>
	<label><input type="radio" name="optradio">구독자공개</label>
	<label><input type="radio" name="optradio">비공개</label>
		

	<br>
	<div id="foo"></div>
	<div id="editor">
		<div id="edit1">
			<h1>여기에 제목을 입력해 주세요.</h1>
		</div>
		<br>
		<br>
		<div id="edit2">
			<h1>External Shared Toolbar</h1>

			<p>You can have more than one editor instance on the same page.
				However, this will not affect the editing experience. You can even
				drag and drop images from one editor to the other.</p>
		</div>
	</div>
	<br>
	<br>
	<div>
		대표 이미지 URL을 입력하세요 : <input type="text" id="img_title"> 장소 순서를
		각 장소의 대표 이미지와 매칭 시켜주세요 :
		<div id="img_matching"></div>


	</div>
	<br>
	<br>
	<div id="res">
		<div id="title"></div>
		<div id="content"></div>
	</div>

	<div id="temporary"></div>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/mode/xml/xml.min.js"></script>
	<script type="text/javascript" src="js2/froala_editor.min.js"></script>
	<script type="text/javascript" src="js2/plugins/align.min.js"></script>
	<script type="text/javascript" src="js2/plugins/code_beautifier.min.js"></script>
	<script type="text/javascript" src="js2/plugins/code_view.min.js"></script>
	<script type="text/javascript" src="js2/plugins/colors.min.js"></script>
	<script type="text/javascript" src="js2/plugins/draggable.min.js"></script>
	<script type="text/javascript" src="js2/plugins/emoticons.min.js"></script>
	<script type="text/javascript" src="js2/plugins/file.min.js"></script>
	<script type="text/javascript" src="js2/plugins/font_size.min.js"></script>
	<script type="text/javascript" src="js2/plugins/font_family.min.js"></script>
	<script type="text/javascript" src="js2/plugins/image.min.js"></script>
	<script type="text/javascript" src="js2/plugins/image_manager.min.js"></script>
	<script type="text/javascript" src="js2/plugins/line_breaker.min.js"></script>
	<script type="text/javascript" src="js2/plugins/link.min.js"></script>
	<script type="text/javascript" src="js2/plugins/lists.min.js"></script>
	<script type="text/javascript"
		src="js2/plugins/paragraph_format.min.js"></script>
	<script type="text/javascript" src="js2/plugins/paragraph_style.min.js"></script>
	<script type="text/javascript" src="js2/plugins/video.min.js"></script>
	<script type="text/javascript" src="js2/plugins/table.min.js"></script>
	<script type="text/javascript" src="js2/plugins/url.min.js"></script>
	<script type="text/javascript" src="js2/plugins/entities.min.js"></script>
	<script type="text/javascript" src="js2/plugins/quick_insert.min.js"></script>
	<script type="text/javascript" src="js2/plugins/inline_style.min.js"></script>
	<script type="text/javascript" src="js2/plugins/save.min.js"></script>
	<script type="text/javascript" src="js2/plugins/fullscreen.min.js"></script>

	<script>
		(function() {
			new FroalaEditor("#edit1, #edit, #edit2", {
				toolbarContainer : '#foo',
				toolbarButtons : [
						[ 'bold', 'italic', 'underline', 'strikeThrough',
								'textColor', 'backgroundColor', 'emoticons' ],
						[ 'paragraphFormat', 'align', 'formatOL', 'formatUL',
								'indent', 'outdent' ],
						[ 'insertImage', 'insertLink', 'insertFile',
								'insertVideo', 'undo', 'redo' ] ]
			})
		})()
	</script>
	<script>
	var file_name = "";
		var i = 0;
		function insertTitle() {
			$('#title').html($('#edit1 .fr-element').html());
			//$('#edit1').remove('div').remove('span').remove('svg').remove('path').remove('a');
			//document.getElementById('res').innerHTML+=document.getElementById('edit1').innerHTML+'<div id="edit3" style="margin-top: 10px;"><h3>새페이지 추가</h3></div>';
		}
		function insertPage() {
			i+=1;
			var res = $('#content').html() +  "<div id='"+i+"'>"+$('#edit2 .fr-element').html()+"</div>";
			//console.log(res);
			$('#content').html(res);
	
		}
		function deletePage() {
			$('#'+i).remove();
			//$('#edit1').remove('div').remove('span').remove('svg').remove('path').remove('a');
			
			//document.getElementById('res').innerHTML+=document.getElementById('edit1').innerHTML+'<div id="edit3" style="margin-top: 10px;"><h3>새페이지 추가</h3></div>';
		}
		function savePage() {
			var content = $('#content').html();
			var title = $('#title').html();
			var title2 = $('#title').text();
			file_name = $('#title').text();
			var meta =
				"<html><head><meta charset='UTF-8'><meta name='viewport' content='width=device-width, initial-scale=1.0'><title>"+file_name;
				meta+= "</title><script src='https://code.jquery.com/jquery-3.5.1.min.js'><\/script></head><body>";
					meta += title + content+"</div>" +"</body><script>";

					meta += "function diary2(){\n";
					meta +=	"var file_name = '"+ title2 +".html';\n";
					meta +=	"console.log(file_name)\n";

					meta +=	"$.ajax(\n";
					meta +=	"		{ \n";
					meta +='			url: "../../getDiaryImgOrderFromDB",\n'; // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
					meta +="			data: {";
		
					meta +="				file_name : file_name\n";
					meta +="			}, // HTTP 요청과 함께 서버로 보낼 데이터 \n";
					meta +="			method: 'POST', // HTTP 요청 메소드(GET, POST 등) \n";
					meta +="			//dataType: 'json' // 서버에서 보내줄 데이터의 타입 \n";
					meta +="			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.\n";
					meta +="			.done(function(data) { \n";
					meta +="				console.log(data);\n";
					meta +="				console.log(JSON.parse(data));\n var js = JSON.parse(data);\n";
					meta +="				var lat = new Array();";
					meta +="				var lon = new Array();";
					meta +="				for(var i=0;i<js.length;i++){";
					meta +="					lat[i]=JSON.parse(data)[i].lat;\n lon[i]=JSON.parse(data)[i].lon;\n";
					meta += 	" }";
					
					meta +="  				";
					//meta +="				$('#map').attr('src',\"../../map.html?lat=\"+lat.toString()+\"&lon=\"+lon.toString())\n";								
							
							
					meta +="			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. \n";
					meta +="			.fail(function(xhr, status, errorThrown) { \n";
					meta +="				alert('실패');\n";
					meta +="			}) //\n";
								
					meta +="}diary2();\n<\/script><\/html>";
			var img_title_url = $('#img_title').val();
			console.log();
			console.log("MkDiaryServiceCon() function >> request : meta :  " + meta);
			console.log("MkDiaryServiceCon() function >> request : content :  " + content);
			console.log("MkDiaryServiceCon() function >> request : title " + title);
			console.log("MkDiaryServiceCon() function >> request : file_name " + file_name);
			console.log("MkDiaryServiceCon() function >> request : img_title_url " + img_title_url);
			console.log();
			console.log();
			$.ajax({  
			type: "POST" 
			,url: "setDiary"
			,data: { content:content,title:title,file_name:file_name,meta:meta,img_title_url:img_title_url }
			,success:function(data){
				alert("성공");
				console.log(file_name);
				
				file_name='mkhtml/'+'<%=email%>'+'/'+file_name+'.html';
				$.ajax(
					{ 
						url: "getDiaryImg", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
						data: {

							file_name : file_name
						}, // HTTP 요청과 함께 서버로 보낼 데이터 
						method: "POST", // HTTP 요청 메소드(GET, POST 등) 
						//dataType: "json" // 서버에서 보내줄 데이터의 타입 
						}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
						.done(function(data) { 
							console.log("결과값 : " + data);
							$('#temporary').html(data);
							
							var ttt = $('#temporary img');
							console.log(ttt);
							console.log(ttt.length);
							

							var li = new Array();
							for(var i=0;i<ttt.length;i++){
								li[i]=ttt[i].currentSrc;
							}
							console.log(li.toString());
							
							// DB 저장 AJAX
							$.ajax({ url: "saveDiaryImgOrder.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
								data: {  file_name:file_name, src:li.toString() }, // HTTP 요청과 함께 서버로 보낼 데이터 
								method: "POST", // HTTP 요청 메소드(GET, POST 등) 
								//dataType: "json" // 서버에서 보내줄 데이터의 타입 
								}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
								.done(function(data) { 
									console.log("saveDiaryImgOrder  >>  data  " + data);
									location.href="diary2.jsp";
							})
							




						}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
						.fail(function(xhr, status, errorThrown) { 
							alert("실패");
						}) //
			}
			,error:function(data){
				alert("error");
			}
			})
			.done(function(data){
				console.log(data);
			});
		}
		
		function diary(){
			console.log(file_name);
			
			file_name='mkhtml'+'<%=email%>'+file_name;
			$.ajax(
				{ 
					url: "getDiaryImg", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
					data: {
						file_name : file_name
					}, // HTTP 요청과 함께 서버로 보낼 데이터 
					method: "POST", // HTTP 요청 메소드(GET, POST 등) 
					//dataType: "json" // 서버에서 보내줄 데이터의 타입 
					}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
					.done(function(data) { 
						console.log(data);
						$('#temporary').html(data);
						var ttt = $('#temporary img');
						console.log(ttt);
						console.log(ttt.length);
						

						var li = new Array();
						for(var i=0;i<ttt.length;i++){
							li[i]=ttt[i].currentSrc;
						}
						console.log(li.toString());

						// DB 저장 AJAX
						$.ajax({ url: "saveDiaryImgOrder.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
							data: { file_name:file_name, src:li.toString() }, // HTTP 요청과 함께 서버로 보낼 데이터 
							method: "POST", // HTTP 요청 메소드(GET, POST 등) 
							//dataType: "json" // 서버에서 보내줄 데이터의 타입 
							}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
							.done(function(data) { 
								console.log("saveDiaryImgOrder  >>  data  " + data);
								
						})
						




					}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
					.fail(function(xhr, status, errorThrown) { 
						alert("실패");
					}) //
					
		}
	</script>
</body>

</html>