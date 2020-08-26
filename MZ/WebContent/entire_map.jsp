<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<!-- Map API ---------------------------------------------------------------------------------------->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9d9cd0ecb58b9ec853477490747eb58"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9d9cd0ecb58b9ec853477490747eb58&libraries=services"></script>
<!--  ------------------------------------------------------------------------------------------------>
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style>
#setBounds{
	display: black;
	width: 100%;
	height:45px;
}
.button5 {
  background-color: #555555;
  color: white;
  border: 2px solid #555555;
  width:100%;
  height : 45px;
  margin-top:0px;
}

.button5:hover {
  background-color: white;
  color: black;
}
</style>
</head>
<body>
	<div style="text-align: center;">
		<h1 style="font-family: 'Kaushan Script', cursive; font-size: 80px;">My
			Map</h1>
	</div>
	<div
		style="border: 4px dashed #bcbcbc; width: 80%; height: 850px; margin: 0 auto;">
		<h3 id="title" style="text-align: center;">
			지도가 나올 부분</h3>
			
			<!-- Map View -->
			<button type="button" id="setBounds" class="btn btn-info">지도 범위 재설정</button>
			<div id="map" style="width: 100%; height: 700px; margin-left: 0px; display:inline-block"></div>
			<button id="home" class="button button5">HOME</button>
			<p id="result"></p>

		</h3>
	</div>
</body>

<script>

let lat_ar = new Array();
let lon_ar = new Array();
$.ajax(
		{ 
			url: "getLocation", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 
			//data: {
			//	file_name : file_name
			//}, // HTTP 요청과 함께 서버로 보낼 데이터 
			method: "POST", // HTTP 요청 메소드(GET, POST 등) 
			//dataType: "json" // 서버에서 보내줄 데이터의 타입 
			}) // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
			.done(function(data) { 
				var obj = JSON.parse(data);
				console.log("ajax result >> ", obj);
				var result = "";
				// table making
				var email = obj[0]['email'];
				$('#title').text(email+"님의 모든 여행지")
				for(i in obj){
					console.log("lat > " + i +" >> ",obj[i]['lat']);
					console.log("lon > " + i +" >> ",obj[i]['lon']);
					lat_ar[i]=obj[i]['lat'];
					lon_ar[i]=obj[i]['lon'];
				}
				console.log(lat_ar.toString());
				console.log(lon_ar.toString());
				
				$(document).ready(function(){
					console.log("out scope >> ", lat_ar.toString());
					console.log("out scope >> ", lon_ar.toString());
					var container = document.getElementById('map'), //지도를 담을 영역의 DOM 레퍼런스
					options = { //지도를 생성할 때 필요한 기본 옵션
						center : new kakao.maps.LatLng(35.1107911, 126.8751548), //지도의 중심좌표.
						level : 3
					//지도의 레벨(확대, 축소 정도)
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
						var moveLatLon = new kakao.maps.LatLng(35.1107911, 126.8751548);
						// 지도 중심을 부드럽게 이동시킵니다
						// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
						map.panTo(moveLatLon);
					}

					// 지도에 교통정보를 표시하도록 지도타입을 추가합니다
					function createRoad() {
						map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);
					}

					// 아래 코드는 위에서 추가한 교통정보 지도타입을 제거합니다
					function removeRoad() {
						map.removeOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);
					}

					//마커들의 좌표
					//버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다.
					var points = new Array();
					//[
					//new kakao.maps.LatLng(35.1107911,126.8751548),
					//new kakao.maps.LatLng(35.1414794,126.9298364),
					//new kakao.maps.LatLng(35.128644,126.8861603)
					//];
					for (var i = 0; i < lat_ar.length; i++) {
						points[i] = new kakao.maps.LatLng(lat_ar[i], lon_ar[i]);
					}

					// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
					var bounds = new kakao.maps.LatLngBounds();
					var i, marker;
					for (i = 0; i < points.length; i++) {
						// 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
						marker = new kakao.maps.Marker({
							position : points[i]
						});
						marker.setMap(map);

						// LatLngBounds 객체에 좌표를 추가합니다
						bounds.extend(points[i]);
					}
					function setBounds() {
						// LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
						// 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
						map.setBounds(bounds);
					}

					$('#setBounds').click(function(){
						var points = new Array();
						//[
						//new kakao.maps.LatLng(35.1107911,126.8751548),
						//new kakao.maps.LatLng(35.1414794,126.9298364),
						//new kakao.maps.LatLng(35.128644,126.8861603)
						//];
						for (var i = 0; i < lat_ar.length; i++) {
							points[i] = new kakao.maps.LatLng(lat_ar[i], lon_ar[i]);
						}

						// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
						var bounds = new kakao.maps.LatLngBounds();
						var i, marker;
						for (i = 0; i < points.length; i++) {
							// 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
							marker = new kakao.maps.Marker({
								position : points[i]
							});
							marker.setMap(map);

							// LatLngBounds 객체에 좌표를 추가합니다
							bounds.extend(points[i]);
						}
						map.setBounds(bounds);
					});
					$('#home').click(function(){
						location.href="index.jsp";
					});
					
					// 지도에 클릭 이벤트를 등록합니다
					// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
					kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

						// 클릭한 위도, 경도 정보를 가져옵니다 
						var latlng = mouseEvent.latLng;

						var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
						message += '경도는 ' + latlng.getLng() + ' 입니다';
						console.log(message);
						// 마커 위치를 클릭한 위치로 옮깁니다
						marker.setPosition(latlng);

						var resultDiv = document.getElementById('result');
						resultDiv.innerHTML = message;

					});
					// 장소 검색 객체를 생성합니다
					var ps = new kakao.maps.services.Places();
					var infowindow = new kakao.maps.InfoWindow({
						zIndex : 1
					});

					// 키워드로 장소를 검색합니다
					ps.keywordSearch('조선대 맛집', placesSearchCB);

					// 키워드 검색 완료 시 호출되는 콜백함수 입니다
					function placesSearchCB(data, status, pagination) {
						if (status === kakao.maps.services.Status.OK) {

							// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
							// LatLngBounds 객체에 좌표를 추가합니다
							var bounds = new kakao.maps.LatLngBounds();

							for (var i = 0; i < data.length; i++) {
								displayMarker(data[i]);
								bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
							}

							// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
							map.setBounds(bounds);
						}
					}

					// 지도에 마커를 표시하는 함수입니다
					function displayMarker(place) {

						// 마커를 생성하고 지도에 표시합니다
						var marker = new kakao.maps.Marker({
							map : map,
							position : new kakao.maps.LatLng(place.y, place.x)
						});

						// 마커에 클릭이벤트를 등록합니다
						kakao.maps.event.addListener(marker, 'click', function() {
							// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
							infowindow.setContent('<div style="padding:5px;font-size:12px;">'
									+ place.place_name + '</div>');
							infowindow.open(map, marker);
						});
					}
					
					setBounds();
				 });
				
			}) // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨. 
			.fail(function(xhr, status, errorThrown) { 
				alert("실패");
			}) //;
/* 	console.log(location.href);
	var temp = location.href.split('?');
	var data = temp[1].split("&");
	var lat_temp = data[0].split("=");
	var lon_temp = data[1].split("=");
	console.log("lat", lat_temp[1]);
	console.log("lon", lon_temp[1]);
	var lat_ar = lat_temp[1].split(",");
	var lon_ar = lon_temp[1].split(",");
 */

</script>
</html>