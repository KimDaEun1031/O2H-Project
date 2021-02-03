<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="mystyle.css"> -->
<style type="text/css">
body{
		margin:20px;
	}
	.box1{
		width:400px;
		background-color:green;
		color:white;
		padding:15px;
		text-align: center;
	}
	.box2{
		width:400px;
		display: block;
		margin-top:15px;
		text-align: center;
	}
	#msg{
		border-radius: 5px;
		border: 2px solid #73ad21;
		padding: 10px;
		padding-left: 20px;
		margin-top: 15px;
		width:400px;
		height: 200px;
		font-size:14px;
		text-align: left;
	}

</style>
<link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css" />
</head>
<body>
	<form action="">
		<div class="box1">칼로리 서비스명 : I2790</div>
		<div class="box2">
			<input type="text" id="val1" />
			<input type="text" name="txtYear" id="txtYear" size="6"/>년
			<select name="" id="selMon">
				<option value="01">1월</option>
				<option value="02">2월</option>
				<option value="03">3월</option>
				<option value="04">4월</option>
				<option value="05">5월</option>
				<option value="06">6월</option>
				<option value="07">7월</option>
				<option value="08">8월</option>
				<option value="09">9월</option>
				<option value="10">10월</option>
				<option value="11">11월</option>
				<option value="12">12월</option>
			</select>
			<input type="text" id="val2" />
			<select name="" id="selDay">
				<option value="01">1일</option>
				<option value="02">2일</option>
				<option value="03">3일</option>
				<option value="04">4일</option>
				<option value="05">5일</option>
				<option value="06">6일</option>
				<option value="07">7일</option>
				<option value="08">8일</option>
				<option value="09">9일</option>
				<option value="10">10일</option>
				<option value="11">11일</option>
				<option value="12">12일</option>
				<option value="13">13일</option>
				<option value="14">14일</option>
				<option value="15">15일</option>
				<option value="16">16일</option>
				<option value="17">17일</option>
				<option value="18">18일</option>
				<option value="19">19일</option>
				<option value="20">20일</option>
				<option value="21">21일</option>
				<option value="22">22일</option>
				<option value="23">23일</option>
				<option value="24">24일</option>
				<option value="25">25일</option>
				<option value="26">26일</option>
				<option value="27">27일</option>
				<option value="28">28일</option>
				<option value="20">29일</option>
				<option value="30">30일</option>
				<option value="31">31일</option>
			</select>
			<input type="button" value="확인" id="btn1" />
			<div id="msg"></div><!-- 순위를 보여줄 영역 -->
			<div class="box3"></div>
		</div>	
	</form>
	<div>
	
	==
	
	</div>
	<form action="">
		<div class="box1">칼로리 서비스명 : I0750</div>
		<div class="box2">
			<input type="text" id="val10" />
			<input type="text" name="txtYear" id="txtYear" size="6"/>년
			<select name="" id="selMon">
				<option value="01">1월</option>
				<option value="02">2월</option>
				<option value="03">3월</option>
				<option value="04">4월</option>
				<option value="05">5월</option>
				<option value="06">6월</option>
				<option value="07">7월</option>
				<option value="08">8월</option>
				<option value="09">9월</option>
				<option value="10">10월</option>
				<option value="11">11월</option>
				<option value="12">12월</option>
			</select>
			<input type="text" id="val20" />
			<select name="" id="selDay">
				<option value="01">1일</option>
				<option value="02">2일</option>
				<option value="03">3일</option>
				<option value="04">4일</option>
				<option value="05">5일</option>
				<option value="06">6일</option>
				<option value="07">7일</option>
				<option value="08">8일</option>
				<option value="09">9일</option>
				<option value="10">10일</option>
				<option value="11">11일</option>
				<option value="12">12일</option>
				<option value="13">13일</option>
				<option value="14">14일</option>
				<option value="15">15일</option>
				<option value="16">16일</option>
				<option value="17">17일</option>
				<option value="18">18일</option>
				<option value="19">19일</option>
				<option value="20">20일</option>
				<option value="21">21일</option>
				<option value="22">22일</option>
				<option value="23">23일</option>
				<option value="24">24일</option>
				<option value="25">25일</option>
				<option value="26">26일</option>
				<option value="27">27일</option>
				<option value="28">28일</option>
				<option value="20">29일</option>
				<option value="30">30일</option>
				<option value="31">31일</option>
			</select>
			<input type="button" value="확인" id="btn1" />
			<div id="msg2"></div><!-- 순위를 보여줄 영역 -->
			<div class="box3"></div>
		</div>	
	</form>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!-- <script src="myscript.js"></script> -->
