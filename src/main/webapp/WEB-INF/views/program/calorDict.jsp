<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
	Eventually by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
  <head>
    <title>02H | 칼로리 사전</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <link rel="stylesheet" href="/resources/assets/css/main.css" />
    <link rel="shortcut icon" href="/resources/img/iconLogo.ico" />
    <style>
      #msg {
      	font-size: 20px;
      	margin: 5px;
      }
      .box4 {
        margin-left: 8%;
        font-size: 20px;
        margin-bottom: 3%;
      }
      table, th, td {
        border: 1px solid #bcbcbc;
      }
      table {
        width: 700px;
        height: 200px;
      }
      td {
        text-align: center;
      }
      a { 
      	text-decoration: none;
      	
      }
      #date {
      	background-color: rgba(0,0,0,0);
      	margin-bottom: 30px;
      }
      .flex-container {
		  display: flex;
		}
	.flex-container-cal {
	  display: flex;
	}
		
	.flex-container > div {
	  margin: 10px;
	  padding: 20px;
	  font-size: 30px;
	}
	.flex-container-cal > div {
	  margin: 10px;
	  padding: 20px;
	  font-size: 30px;
	}
	.info {
		border-radius: 6px;
		border: 2px solid rgba(255, 255, 255, 0.35);
		padding: 5px;
		margin-bottom: 5px;
	
	}
	
    </style>
  </head>
  <body class="is-preload">
    <!-- Header -->
    <header id="header">
      <h1><a href="/program/calorDict">칼로리 사전</a></h1>
      <p>
        여러분의 삶에 음식은 어떤 의미를 갖나요?<br />
        칼로리 사전과 함께 건강한 다이어트와 꾸준한 운동을 시작해 보세요.        
        <a href="/">HOME</a>
      </p>
    </header>

    <!-- Signup Form -->
    <form id="signup-form" method="post" action="#">
      <select name="" id="endIdx">
        <option disabled="disabled" selected="selected">목록</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="10">10</option>
      </select>
      <input type="text" id="val1" placeholder="식품군 ex)면류 or 구이류" />
      <input type="text" id="val2" placeholder="식품명 ex)삼양라면 or 삼치구이"/>
      <input type="button" value="확인" id="btn1" />
    </form>
    <br />
    <div id="beforeLogInArea" hidden="hidden">
    <form>
    <input type="date" name ="date" id="date" value="2021-01-01">   	
    	<div class="flex-container">
	    	<select name="time" id="time" style="margin-right:15px;">
		    	<option value="mor" selected="selected">아침</option>
		        <option value="lun">점심</option>
		        <option value="aft">저녁</option>
	    	</select>
	    	
	    	<input type="text" name="cal" id="cal" placeholder="칼로리 입력칸" style="margin-right:15px;"> <!-- 칼로리 입력 칸 and 누르면 입력 되는 칸 -->  	
			<input type="button" value="입력" id="calBtn" style="margin-right:15px;"/>	
			
			<br />
	    	<input type="text" name="mor" id="mor" value="0" style="margin-left: 5px; margin-right: 5px; ">
	    	<input type="text" name="lun" id="lun" value="0" style="margin-left: 5px; margin-right: 5px;">
	    	<input type="text" name="aft" id="aft" value="0" style="margin-left: 5px; margin-right: 5px;">
		</div>
	    	<br />하루 총 칼로리
	    	<input type="text" name="total" id="total" value="0" style="margin-top: 5px;">
	    	 <input type="button" value="저장하기" id="submit" style="margin-top: 10px;" /> 
	    	 <input type="hidden" name="user_id" value="${loginInfo.userId}">
	    	 <p id="result"></p>

	</form>
	<form>
		<div class="flex-container">
			<!-- 결과 -->
		    <div class="modal" tabindex="-1" id="myModal">
		      <div class="modal-dialog">
		      	<div style="font-size: 20px;" class="info">제품명을 클릭 시 칼로리 입력칸에 칼로리가 자동으로 들어갑니다.</div>
		        <div class="modal-content" id="msg"></div>
		      </div>
		    </div>
			<div>
	      		<div class="box4"></div>
	    	</div>
	    </div>
	
	</form>
	</div>
    	<script>
    	var date=document.getElementById("date");
    	var mor=document.getElementById("mor");
    	var lun=document.getElementById("lun");
    	var aft=document.getElementById("aft");
    	var total=document.getElementById("total");
    	var calBtn=document.getElementById("calBtn");
    	var time=document.getElementById("time");
    	var cal=document.getElementById("cal");
    	var submitBtn=document.getElementById("submit")
    	  var want;
  	  	var result=document.getElementById("result");
  	  	var beforeLoginArea=document.getElementById("beforeLogInArea");
  	  	
  	  	if("${loginInfo.userId}"!=""){
  	  	beforeLoginArea.removeAttribute("hidden");
  	  	}
    	
  	  	
  	  	
  	  	
  	  	submitBtn.onclick=function(){
    	
    	
    	var xhr=new XMLHttpRequest();
    	  xhr.onreadystatechange=function(){
    	   
    		 if(xhr.readyState==4){
    	      if(xhr.status==200){
    	        want=xhr.response;
    	        result.innerHTML=want;
    	        //토탈 자리
    	        
    	      }
    	    }
    	  }
    	  console.log("/restCal/insert?date="+date.value+"&cal="+total.value)
    	  xhr.open("get","/restCal/insert?date="+date.value+"&cal="+total.value+"&user_id=${loginInfo.userId}");
    	  xhr.send();

    	}
    	
    	
    	calBtn.onclick=function(){
    		if(time.value=="mor"){
    			mor.value=cal.value;
    		}
    		if(time.value=="lun"){
    			lun.value=cal.value;
    		}
    		if(time.value=="aft"){
    			aft.value=cal.value;
    		}
    		total.value=parseInt(mor.value)+parseInt(lun.value)+parseInt(aft.value);
    	}
    	</script>
    <br />
    <p></p>

    <!-- 결과 -->
    <div class="modal" tabindex="-1" id="myModal">
      <div class="modal-dialog">
        <div class="modal-content" id="msg"></div>
      </div>
    </div>
    <br />
    <br />
    <!-- <div>
      <div class="box3"></div>
    </div> -->
    
    <div style="height: 10px">
    
    </div>
    

    <!-- Scripts -->
    <script src="/resources/assets/js/main.js"></script>
    <script
      src="https://code.jquery.com/jquery-3.5.1.min.js"
      integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
      crossorigin="anonymous"
    ></script>
    <script>
      $(function () {
        //init(); - 날짜 함수 없어서 그렇구나

        $("#btn1").click(function () {
          //제조사+식품명
          //let url = "http://openapi.foodsafetykorea.go.kr/api/13239511b85e435cb61b/I2790/json/1/5/MAKER_NAME=";
          //url += $("#val1").val()+"&DESC_KOR="+$("#val2").val();
          //식품군+식품명
          //let url = "http://openapi.foodsafetykorea.go.kr/api/13239511b85e435cb61b/I2790/json/1/5/GROUP_NAME=";
          //url += $("#val1").val()+"&DESC_KOR="+$("#val2").val();
          //endIndex+식품군+식품명
          let url =
            "http://openapi.foodsafetykorea.go.kr/api/13239511b85e435cb61b/I2790/json/1/";
          url +=
            $("#endIdx").val() +
            "/GROUP_NAME=" +
            $("#val1").val() +
            "&DESC_KOR=" +
            $("#val2").val();

          let str = "";

          $.get({
            url: url,

            success: function (data) {
              console.log(data);

              $(data.I2790.row).each(function (idx, item) {
                //열량
                var servingSize = parseInt(item.SERVING_SIZE);

                //식품코드
                var foodCd = item.FOOD_CD;

                //식품명
                var descKor = item.DESC_KOR; //영진위 cd는 숫자, 이건 문자='' 필수
                //<a href='' onclick="javascript:info(p1012)">;
                /* str += "<a href='#' onclick='javascript:info("+foodCd+")'>"+descKor+"</a><br>"; */ 
                str +=
                  "<a href=\"javascript:info('" +
                  foodCd +
                  "')\">" +
                  descKor +
                  "</a>";
                //열량
                str += " - " + item.SERVING_SIZE + "열량<br>";
                $("#msg").html(str);
              });
            },
          });
        });
      });
      function info(foodCd) {
        //
        var url =
          "http://openapi.foodsafetykorea.go.kr/api/13239511b85e435cb61b/I2790/json/1/5/FOOD_CD=" +
          foodCd;
	var caltemp=document.getElementById("cal");
        $.get({
          url: url,
          success: function (data) {
            console.log(data);

            $(data.I2790.row).each(function (idx, item) {
              //var str = "<ul>";
              var str2 = "<table><thead><tr>";

              //식품이름
              var descKor = item.DESC_KOR;
              //식품유형-식품군
              var groupName = item.GROUP_NAME;
              var groupName = $("#val1").val();
              //열량(kcal)(1회제공량당)
              var nutrCont1 = item.NUTR_CONT1;
            	caltemp.value=item.NUTR_CONT1;
              //탄수화물(g)(1회제공량당)
              var nutrCont2 = item.NUTR_CONT2;
              //단백질(g)(1회제공량당)
              var nutrCont3 = item.NUTR_CONT3;
              //지방(g)(1회제공량당)
              var nutrCont4 = item.NUTR_CONT4;
              //당류(g)(1회제공량당)
              var nutrCont5 = item.NUTR_CONT5;
              //나트륨(mg)(1회제공량당)
              var nutrCont6 = item.NUTR_CONT6;
              //콜레스테롤(mg)(1회제공량당)
              var nutrCont7 = item.NUTR_CONT7;
              //포화지방산(g)(1회제공량당)
              var nutrCont8 = item.NUTR_CONT8;
              //트랜스지방(g)(1회제공량당)
              var nutrCont9 = item.NUTR_CONT9;
              //총내용량
              var servingSize = item.SERVING_SIZE;
              //자료출처
              var subRefName = item.SUB_REF_NAME;
			  
           /* 
              //ul-li 나열형
              str += "<li>식품이름 : " + descKor + "</li>";
              str += "<li>식품유형 : " + groupName + "</li>";
              str += "<li>열량(1회제공량당) : " + nutrCont1 + "</li>";
              str += "<li>탄수화물(g) : " + nutrCont2 + "</li>";
              str += "<li>단백질(g) : " + nutrCont3 + "</li>";
              str += "<li>지방(g) : " + nutrCont4 + "</li>";
              str += "<li>당류(g) : " + nutrCont5 + "</li>";
              str += "<li>나트륨(mg) : " + nutrCont6 + "</li>";
              str += "<li>콜레스테롤(mg) : " + nutrCont7 + "</li>";
              str += "<li>포화지방산(g) : " + nutrCont8 + "</li>";
              str += "<li>트랜스지방(g) : " + nutrCont9 + "</li>";
              str += "<li>트랜스지방(g) : " + servingSize + "</li>";
              str += "<li>자료출처 : " + subRefName + "</li></ul>";
           */
              
              //tr-td 테이블형
              str2 += "<th colspan='2'>식품이름 : " + descKor + "</th></thead>";
              str2 += "<tbody><tr><td>식품유형 : </td><td>" + groupName + "</td></tr>";
              str2 += "<tr><td>열량(1회제공량당) : </td><td>" + nutrCont1 + "</td></tr>";
              str2 += "<tr><td>탄수화물(g) : </td><td>" + nutrCont2 + "</td></tr>";
              str2 += "<tr><td>단백질(g) : </td><td>" + nutrCont3 + "</td></tr>";
              str2 += "<tr><td>지방(g) : </td><td>" + nutrCont4 + "</td></tr>";
              str2 += "<tr><td>당류(g) : </td><td>" + nutrCont5 + "</td></tr>";
              str2 += "<tr><td>나트륨(mg) : </td><td>" + nutrCont6 + "</td></tr>";
              str2 += "<tr><td>콜레스테롤(mg) : </td><td>" + nutrCont7 + "</td></tr>";
              str2 += "<tr><td>포화지방산(g) : </td><td>" + nutrCont8 + "</td></tr>";
              str2 += "<tr><td>트랜스지방(g) : </td><td>" + nutrCont9 + "</td></tr>";
              str2 += "<tr><td>트랜스지방(g) : </td><td>" + servingSize + "</td></tr>";
              str2 += "<tr><td>자료출처 : </td><td>" + subRefName + "</td></tr></tbody></table>";

             //$(".box3").html(str);
              $(".box4").html(str2); //그냥 box3에 추가하면 str2만 적용되는구나
              //모달
              //$(".modal-body").html(str);
              //$("#myModal").modal("show");
            });
          },
        });
      }
    </script>
  </body>
</html>
    