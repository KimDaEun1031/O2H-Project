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
</head>
<body>
	<form action="">
		<div class="box1">일별 박스 오피스</div>
		<div class="box2">
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!-- <script src="myscript.js"></script> -->
<script>
$(function(){
	init();
	
	$("#btn1").click(function(){
		let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=";
		url += $("#txtYear").val()+$("#selMon").val()+$("#selDay").val();
		
		let str = "";
		
		$.get({
			url : url,
		
			success:function(data){
				console.log(data);		
				
			$(data.boxOfficeResult.dailyBoxOfficeList).each(function(idx,item) {
	
					//순위
					str += item.rank+" 위";
					//증감
					var rankInten = parseInt(item.rankInten);
					
					if(rankInten > 0) {
						str = str + "(▲";
					}else if(rankInten < 0) {
						str = str + "(▼";
					}else{
						str = str + "(";
					}
					
					str += rankInten + ")";
					
					//영화코드
					var movieCd = item.movieCd;
					
					//영화명
					var movieNm = item.movieNm+"<br>";
					str += "<a href='#' onclick='javascript:info("+movieCd+")'>"+movieNm+"</a>";
					
					$("#msg").html(str);

				})

			}			
		})
	})
})
function info(movieCd){
	//영화 상세 정보 요청
	var url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f5eef3421c602c6cb7ea224104795888&movieCd="+movieCd;
	
	$.get({
		url : url,
		success:function(data){
			console.log(data);
			
			let movieInfo = data.movieInfoResult.movieInfo;
			
			
			
			var str = "<ul>";

			//한글제목
			var movieNm = movieInfo.movieNm;
			//영어제목
			var movieNmEn = movieInfo.movieNmEn;
			//상영시간
			var showTm = movieInfo.showTm;
			//감독
			var peopleNm = movieInfo.directors[0].peopleNm;					
			
			//출연배우
/*			var actors = "";
				$(data).find("actor").each(function(){
					actors += $(this).find("peopleNm").text();					
			})	*/
			
			var length = movieInfo.actors.length;
			
			var actors = "";
				$(movieInfo.actors).each(function(idx,item){ //for(i in 배열)
					if(idx == length-1) {
						actors += item.peopleNm;	
					}else{
						actors += item.peopleNm+", ";	
						
					}									
			})		
			
			str += "<li>영화제목 : "+movieNm+"</li>";
			str += "<li>영어제목 : "+movieNmEn+"</li>";
			str += "<li>상영시간 : "+showTm+"</li>";
			str += "<li>감독 : "+peopleNm+"</li>";
			str += "<li>출연배우 : "+actors+"</li></ul>";
			
			$(".box3").html(str);
			
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
</script>
</body>
</html>