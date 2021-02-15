<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/user_header.jsp" %>
       <!-- 첨부물 css -->
    <link rel="stylesheet" href="/resources/css/user_my.css" />
    <link href="https://fonts.googleapis.com/css2?family=Epilogue:wght@500&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/c92986acdf.js" crossorigin="anonymous"></script>
    <style>
    	.chartContainer {
    		display: flex;   	
    	}
    	#myChart {
    		margin-left: 25%;
    	}
    
    </style>

     <!-- recommand 건강용품 Banner Section Begin -->
    <div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
					<table>
					<thead>
					  <tr class="table100-head">
					    <th class="column3" rowspan="8"><img id="myImg" class="profile-img" src="/resources/img/profile/fiturjc_default_user.jpg" alt="Profile Image"  style='object-fit:contain' /></th>
					    <th class="column1">아이디</th>
					    <th class="column2">${loginInfo.userId}</th>
					  </tr>
					  <tr>
					    <td class="column1">이름</td>
					    <td class="column2">${loginInfo.userName}</td>
					  </tr>
					  <tr>
					    <td class="column1">휴대전화</td>
					    <td class="column2">${loginInfo.phoneNumber}</td>
					  </tr>
					  <tr>
					    <td class="column1">이메일</td>
					    <td class="column2">${loginInfo.userEmail}</td>
					  </tr>
					  <tr>
					    <td class="column1">주소</td>
					    <td class="column2">${loginInfo.address}</td>
					  </tr>
					  <tr>
					    <td class="column1">생년월일</td>
					    <td class="column2">${loginInfo.userBirth}</td>
					  </tr>
					  <tr>
					    <td class="column1">관심사</td>
					    <td class="column2"></td>
					  </tr>
					  <tr>
					    <td class="column1">가입일</td>
					    <td class="column2"><fmt:formatDate value="${loginInfo.regDate}" pattern="yyyy-MM-dd" /></td>
					  </tr>
					</thead>
					</table>
 				</div>
			</div>
		</div>
	</div>
	<div>
		<p style="text-align: center; font-size: 20px; font-weight: bold;"> 프로필 이미지는 회원정보수정에서 하실 수 있습니다. </p>
	</div>
	<br />
	<h4 style="text-align: center; opacity: 0.5;">---------------------------------------------------------------------------------------------------------------------</h4>
	<br /><br /><br />
	<div class="col-lg-12">
       <div class="section-title">
           <h2>운동/식단 차트</h2>           
       </div>
    </div>
	
	<!-- 차트 부분 -->
	<div class="chartContainer" style="width: 1000px">
      <canvas id="myChart"> </canvas>
    </div>
    
    
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script>
		var temp=new Array();
		
		var tempArr = ${list};
		var tempBrr=${list2};
		console.log(tempArr);
		
		
	<% 
		// List<YHCalVO> list=(List<YHCalVO>)request.getAttribute("list");
		//int size=list.size();
		//for(int i=0;i<31;i++){
		//	if(i<size){
		//		YHCalVO vo=list.get(i);
		//		int tempCal=vo.getCal();
		//		out.print(tempCal);
		//	}		
	%>
	
	<%
		//}
	%>
	  var chart;
      var num1 = 10;
      var num2 = 0;
      var num3 = 0;
      var num4 = 0;
      var num5 = 0;
      var num6 = 0;
      var num7 = 0;
      var num8 = 0;
      var num9 = 0;
      var num10 = 0;
      var num11 = 0;
      var num12 = 0;
      var num13 = 0;
      var num14 = 0;
      var num15 = 0;
      var num16 = 20;
      var num17 = 10;
      var num18 = 20;
      var num19 = 20;
      var num20 = 30;
      var num21 = 0;
      var num22 = 0;
      var num23 = 0;
      var num24 = 0;
      var num25 = 0;
      var num26 = 0;
      var num27 = 0;
      var num28 = 0;
      var num29 = 0;
      var num30 = 0;
      var num31 = 0;

      var rnum1 = 0;
      var rnum2 = 0;
      var rnum3 = 0;
      var rnum4 = 0;
      var rnum5 = 0;
      var rnum6 = 10;
      var rnum7 = 10;
      var rnum8 = 30;
      var rnum9 = 20;
      var rnum10 = 20;
      var rnum11 = 40;
      var rnum12 = 30;
      var rnum13 = 10;
      var rnum14 = 20;
      var rnum15 = 10;
      var rnum16 = 10;
      var rnum17 = 20;
      var rnum18 = 0;
      var rnum19 = 0;
      var rnum20 = 0;
      var rnum21 = 0;
      var rnum22 = 0;
      var rnum23 = 0;
      var rnum24 = 0;
      var rnum25 = 0;
      var rnum26 = 0;
      var rnum27 = 0;
      var rnum28 = 0;
      var rnum29 = 0;
      var rnum30 = 0;
      var rnum31 = 0;

      var rn1 = document.getElementById("num1");
      var rn2 = document.getElementById("num2");
      var n3 = document.getElementById("num3");
      var n4 = document.getElementById("num4");
      var calorie = [
    	
        num1,
        num2,
        num3,
        num4,
        num5,
        num6,
        num7,
        num8,
        num9,
        num10,
        num11,
        num12,
        num13,
        num14,
        num15,
        num16,
        num17,
        num18,
        num19,
        num20,
        num21,
        num22,
        num23,
        num24,
        num25,
        num26,
        num27,
        num28,
        num29,
        num30,
        num31,
      ];
      var runtime = [
       
    	rnum1,
        rnum2,
        rnum3,
        rnum4,
        rnum5,
        rnum6,
        rnum7,
        rnum8,
        rnum9,
        rnum10,
        rnum11,
        rnum12,
        rnum13,
        rnum14,
        rnum15,
        rnum16,
        rnum17,
        rnum18,
        rnum19,
        rnum20,
        rnum21,
        rnum22,
        rnum23,
        rnum24,
        rnum25,
        rnum26,
        rnum27,
        rnum28,
        rnum29,
        rnum30,
        rnum31,
      ];

      window.onload = good;
      function good() {
        var canva = document.getElementById("myChart");
        var ctx = canva.getContext("2d");
        var btn = document.getElementById("btn");

        chart = new Chart(ctx, {
          type: "line",
          data: {
            labels: [
              "0일",
              "1일",
              "2일",
              "3일",
              "4일",
              "5일",
              "6일",
              "7일",
              "8일",
              "9일",
              "10일",
              "11일",
              "12일",
              "13일",
              "14일",
              "15일",
              "16일",
              "17일",
              "18일",
              "19일",
              "20일",
              "21일",
              "22일",
              "23일",
              "24일",
              "25일",
              "26일",
              "27일",
              "28일",
              "29일",
              "30일",
              "31일",
            ],
            datasets: [
              {
                label: "월간 칼로리 섭취량",
                backgroundColor: "rgba(255,99,132,0.6)",
                borderColor: "rgba(243,99,132,0.5)",
                data: tempArr,
              },
              {
                label: "월간 달리기 시간",
                backgroundColor: "rgba(51,51,255,0.5)",
                borderColor: "rgba(51,51,244,0.5)",
                data: tempBrr,
              },
            ],
          },
          option: {},
        });
      }
    </script>
    <br /><br />
	
          
    
    
    
	<!-- 첨부 파일 보여주기 -->
	<div class="bigPictureWrapper">
		<div class="bigPicture"></div>
	</div>
	
	<!-- 첨부물 보여주기 -->
	
<script>
	//현재 글 번호 가져오기
	var userIdVal = '${loginInfo.userId}';
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/user_my.js"></script>
<%@include file="../includes/footer.jsp" %>