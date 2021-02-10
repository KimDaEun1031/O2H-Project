<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/user_header.jsp" %>
       <!-- 첨부물 css -->
    <link rel="stylesheet" href="/resources/css/user_my.css" />
    <link href="https://fonts.googleapis.com/css2?family=Epilogue:wght@500&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/c92986acdf.js" crossorigin="anonymous"></script>
    <script src="/resources/js/calendar.js" defer></script>
    
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
	
	
          
    <!-- 차트 부분 -->
    
    
	<!-- 첨부 파일 보여주기 -->
	<div class="bigPictureWrapper">
		<div class="bigPicture"></div>
	</div>
	
	<!-- 첨부물 보여주기 -->
	
<script>
	//현재 글 번호 가져오기->read->reply => 결과를 read
	var userIdVal = '${loginInfo.userId}';
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/user_my.js"></script>
<%@include file="../includes/user_footer.jsp" %>