<script>
$(function(){
	init();
	
	$("#btn1").click(function(){
		//제조사+식품명
		//let url = "http://openapi.foodsafetykorea.go.kr/api/13239511b85e435cb61b/I2790/json/1/5/MAKER_NAME=";
		//url += $("#val1").val()+"&DESC_KOR="+$("#val2").val();
		//식품군+식품명
		let url = "http://openapi.foodsafetykorea.go.kr/api/13239511b85e435cb61b/I2790/json/1/5/GROUP_NAME=";
		url += $("#val1").val()+"&DESC_KOR="+$("#val2").val();
		
		let str = "";
		
		$.get({
			url : url,
		
			success:function(data){
				console.log(data);		
				
			$(data.I2790.row).each(function(idx,item) {
	
					//순위
					str += item.RESEARCH_YEAR+" 년도 출시 ";
					//판매년도
					var researchYear = parseInt(item.RESEARCH_YEAR);
					
					
					//식품코드
					var foodCd = item.FOOD_CD;
					
					//식품명
					var descKor = item.DESC_KOR;
					//<a href='' onclick="javascript:info(p1012)">;
					/* str += "<a href='#' onclick='javascript:info("+foodCd+")'>"+descKor+"</a><br>"; */ //영진위 cd는 숫자, 이건 문자='' 필수
					
					str += "<a href=\"javascript:info(\'"+foodCd+"\')\">"+descKor+"</a><br>";
					$("#msg").html(str);

				})

			}			
		})
	})
})
function info(foodCd){
	//
	var url = "http://openapi.foodsafetykorea.go.kr/api/13239511b85e435cb61b/I2790/json/1/5/FOOD_CD="+foodCd;
	
	$.get({
		url : url,
		success:function(data){
			console.log(data);
			
			$(data.I2790.row).each(function(idx,item) {
				
				var str = "<ul>";

				//식품이름
				var descKor = item.DESC_KOR;
				//식품유형-식품군
				//var groupName = item.GROUP_NAME;
				var groupName = $("#val1").val().html(str);
				//열량
				var nutrCont1 = item.NUTR_CONT1;
				//나트륨(mg)(1회제공량당)
				var nutrCont6 = item.NUTR_CONT6;
				//콜레스테롤(mg)(1회제공량당)
				var nutrCont2 = item.NUTR_CONT2;
				var nutrCont3 = item.NUTR_CONT3;
				var nutrCont4 = item.NUTR_CONT4;
				var nutrCont5 = item.NUTR_CONT5;
				var nutrCont7 = item.NUTR_CONT7;
				var nutrCont8 = item.NUTR_CONT8;
				var nutrCont9 = item.NUTR_CONT9;
				//자료출처
				var subRefName = item.SUB_REF_NAME;
				

				str += "<li>식품이름 : "+descKor+"</li>";
				str += "<li>식품유형 : "+groupName+"</li>";
				str += "<li>열량 : "+nutrCont1+"</li>";
				str += "<li>나트륨(mg)(1회제공량당) : "+nutrCont6+"</li>";
				str += "<li>콜레스테롤(mg)(1회제공량당) : "+nutrCont5+"</li></ul>";
				
				$(".box3").html(str);

			})
			
		}
	})
}


function init(){
	//어제 날짜 세팅
	var newDate = new Date();
	var year = newDate.getFullYear();
	var month = newDate.getMonth()+1; // 월은 0부터 시작
	var day = newDate.getDate()-1; //어제날짜 때문에 -1 한 것
	
	$("#txtYear").val(year);
	
	if(month<10){
		month = "0"+month; //option value에서 1~9까지 숫자에 01 이런식으로 붙여 놔서 "0" 쓴거임
	}
	
	if(day<10){
		day="0"+day;
	}
	
	$("#selMon").val(month); // 이거 오류나서 뒤의 날짜도 오류난 거였네
	$("#selDay").val(day);
}

/*      I0750      */

$(function(){
	init();
	
	$("#btn1").click(function(){
		let url = "http://openapi.foodsafetykorea.go.kr/api/13239511b85e435cb61b/I2790/json/1/5/MAKER_NAME=";
		url += $("#val10").val()+"&DESC_KOR="+$("#val20").val();
		
		let str = "";
		
		$.get({
			url : url,
		
			success:function(data){
				console.log(data);		
				
			$(data.I2790.row).each(function(idx,item) {
	
					//순위
					str += item.RESEARCH_YEAR+" 년도 출시 ";
					//판매년도
					var researchYear = parseInt(item.RESEARCH_YEAR);
					
					/* if(researchYear > 0) {
						str = str + "(▲";
					}else if(researchYear < 0) {
						str = str + "(▼";
					}else{
						str = str + "(";
					}
					
					str += researchYear + ")"; */
					
					//식품코드
					var foodCd = item.FOOD_CD;
					
					//식품명
					var descKor = item.DESC_KOR;
					//<a href='' onclick="javascript:info(p1012)">;
					/* str += "<a href='#' onclick='javascript:info("+foodCd+")'>"+descKor+"</a><br>"; */
					
					str += "<a href=\"javascript:info(\'"+foodCd+"\')\">"+descKor+"</a><br>";;
					$("#msg2").html(str);

				})

			}			
		})
	})
})
function info(foodCd){
	//
	var url = "http://openapi.foodsafetykorea.go.kr/api/13239511b85e435cb61b/I2790/json/1/5/FOOD_CD="+foodCd;
	
	$.get({
		url : url,
		success:function(data){
			console.log(data);
			
			$(data.I2790.row).each(function(idx,item) {
				
				var str = "<ul>";

				//식품이름
				var descKor = item.DESC_KOR;
				//식품유형-식품군
				var groupName = item.GROUP_NAME;
				//열량
				var nutrCont1 = item.NUTR_CONT1;
				//나트륨(mg)(1회제공량당)
				var nutrCont6 = item.NUTR_CONT6;
				//콜레스테롤(mg)(1회제공량당)
				var nutrCont5 = item.NUTR_CONT5;

				str += "<li>식품이름 : "+descKor+"</li>";
				str += "<li>식품유형 : "+groupName+"</li>";
				str += "<li>열량 : "+nutrCont1+"</li>";
				str += "<li>나트륨(mg)(1회제공량당) : "+nutrCont6+"</li>";
				str += "<li>콜레스테롤(mg)(1회제공량당) : "+nutrCont5+"</li></ul>";
				
				$(".box3").html(str);

			})
			
		}
	})
}




</script>
</body>
</html>