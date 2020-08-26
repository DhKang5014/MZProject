<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<!-- Dahun -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>










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

<style>
#map {
   width: 1642px;
   height: 500px;
   background-color: lightgray;
   font-size: 100px;
   
}

.imgfile {
   width: 30%;
   height: 100%;
   padding: 5px 5px 5px 5px;
}

#photo {
   /* margin-right: 7px;
   margin-left: 10%; */
}

body {
   /* font-family: Mapo당인리발전소; */
   text-align: center;
}

.search__container {
   width: 430px;
   height: 700px;
   margin: 0 auto;
   padding-top: 32px;
   
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
   background-repeat: no-repeat;
   background-size: 18px 18px;
   background-position: 95% center;
   border-radius: 50px;
   border: 1px solid #575756;
   transition: all 250ms ease-in-out;
   backface-visibility: hidden;
   transform-style: preserve-3d;
}

.submit_input {
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

/* 업로드  */

@-webkit-keyframes loader {
  0% {
    width: 0;
  }
  20% {
    width: 10%;
  }
  25% {
    width: 24%;
  }
  43% {
    width: 41%;
  }
  56% {
    width: 50%;
  }
  66% {
    width: 52%;
  }
  71% {
    width: 60%;
  }
  75% {
    width: 76%;
  }
  94% {
    width: 86%;
  }
  100% {
    width: 100%;
  }
}

@keyframes loader {
  0% {
    width: 0;
  }
  20% {
    width: 10%;
  }
  25% {
    width: 24%;
  }
  43% {
    width: 41%;
  }
  56% {
    width: 50%;
  }
  66% {
    width: 52%;
  }
  71% {
    width: 60%;
  }
  75% {
    width: 76%;
  }
  94% {
    width: 86%;
  }
  100% {
    width: 100%;
  }
}
.progress-bar {
  border-radius: 60px;
  overflow: hidden;
  width: 100%;
}
.progress-bar span {
  display: block;
}

.bar {
  background: rgba(0, 0, 0, 0.075);
}

.progress {
  -webkit-animation: loader 8s ease infinite;
          animation: loader 8s ease infinite;
  background: #75b800;
  color: #fff;
  padding: 5px;
  width: 0;
}

.progress-bar {
  /* left: 50%; */
  max-width: 35%;
  position: absolute;
  -webkit-transform: translate3d(-50%, -50%, 0);
          transform: translate3d(-50%, -50%, 0);
}

#file_button{
   width: 100px;
}

#ptbtn{
   height: 200px;
}


<!-- Dahun -->

#map{
			width:1200px;
			height:700px;
		}
		.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:300px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 40px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
.hidden{
	display:none;
}
.container{
	display:inline-block;
	margin : 40px;
	height: 250px;
	width : 250px;
}


</style>

</head>
<body>
   <%
			
			Object obj = session.getAttribute("photo_all");
			if(obj == null){
				response.sendRedirect("AllGetImagesServiceCon.do");
			}
			String main = (String)obj;
			System.out.println(main);
	%>
   <div style = "font-family: 'Kaushan Script', cursive; font-size: 80px; margin-bottom: 20px; " >My map</div>
   <!-- 지도 표시할 부분  -->
   <div id="main">
		<div class="map_wrap">
 					<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

 					<div id="menu_wrap" class="bg_white">

     				<hr>
    					<ul id="placesList"></ul>
    					<div id="pagination"></div>
   </div>
      <!--    <span style="font-family:">지도가 나오면 됨미다</span> -->
      </div>

   <!-- 사진표시할 부분 -->
   <div style="text-align: center;">
      
   <div id="photo">
      <p style="font-family:'Kaushan Script', cursive; font-size: 50px;">PHOTO LIBRARY<p>사진을 업로드해주세요.</p></p>
   
   </div>
      
      <span >
      <div style="border: 4px dashed #bcbcbc; margin-right: 138px; margin-left: 138px;">
      <div>
      <%=main %>
      </div>
