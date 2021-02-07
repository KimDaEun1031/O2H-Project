<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- 첨부물 css -->
    <link rel="stylesheet" href="/resources/css/user_my.css" />
    

<style type="text/css">
.uploadResult{
	width: 100%;
	background-color: gray; 
}
.uploadResult ul{
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}
.uploadResult ul li{
	list-style: none;
	padding: 10px;
}
.bigPictureWrapper{
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
}
.bigPicture{
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}
.bigPicture img{
	width: 70%;
}


</style>
</head>
<body>
  <!-- recommand 건강용품 Banner Section Begin -->
    <section class="recommand-product one-banner">
        <div class="container-fluid">
            <div class="row">
				<table class="tg">
					<thead>
					  <tr>
					    <th class="tg-0pky">내 정보</th>
					    <th class="tg-0pky"></th>
					  </tr>
					</thead>
					<tbody>
					  <tr>
					    <td class="tg-0pky">아이디</td>
					    <td class="tg-0pky">${loginInfo.userId}</td>
					  </tr>
					  <tr>
					    <td class="tg-0pky">비밀번호</td>
					    <td class="tg-0pky">${loginInfo.password}</td>
					  </tr>
					  <tr>
					    <td class="tg-0pky">이름</td>
					    <td class="tg-0pky">${loginInfo.userName}</td>
					  </tr>
					  <tr>
					    <td class="tg-0pky">휴대전화</td>
					    <td class="tg-0pky">${loginInfo.phoneNumber}</td>
					  </tr>
					  <tr>
					    <td class="tg-0pky">이메일</td>
					    <td class="tg-0pky">${loginInfo.userEmail}</td>
					  </tr>
					  <tr>
					    <td class="tg-0pky">주소</td>
					    <td class="tg-0pky">${loginInfo.address}</td>
					  </tr>
					  <tr>
					    <td class="tg-0pky">생년월일</td>
					    <td class="tg-0pky">${loginInfo.userBirth}</td>
					  </tr>
					  <tr>
					    <td class="tg-0pky">관심사1</td>
					    <td class="tg-0pky"></td>
					  </tr>
					  <tr>
					    <td class="tg-0pky">관심사2</td>
					    <td class="tg-0pky"></td>
					  </tr>
					  <tr>
					    <td class="tg-0pky">관심사3</td>
					    <td class="tg-0pky"></td>
					  </tr>
					  <tr>
					    <td class="tg-0pky">가입일</td>
					    <td class="tg-0pky">${loginInfo.regDate}</td>
					  </tr>
					</tbody>
				</table>
            </div>
        </div>
    </section>
    <!-- Man Banner Section End -->
    
    
<!-- 첨부 파일 보여주기 -->
<div class="bigPictureWrapper">
	<div class="bigPicture"></div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"><i class="fa fas fa-file"></i> Files</div>
			<div class="panel-body">				
				<div class="uploadResult">
					<ul></ul>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 첨부물 보여주기 -->
<script>
	//현재 글 번호 가져오기->read->reply => 결과를 read
	var userIdVal = '${loginInfo.userId}';
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/user_my.js"></script>
</body>
</html>