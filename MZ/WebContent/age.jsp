<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

var cat = "";
var name = "";
function doChange(srcE, targetId){
    var val = srcE.options[srcE.selectedIndex].value;
    var targetE = document.getElementById(targetId);
    cat = val;
    
    removeAll(targetE);

    if(val == 'tour'){
        addOption('양림동펭귄마을', targetE);
        addOption('국립아시아문화전당', targetE);
        addOption('김대중컨벤션센터', targetE);
        addOption('우치공원동물원', targetE);
        addOption('광주_기아챔피언스필드', targetE);
        
    }
    else if(val == 'museum'){
        addOption('광주김치타운', targetE);
        addOption('국립광주박물관', targetE);
        addOption('광주비엔날레', targetE);
        addOption('광주광역시립미술관', targetE);
        addOption('남도향토음식박물관·호남문화자료전시관', targetE);
        addOption('국립광주과학관', targetE);
        addOption('우제길미술관청춘발산마을', targetE);
    }
    else if(val == 'market'){
        addOption('동명동카페골목', targetE);
        addOption('광주양동시장', targetE);
        addOption('남광주시장', targetE);
        addOption('송정역시장1913', targetE);
        addOption('광주대인시장', targetE);
        addOption('서방시장', targetE);
    }
    else if(val == 'old'){
        
        addOption('기념공원518', targetE);
        addOption('장고분', targetE);
        addOption('화담사', targetE);
        addOption('만귀정', targetE);
        addOption('풍영정', targetE);
        addOption('두암사', targetE);
        addOption('오웬기념각', targetE);
        addOption('월봉서원', targetE);
        addOption('국립518민주묘지', targetE);
        addOption('금곡동제철유적', targetE);
        addOption('오지호가', targetE);
        addOption('무진고성지', targetE);
        addOption('용진정사', targetE);
        addOption('포충사', targetE);
        addOption('충장사', targetE);
        addOption('호가정', targetE);

    }
    else if(val == 'nature'){
        addOption('무등산국립공원', targetE);
        addOption('쌍암공원', targetE);
        addOption('매월호수공원(전평제근린공원)', targetE);
        addOption('풍암호수공원', targetE);
        addOption('광주공원', targetE);
        addOption('무등산지산유원지', targetE);
        addOption('광주호 호수생태원', targetE);
        addOption('사직공원', targetE);
        addOption('송산유원지', targetE);
        addOption('청풍쉼터', targetE);
    }
}

function doCh(srcE, targetId){
    var val = srcE.options[srcE.selectedIndex].value;
    name = val;
}


function addOption(value, e){
    var o = new Option(value);
    try{
        e.add(o);
    }catch(ee){
        e.add(o, null);
    }
}

function removeAll(e){
    for(var i = 0, limit = e.options.length; i < limit - 1; ++i){
        e.remove(1);
    }
}

function search(){
	
	console.log(cat);
	console.log(name);

	$('#img').attr('src','mimg/'+name+'.png');
	$('#img').css('width','500px');
	$('#img').css('height','500px');
}

</script>

<style>
body {
	background-color: #FBF8EF;
}

p.typing-txt {
  display: none;
  margin-top: 100px;
}

.typing {
  /*       position: absolute;*/
  
  animation-name: cursor;
  animation-duration: 0.3s;
  animation-iteration-count: infinite;
  border-right: 1px solid #ccc;
  font-size: 30px;
  font-weight :bold;
  text-align: center;
  font-family: 마포당인리발전소;
}

@keyframes cursor {
  0% {
    border-right: 1px solid #fff;
  }
  50% {
    border-right: 1px solid #000;
  }
  100% {
    border-right: 1px solid #fff;
  }
}

select {
	width: 200px;
	padding: .8em .5em;
	border: 1px solid #999;
	font-family: inherit;
	border-radius: 50px;
}

input{
	width: 80px;
	padding: .8em .5em;
	border: 1px solid #999;
	font-family: inherit;
	border-radius: 50px;
}
}

</style>
	


</head>



<body>

<script>
		/* 타이틀 애니메이션 */
	$(window).ready(function() {
		  var typingBool = false;
		  var typingIdx = 0;
		  var typingTxt = $(".typing-txt").text(); // 타이핑될 텍스트를 가져온다
		  typingTxt = typingTxt.split(""); // 한글자씩 자른다.
		  if (typingBool == false) {
		    // 타이핑이 진행되지 않았다면
		    typingBool = true;

		    var tyInt = setInterval(typing, 100); // 반복동작
		  }

		  function typing() {
		    if (typingIdx < typingTxt.length) {
		      // 타이핑될 텍스트 길이만큼 반복
		      $(".typing").append(typingTxt[typingIdx]); // 한글자씩 이어준다.
		      typingIdx++;
		    } else {
		      clearInterval(tyInt); //끝나면 반복종료
		    }
		  }
		});

	</script>

	<p class="typing-txt">연령대별 방문객 추이 보기</p>
	<p class="typing"></p>
	<br><br><br>
	<div style="text-align: center;">
	<!--<form action="http://127.0.0.1:9000/age/graph" method="get">-->
    <select name="selOne" id="selOne" onchange="doChange(this, 'selTwo')">
        <option value="default">---선택하세요---</option>
        <option value="tour">관광명소</option>
        <option value="museum">박물관</option>
        <option value="market">시장</option>
        <option value="old">유적지</option>
        <option value="nature">자연</option>
    </select>
    <select name="selTwo" id="selTwo" onchange="doCh(this, 'selTwo')">
        <option value="default">---선택하세요---</option>
    </select>
    <input type = "submit" value = "확인" onclick='search()'><br>
    <br><br>
  	<div>
    	<img src="" id="img" ></img><br>
  	
  	</div>
	<!-- 	<img src="광주공원.png"></img> -->
	</div>


</body>
</html>