<!--          <img class="imgfile" src="assets_imgServer/images/excited.jpg" style="width: 250px;"> 
         <img class="imgfile" src="assets_imgServer/images/test01.jpg" style="width: 250px;"> 
         <img class="imgfile" src="assets_imgServer/images/test02.jpg" style="width: 250px;">
         <img class="imgfile" src="assets_imgServer/images/test03.jpg" style="width: 250px;">
         <img class="imgfile" src="assets_imgServer/images/excited.jpg" style="width: 250px;"> 
         <img class="imgfile" src="assets_imgServer/images/test01.jpg" style="width: 250px;"> 
         <img class="imgfile" src="assets_imgServer/images/test01.jpg" style="width: 250px;"> 
         <img class="imgfile" src="assets_imgServer/images/test02.jpg" style="width: 250px;">
         <img class="imgfile" src="assets_imgServer/images/test03.jpg" style="width: 250px;">
         <img class="imgfile" src="assets_imgServer/images/test01.jpg" style="width: 250px;"> 
         <img class="imgfile" src="assets_imgServer/images/test02.jpg" style="width: 250px;">
         <img class="imgfile" src="assets_imgServer/images/test03.jpg" style="width: 250px;"> -->
      </div>
      </span>
   </div>

   <!-- 파일 업로드 부분 -->
   <div id="ptbtn" style="margin-top: 50px; background-color: lightgray; padding-top: 60px; height: 400px;">
   <form action="ImgServer_update.do" method="post" enctype="multipart/form-data">
      <div>
      
      
      
         <div style = "display: inline;"><input type="file" name="file" style="display: none"></div>
      
      <table width="50%" align="center" >
      
            <tr>
               <td width="5%">
                  <div class="file_button" style="width: 100px;display:inline;" onclick="oneclick=document.all.file.click()">
                     <img src="assets_imgServer/images/upload.png"style="width: 30px; height: 30px; display: inline;" >
                  </div>               
               </td>
               <td width="40%">
                  <div class="progress-bar" style = "display : inline;">
                     <span class="bar"> <span class="progress"></span></span>
                  </div>               
               </td>
               <td width="5%">
                  <div style="display:inline;">
                     <input class="submit_input" type="submit" value="저장" onclick="cu()">
                  </div>               
               </td>
            </tr>
		
        </table>
   </div>
