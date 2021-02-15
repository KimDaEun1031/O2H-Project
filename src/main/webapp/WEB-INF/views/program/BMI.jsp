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
    <title>02H | BMI 계산기</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
	<link rel="stylesheet" href="/resources/assets/css/main.css" />
	<link rel="shortcut icon" href="/resources/img/iconLogo.ico" />
	<style type="text/css">
	 table, th, td {
        border: 1px solid #bcbcbc;
        font-size: 20px;
      }
      table {
        width: 500px;
        height: 200px;
      }
      td {
        text-align: center;
      }
	.age, .cm, .kg {
		margin: 10px;
	}
  .flex-container {
	  display: flex;
	}	
	.flex-container > div {
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
      <h1><a href="">BMI</a></h1>
      <p>
        나의 BMI 지수 확인   
        <a href="/">&nbsp;HOME</a>
      </p>
    </header>

	<form action="" id="signup-form">
		<div class="flex-container">
			<p style="margin-top: 8px;">나이&nbsp;&nbsp;</p> <input type="text" placeholder="ex) 20"  id="age" style="margin-right: 8px;" maxlength='3'/>
			<p style="margin-top: 8px;">키&nbsp;&nbsp;</p> <input type="text" placeholder="ex) 167"  id="cm" style="margin-right: 8px;" maxlength='3'/>			
			<p style="margin-top: 8px;">몸무게&nbsp;&nbsp;</p> <input type="text" placeholder="ex) 56" id="kg" style="margin-right: 8px;" maxlength='3'/>
		</div>
	</form>
	<div>
		<p>비만도 측정(BMI)는 나이,신장(cm),체중(kg) 만으로 비만을 판정하는 비만 지수입니다.</p>
	</div>
	<button style="margin-right: 90%">확인</button>
	
	<div class="flex-container" id="bmi">
		<div>
			<input type="text"  id="total" style="margin-right: 90%; margin-top: 60px; text-align: center;"  readonly/>			
		</div>
		<div>
			<table class="tg">
				<thead>
				  <tr>
				    <th class="tg-c3ow">분류</th>
				    <th class="tg-c3ow">아시아 기준</th>
				  </tr>
				</thead>
				<tbody>
				  <tr>
				    <td class="tg-c3ow">저체중</td>
				    <td class="tg-c3ow">&lt; 18.5</td>
				  </tr>
				  <tr>
				    <td class="tg-c3ow">정상</td>
				    <td class="tg-c3ow">18.5 ~ 22.9</td>
				  </tr>
				  <tr>
				    <td class="tg-baqh">과체중</td>
				    <td class="tg-baqh">23.0 이상</td>
				  </tr>
				  <tr>
				    <td class="tg-baqh">위험체중</td>
				    <td class="tg-baqh">23.0 ~ 24.9</td>
				  </tr>
				  <tr>
				    <td class="tg-baqh">1단계 비만</td>
				    <td class="tg-baqh">25.0 ~ 29.9</td>
				  </tr>
				  <tr>
				    <td class="tg-baqh">2단계 비만</td>
				    <td class="tg-baqh">30.0 ~ 34.9</td>
				  </tr>
				  <tr>
				    <td class="tg-baqh">고도비만</td>
				    <td class="tg-baqh">35.0 이상</td>
				  </tr>
				</tbody>
			</table>
		</div>		
	</div>
	<script src="/resources/assets/js/main.js"></script>
	<script
	  src="https://code.jquery.com/jquery-3.5.1.min.js"
      integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
      crossorigin="anonymous"
    ></script>
    <script>
		$("#bmi").hide();
		$('button').click(function(){
			$("#bmi").show();
			var age = $('#age').val();
			console.log(age);
			var cm = $('#cm').val();
			console.log(cm);
			var kg = $('#kg').val();
			console.log(kg);
			var totalBMI;
			
			cm=cm*0.01;
			totalBMI = kg/(cm*cm);			
			console.log(parseInt(totalBMI));
			total.value=""+parseInt(totalBMI);
				
		});
		
    </script>
  </body>
</html>
    