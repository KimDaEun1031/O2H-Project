<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zxx">
  <head>
    <meta charset="UTF-8" />
    <meta name="description" content="Fashi Template" />
    <meta name="keywords" content="Fashi, unica, creative, html" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Fashi | Template</title>

    <!-- Google Font -->
    <link
      href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap"
      rel="stylesheet"
    />

    <!-- Css Styles -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css" />
    <link rel="stylesheet" href="/resources/css/themify-icons.css" type="text/css" />
    <link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css" />
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css" />
    <link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css" />
    <link rel="stylesheet" href="/resources/css/jquery-ui.min.css" type="text/css" />
    <link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css" />
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css" />
    <!-- 첨부물 css -->
    <link rel="stylesheet" href="/resources/css/user_my.css" />
    
    <style type="text/css">
    	* {
		  margin: 0px;
		  padding: 0px;
		  box-sizing: border-box;
		}
		body,
		html {
		  height: 100%;
		  font-family: sans-serif;
		}
		
		.limiter {
		  width: 100%;
		  margin: 0 auto;
		  color: white;
		}
		
		.container-table100 {
		  width: 100%;
		  min-height: 100px;
		  background: #ffffff;
		  display: -webkit-box;
		  display: -webkit-flex;
		  display: -moz-box;
		  display: -ms-flexbox;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		  flex-wrap: wrap;
		  padding: 33px 30px;
		}
		
		.wrap-table100 {
		  width: 1170px;
		}
		
		table {
		  border-spacing: 1;
		  border-collapse: separate;
		  background: white;
		  border-radius: 40px;
		  overflow: hidden;
		  width: 100%;
		  margin: 0 auto;
		  position: relative;
		}
		table * {
		  position: relative;
		}
		table td,
		table th {
		  padding-left: 8px;
		}
		table thead tr {
		  height: 60px;
		  background: #e7ab3c;
		}
		table tbody tr {
		  height: 50px;
		}
		table tbody tr:last-child {
		  border: 0;
		}
		table td,
		table th {
		  text-align: center;
		}
		
		.table100-head th {
		  font-family: OpenSans-Regular;
		  color: #fff;
		  line-height: 1.2;
		  font-weight: unset;
		  font-weight: bold;
		}
		
		tbody tr:nth-child(even) {
		  background-color: #f5f5f5;
		}
		
		tbody tr {
		  font-family: OpenSans-Regular;
		  font-size: 15px;
		  color: #808080;
		  line-height: 1.2;
		  font-weight: unset;
		}
		
		.column1 {
		  width: 260px;
		  font-size: 23px;
		  font-weight: bold;
		}
		
		.column2 {
		  width: 260px;
		  font-weight: bold;
		  font-size: 20px;
		}
		
		.column3 {
		  width: 200px;
		  padding: 10px;
		}
		.profile-img {
		  height: 300px;
		}
		

		
	</style>
  </head>

  <!-- 로그인/회원가입 메뉴 추가 -->
  <link rel="shortcut icon" href="/resources/img/iconLogo.ico" />

  <!-- Bootstrap core CSS -->
  <!-- <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
  <!-- Custom fonts for this template -->
  <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
    rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
    rel='stylesheet' type='text/css'>
  <!-- Plugin CSS -->
  <link href="/resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="/resources/css/creative.css" rel="stylesheet">


      <body id="page-top">
        <!-- Navigation  class="nav-link js-scroll-trigger"-->
        <nav class="navbar navbar-expand-lg navbar-light afixed-top" id="mainNav"><!-- fixed-top 수정해서 스크롤 제거 -->
          <div class="container">
        <!--     <a class="anavbar-brand js-scroll-trigger" href="/">HOME</a> -->
          <!--   <script type="text/javascript">
              document.getElementById("img-logo").onclick = function () {
                location.href = "index.html";
              }; -->
            </script>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive"
              aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
      
            <!-- Navigation -->
      
            <div class="collapse navbar-collapse" id="navbarResponsive">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                  <a class="nav-link js-scroll-trigger" href="#activities">Activities</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link js-scroll-trigger" href="#services">Professionals</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link js-scroll-trigger" href="#">Facilities</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link js-scroll-trigger" href="/user/teacher_my">마이페이지(임시)</a>
                </li>
      
               <li class="nav-item">
               		<a class="btn btn-success btn-lg" id="login" href="/register/login" hidden="hidden" role="button">로그인</a>
                	<a class="btn btn-primary btn-lg" id="signin" href="/register/signup" hidden="hidden" role="button">회원가입</a>                 
                	<a class="btn btn-success btn-lg" id="profile" href="/user/user_my" hidden="hidden" role="button">내 정보</a>
                	<a class="btn btn-primary btn-lg" id="logout" href="/register/logout" hidden="hidden" role="button">로그 아웃</a>                 
                </li>
              </ul>
            </div>
          </div>
        </nav>

