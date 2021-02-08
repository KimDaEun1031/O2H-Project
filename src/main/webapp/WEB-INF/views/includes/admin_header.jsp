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
  </head>

  <!-- 로그인/회원가입 메뉴 추가 -->
  <link rel="shortcut icon" href="/resources/img/iconLogo.ico" />

  <!-- Bootstrap core CSS -->
  <link href="/resources/vendor/bootstrap/css/bootstrap2.min.css" rel="stylesheet">
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
<!---->
        <!-- Navigation  class="nav-link js-scroll-trigger"-->
        <nav class="navbar navbar-expand-lg navbar-light afixed-top" id="mainNav"><!-- fixed-top 수정해서 스크롤 제거 -->
          <div class="container">
            <a class="anavbar-brand js-scroll-trigger" href="./index.html">HOME</a>
            <script type="text/javascript">
              document.getElementById("img-logo").onclick = function () {
                location.href = "index.html";
              };
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
                  <a class="nav-link js-scroll-trigger" href="#facilities">Facilities</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link js-scroll-trigger" href="/admin/admin_status">관리자</a>
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
          </div>
        </div>
      </div>
      <div class="nav-item">
        <div class="container"> 
          <nav class="nav-menu mobile-menu">
            <ul>
              <li class="active"><a href="/user/admin_index">홈</a></li>
              <li>
                <a href="/admin/admin_status">월별현황분석</a>               
              </li>
              <li>
                <a href="/admin/admin_member">회원관리</a>               
              </li>
              <li>
                <a href="/board/board_announce_list">고객센터</a>               
              </li>                          
            </ul>
          </nav>
          <div id="mobile-menu-wrap"></div>
        </div>
      </div>
    </head>
    <!-- Header End -->