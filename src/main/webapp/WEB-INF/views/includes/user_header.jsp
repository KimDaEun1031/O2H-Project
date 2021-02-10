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
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet"/>

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
    
    <!-- Js Plugins -->
    <script src="/resources/js/jquery-3.3.1.min.js" defer ="defer"></script>
    <script src="/resources/js/bootstrap.min.js" defer ="defer"></script>
    <script src="/resources/js/jquery-ui.min.js" defer ="defer"></script>
    <script src="/resources/js/jquery.countdown.min.js" defer ="defer"></script>
    <script src="/resources/js/jquery.nice-select.min.js" defer ="defer"></script>
    <script src="/resources/js/jquery.zoom.min.js" defer ="defer"></script>
    <script src="/resources/js/jquery.dd.min.js" defer ="defer"></script>
    <script src="/resources/js/jquery.slicknav.js" defer ="defer"></script>
    <script src="/resources/js/owl.carousel.min.js" defer ="defer"></script>
    <script src="/resources/js/main.js" defer ="defer"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    
    
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
  <link href="/resources/css/creative-index.css" rel="stylesheet">


      <body id="page-top">
        <!-- Navigation  class="nav-link js-scroll-trigger"-->
        <nav class="navbar navbar-expand-lg navbar-light afixed-top" id="mainNav"><!-- fixed-top 수정해서 스크롤 제거 -->
          <div class="container">
        <!--     <a class="anavbar-brand js-scroll-trigger" href="/">HOME</a> -->
          <!--   <script type="text/javascript">
              document.getElementById("img-logo").onclick = function () {
                location.href = "index.html";
              };
            </script>  -->
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive"
              aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
      
            
      
            <div class="collapse navbar-collapse" id="navbarResponsive">
            
              <ul class="navbar-nav ml-auto">
              <!-- Navigation 
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
                  <a class="nav-link js-scroll-trigger" href="#">contacts</a>
                </li>-->
      
                <li class="nav-items">
               		<a class="btn btn-success" id="login" href="/register/login" hidden="hidden" role="button">로그인</a>
                	<a class="btn btn-primary" id="signin" href="/register/signup" hidden="hidden" role="button">회원가입</a>                 
                	<a class="btn btn-success" id="profile" href="/user/user_my" hidden="hidden" role="button">내 정보</a>
                	<a class="btn btn-primary" id="logout" href="/register/logout" hidden="hidden" role="button">로그 아웃</a>   
                	<a class="btn btn-warning" id="admin" href="/admin/admin_index" hidden="hidden" role="button">관리자 홈</a>                	
                	<a class="btn btn-success" id="test" href="/user/profile" hidden="hidden" role="button">테스트</a>                   
                </li>
              </ul>
            </div>
          </div>
        </nav>
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
                        <li><a href="/user/profile_setting">회원정보수정</a>
                            <ul class="dropdown">
                                <li><a href="/user/profile_setting">회원정보 수정</a></li>
                                <li><a href="/register/deleteID">회원 탈퇴</a></li>
                            </ul> 
                        </li>  
                        <li><a href="/teacher/teacher_my_stream" hidden="hidden" id="stream">스트리밍</a></li>                          
                        <li><a href="/user/user_calendar" id="calendar">일정관리</a></li>                          
                        <li><a href="http://jaysmusicplayer.netlify.app" id="stream">내 음악</a></li>                          
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>
    <!-- Header End -->
    
    <script>
	//	window.onload =function(){
			var loginInfo = '${loginInfo.userId}';
			var loginInfolevel = '${loginInfo.user_level}';
			
			var login=document.getElementById("login");
			var signin=document.getElementById("signin");
			var logout=document.getElementById("logout");
			var profile=document.getElementById("profile");
			var stream=document.getElementById("stream");
			if(loginInfo !=''){
				logout.removeAttribute("hidden");
				profile.removeAttribute("hidden");		
				stream.removeAttribute("hidden");	
				test.removeAttribute("hidden");	
				
			}else{
				
				login.removeAttribute("hidden");
				signin.removeAttribute("hidden");
				
			}
			if(loginInfo == 'admin') {
				admin.removeAttribute("hidden");				
			}
			
			var teacher = 1;
			if (loginInfolevel==teacher) {
				stream.removeAttribute("hidden");
	   		}
		
			
//		}
	
	
	</script>