<script>
	//	window.onload =function(){
			var loginInfo = '${loginInfo.userId}';
			
			var login=document.getElementById("login");
			var signin=document.getElementById("signin");
			var logout=document.getElementById("logout");
			var profile=document.getElementById("profile");
			if(loginInfo !=''){
				logout.removeAttribute("hidden");
				profile.removeAttribute("hidden");
				
			}else{
				
				login.removeAttribute("hidden");
				signin.removeAttribute("hidden");
				
			}
			
//		}
	
	
	</script>
        
      <!-- 추가 부분 -->


      <div class="container">
        <div class="inner-header">
          <div class="row">
            <div class="col-lg-2 col-md-2">
              <div class="logo">
                <a href="/">
                  <img src="/resources/img/logo.png" alt="" />
                </a>
              </div>
            </div>
            <div class="col-lg-7 col-md-7">
              <div class="advanced-search">
                <button type="button" class="category-btn">
                  전체 카테고리
                </button>
                <div class="input-group">
                  <input type="text" placeholder="무엇이 필요하신가요?" />
                  <button type="button"><i class="ti-search"></i></button>
                </div>
              </div>
            </div> 
          </div>
        </div>
      </div>
     <div class="nav-item">
            <div class="container">              
                <nav class="nav-menu mobile-menu">
                    <ul>
                    	<li class="active"><a href="/">홈</a></li>
                        <li><a href="/user/user_my">내 정보</a></li>                       
                        <li><a href="/user/user_QnA">문의 내역</a></li>
                        <li><a href="#">보관함</a></li>
                        <li><a href="/user/profile_setting">회원정보수정</a>
                            <ul class="dropdown">
                                <li><a href="/user/profile_setting">회원정보 수정</a></li>
                                <li><a href="/register/deleteID">회원 탈퇴</a></li>
                            </ul> 
                        </li>                      
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>
    <!-- Header End -->
    
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
    
    
	<!-- 첨부 파일 보여주기 -->
	<div class="bigPictureWrapper">
		<div class="bigPicture"></div>
	</div>
	
	<!-- 첨부물 보여주기 -->
<script>
	//현재 글 번호 가져오기->read->reply => 결과를 read
	var userIdVal = '${loginInfo.userId}';
</script>

    <!-- Footer Section Begin -->
  <footer class="footer-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="footer-left">
                    <div class="footer-logo">
                        <a href="#"><img src="/resources/img/footer-logo.png" alt=""></a>
                    </div>
                    <ul>
                        <li>Address: 60-49 Road 11378 New York</li>
                        <li>Phone: +65 11.188.888</li>
                        <li>Email: hello.colorlib@gmail.com</li>
                    </ul>
                    <div class="footer-social">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-instagram"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-pinterest"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 offset-lg-1">
                <div class="footer-widget">
                    <h5>... 정보</h5>
                    <ul>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">결제 정보</a></li>
                        <li><a href="#">고객 센터</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-2">
                <div class="footer-widget">
                    <h5>마이페이지</h5>
                    <ul>
                        <li><a href="#">마이페이지</a></li>
                        <li><a href="#">장바구니</a></li>
                        <li><a href="#">...</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="newslatter-item">
                    <h5>소식지 가입</h5>
                    <p>최신 제품 및 특별 이벤트에 대한 이메일 업데이트를 받으세요.</p>
                    <form action="#" class="subscribe-form">
                        <input type="text" placeholder="당신의 이메일 주소를 적으세요">
                        <button type="button">가입</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright-reserved">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="copyright-text">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </div>
                    <div class="payment-pic">
                        <img src="/resources/img/payment-method.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery-ui.min.js"></script>
<script src="/resources/js/jquery.countdown.min.js"></script>
<script src="/resources/js/jquery.nice-select.min.js"></script>
<script src="/resources/js/jquery.zoom.min.js"></script>
<script src="/resources/js/jquery.dd.min.js"></script>
<script src="/resources/js/jquery.slicknav.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/js/user_my.js"></script>
</body>

</html>