</form>
   <!-- 버튼/input부분 -->

   
      <div class="search__container" style="width: 100%;">
         
         
         <input class="search__input" type="text" placeholder="검색어" id="keyword" value="조선대 맛집">
         <form onsubmit="searchPlaces(); return false;">
         <input class="submit_input" type="submit" value="검색"> 
         </form>
         <br><br><br>
         <br><br>
         <input class="search__input" type="text" placeholder="사진선택" id="selected_img" name ="selected_img">
         <input class="search__input" type="text" placeholder="위도" name="lat" id="lat"> 
         <input class="search__input" type="text" placeholder="경도" name="lon" id="lon"> 
         <input class="search__input" type="text" placeholder="장소명" name="place_name" id="place_name"> 
		 <!-- DATE, TIME -->
            <input  class="search__input" type="date" value="2020-08-24" name="date" id="date">
            <input class="search__input" type="time" id="time" name="time"> 
         <input class="submit_input" type="submit" value="등록" onclick="place()">
      </div>
   </div>
   
   <!-- Scripts -->
			<script src="assets3/js/jquery.min.js"></script>
			<script src="assets3/js/jquery.poptrox.min.js"></script>
			<script src="assets3/js/browser.min.js"></script>
			<script src="assets3/js/breakpoints.min.js"></script>
			<script src="assets3/js/util.js"></script>
			
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9d9cd0ecb58b9ec853477490747eb58&libraries=services"></script>
   <script>
			function cu(){
				<%
				session.setAttribute("photo_all",null);
				%>
			}
			// 마커를 담을 배열입니다
			var markers = [];

			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 

			// 장소 검색 객체를 생성합니다
			var ps = new kakao.maps.services.Places();  

			// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({zIndex:1});

			// 키워드로 장소를 검색합니다
			searchPlaces();

			// 키워드 검색을 요청하는 함수입니다
			function searchPlaces() {

			    var keyword = document.getElementById('keyword').value;

			    if (!keyword.replace(/^\s+|\s+$/g, '')) {
			        alert('키워드를 입력해주세요!');
			        return false;
			    }

			    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			    ps.keywordSearch( keyword, placesSearchCB); 
			}

			// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
			function placesSearchCB(data, status, pagination) {
			    if (status === kakao.maps.services.Status.OK) {

			        // 정상적으로 검색이 완료됐으면
			        // 검색 목록과 마커를 표출합니다
			        displayPlaces(data);

			        // 페이지 번호를 표출합니다
			        displayPagination(pagination);

			    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

			        alert('검색 결과가 존재하지 않습니다.');
			        return;

			    } else if (status === kakao.maps.services.Status.ERROR) {

			        alert('검색 결과 중 오류가 발생했습니다.');
			        return;

			    }
			}

			// 검색 결과 목록과 마커를 표출하는 함수입니다
			function displayPlaces(places) {

			    var listEl = document.getElementById('placesList'), 
			    menuEl = document.getElementById('menu_wrap'),
			    fragment = document.createDocumentFragment(), 
			    bounds = new kakao.maps.LatLngBounds(), 
			    listStr = '';
			    
			    // 검색 결과 목록에 추가된 항목들을 제거합니다
			    removeAllChildNods(listEl);

			    // 지도에 표시되고 있는 마커를 제거합니다
			    removeMarker();
			    
			    for ( var i=0; i<places.length; i++ ) {

			        // 마커를 생성하고 지도에 표시합니다
			        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
			            marker = addMarker(placePosition, i), 
			            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가합니다
			        bounds.extend(placePosition);

			        // 마커와 검색결과 항목에 mouseover 했을때
			        // 해당 장소에 인포윈도우에 장소명을 표시합니다
			        // mouseout 했을 때는 인포윈도우를 닫습니다
			        (function(marker, title) {
			            kakao.maps.event.addListener(marker, 'mouseover', function() {
			                displayInfowindow(marker, title);
			            });

			            kakao.maps.event.addListener(marker, 'mouseout', function() {
			                infowindow.close();
			            });

			            itemEl.onmouseover =  function () {
			                displayInfowindow(marker, title);
			            };

			            itemEl.onmouseout =  function () {
			                infowindow.close();
			            };
			        })(marker, places[i].place_name);

			        fragment.appendChild(itemEl);
			    }

			    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			    listEl.appendChild(fragment);
			    menuEl.scrollTop = 0;

			    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			    map.setBounds(bounds);
			}

			// 검색결과 항목을 Element로 반환하는 함수입니다
			function getListItem(index, places) {

			    var el = document.createElement('li'),
			    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
			                '<div class="info">' +
			                '   <h5>' + places.place_name + '</h5>';

			    if (places.road_address_name) {
			        itemStr += '    <span>' + places.road_address_name + '</span>' +
			                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
			    } else {
			        itemStr += '    <span>' +  places.address_name  + '</span>'; 
			    }
			                 
			      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
			                '</div>';           

			    el.innerHTML = itemStr;
			    el.className = 'item';

			    return el;
			}

			// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
			function addMarker(position, idx, title) {
			    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
			        imgOptions =  {
			            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
			            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
			        },
			        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
			            marker = new kakao.maps.Marker({
			            position: position, // 마커의 위치
			            image: markerImage 
			        });

			    marker.setMap(map); // 지도 위에 마커를 표출합니다
			    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

			    return marker;
			}

			// 지도 위에 표시되고 있는 마커를 모두 제거합니다
			function removeMarker() {
			    for ( var i = 0; i < markers.length; i++ ) {
			        markers[i].setMap(null);
			    }   
			    markers = [];
			}

			// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
			function displayPagination(pagination) {
			    var paginationEl = document.getElementById('pagination'),
			        fragment = document.createDocumentFragment(),
			        i; 

			    // 기존에 추가된 페이지번호를 삭제합니다
			    while (paginationEl.hasChildNodes()) {
			        paginationEl.removeChild (paginationEl.lastChild);
			    }

			    for (i=1; i<=pagination.last; i++) {
			        var el = document.createElement('a');
			        el.href = "#";
			        el.innerHTML = i;

			        if (i===pagination.current) {
			            el.className = 'on';
			        } else {
			            el.onclick = (function(i) {
			                return function() {
			                    pagination.gotoPage(i);
			                }
			            })(i);
			        }

			        fragment.appendChild(el);
			    }
			    paginationEl.appendChild(fragment);
			}
			
			var maker;
		       // 지도에 클릭 이벤트를 등록합니다
			// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
			    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        

			    // 클릭한 위도, 경도 정보를 가져옵니다 
			    var latlng = mouseEvent.latLng;
			    
			    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
			    message += '경도는 ' + latlng.getLng() + ' 입니다';
			  	console.log(message);

			  	document.getElementById('lat').value = latlng.getLat();
			  	document.getElementById('lon').value = latlng.getLng();

			    
			});
			// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
			// 인포윈도우에 장소명을 표시합니다
			function displayInfowindow(marker, title) {
			    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

			    infowindow.setContent(content);
			    infowindow.open(map, marker);
			}

			 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
			function removeAllChildNods(el) {   
			    while (el.hasChildNodes()) {
			        el.removeChild (el.lastChild);
			    }
			}
			 function imgclick(k){
					var co  = document.getElementById(k).innerText;
		            console.log(co);
		            document.getElementById("selected_img").value = co;
		            
			 }
			 
		

			function place(){ 
				var file_name = document.getElementById("selected_img").value;
				 var lat = document.getElementById("lat").value;
				 var lon = document.getElementById("lon").value;
				 var place_name = document.getElementById("place_name").value;
				 var date = $('#date').val();
				 var time = $('#time').val();
				 console.log("date >> " + date);
				 console.log("time >> " + time);
				 console.log("place_name >> " + place_name);
				console.log("place() function");
				console.log("date + time >> " + date +" "+ time);
				var date_time = date + " " + time;
				
				$.ajax({  
				type: "POST" 
				,url: "/MZ/UserPlaceResisterServiceCon.do"
				,data: {file_name:file_name,lat:lat,lon:lon,place_name:place_name,date_time:date_time}
				//,success:function(data){
				//	alert("성공");
				//}
				//,error:function(data){
				//	alert("error");
				//}
				});
			}

   </script>
</body>
</html>