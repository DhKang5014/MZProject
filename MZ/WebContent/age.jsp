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
        addOption('�縲����ϸ���', targetE);
        addOption('�����ƽþƹ�ȭ����', targetE);
        addOption('����������Ǽ���', targetE);
        addOption('��ġ����������', targetE);
        addOption('����_���è�Ǿ��ʵ�', targetE);
        
    }
    else if(val == 'museum'){
        addOption('���ֱ�ġŸ��', targetE);
        addOption('�������ֹڹ���', targetE);
        addOption('���ֺ񿣳���', targetE);
        addOption('���ֱ����ø��̼���', targetE);
        addOption('�����������Ĺڹ�����ȣ����ȭ�ڷ����ð�', targetE);
        addOption('�������ְ��а�', targetE);
        addOption('������̼���û��߻긶��', targetE);
    }
    else if(val == 'market'){
        addOption('����ī����', targetE);
        addOption('���־絿����', targetE);
        addOption('�����ֽ���', targetE);
        addOption('����������1913', targetE);
        addOption('���ִ��ν���', targetE);
        addOption('�������', targetE);
    }
    else if(val == 'old'){
        
        addOption('������518', targetE);
        addOption('����', targetE);
        addOption('ȭ���', targetE);
        addOption('������', targetE);
        addOption('ǳ����', targetE);
        addOption('�ξϻ�', targetE);
        addOption('������䰢', targetE);
        addOption('��������', targetE);
        addOption('����518���ֹ���', targetE);
        addOption('�ݰ��ö����', targetE);
        addOption('����ȣ��', targetE);
        addOption('��������', targetE);
        addOption('��������', targetE);
        addOption('�����', targetE);
        addOption('�����', targetE);
        addOption('ȣ����', targetE);

    }
    else if(val == 'nature'){
        addOption('����걹������', targetE);
        addOption('�־ϰ���', targetE);
        addOption('�ſ�ȣ������(�������ٸ�����)', targetE);
        addOption('ǳ��ȣ������', targetE);
        addOption('���ְ���', targetE);
        addOption('���������������', targetE);
        addOption('����ȣ ȣ�����¿�', targetE);
        addOption('��������', targetE);
        addOption('�ۻ�������', targetE);
        addOption('ûǳ����', targetE);
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
  font-family: �������θ�������;
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
		/* Ÿ��Ʋ �ִϸ��̼� */
	$(window).ready(function() {
		  var typingBool = false;
		  var typingIdx = 0;
		  var typingTxt = $(".typing-txt").text(); // Ÿ���ε� �ؽ�Ʈ�� �����´�
		  typingTxt = typingTxt.split(""); // �ѱ��ھ� �ڸ���.
		  if (typingBool == false) {
		    // Ÿ������ ������� �ʾҴٸ�
		    typingBool = true;

		    var tyInt = setInterval(typing, 100); // �ݺ�����
		  }

		  function typing() {
		    if (typingIdx < typingTxt.length) {
		      // Ÿ���ε� �ؽ�Ʈ ���̸�ŭ �ݺ�
		      $(".typing").append(typingTxt[typingIdx]); // �ѱ��ھ� �̾��ش�.
		      typingIdx++;
		    } else {
		      clearInterval(tyInt); //������ �ݺ�����
		    }
		  }
		});

	</script>

	<p class="typing-txt">���ɴ뺰 �湮�� ���� ����</p>
	<p class="typing"></p>
	<br><br><br>
	<div style="text-align: center;">
	<!--<form action="http://127.0.0.1:9000/age/graph" method="get">-->
    <select name="selOne" id="selOne" onchange="doChange(this, 'selTwo')">
        <option value="default">---�����ϼ���---</option>
        <option value="tour">�������</option>
        <option value="museum">�ڹ���</option>
        <option value="market">����</option>
        <option value="old">������</option>
        <option value="nature">�ڿ�</option>
    </select>
    <select name="selTwo" id="selTwo" onchange="doCh(this, 'selTwo')">
        <option value="default">---�����ϼ���---</option>
    </select>
    <input type = "submit" value = "Ȯ��" onclick='search()'><br>
    <br><br>
  	<div>
    	<img src="" id="img" ></img><br>
  	
  	</div>
	<!-- 	<img src="���ְ���.png"></img> -->
	</div>


</body>
</html>