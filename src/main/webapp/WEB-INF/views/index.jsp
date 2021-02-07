<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <link rel="shortcut icon" href="img/iconLogo.ico" />

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
              };
            </script>  -->
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
                  <a class="nav-link js-scroll-trigger" href="#">contacts</a>
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
			var loginInfolevel = '${loginInfo.user_level}';
			
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
			if(loginInfo == 'admin') {
				admin.removeAttribute("hidden");
				$("#profile").attr("href","/user/admin_index");
			}
			
			var teacher = 1;
			if (loginInfolevel==teacher) {
	   			$("#profile").attr("href","/user/teacher_my");
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
          <div class="nav-depart">
            <div class="depart-btn">
              <i class="ti-menu"></i>
              <span>전체 페이지 목록</span>
              <ul class="depart-hover">
                <li><a href="#">PT</a></li>
                <li><a href="#">홈쇼핑</a></li>
                <li><a href="#">커뮤니티</a></li>
                <li><a href="#">프로그램</a></li>
              </ul>
            </div>
          </div>
          <nav class="nav-menu mobile-menu">
            <ul>
              <li class="active"><a href="/">홈</a></li>
              <li>
                <a href="#">PT</a>
                <ul class="dropdown">
                  <li><a href="PT/teacher-all">전체 강사</a></li>
                  <li><a href="#">스트리밍</a></li>
                </ul>
              </li>
              <li>
                <a href="shop/shop">홈쇼핑</a>               
              <li>
                <a href="./blog.html">커뮤니티</a>
                <ul class="dropdown">
                  <li><a href="#">온라인미팅</a></li>
                  <li><a href="#">오프라인미팅</a></li>
                  <li><a href="#">중고장터</a></li>
                </ul>
              </li>
              <li>
                <a href="#">프로그램</a>
                <ul class="dropdown">
                  <li><a href="/program/calorDict">칼로리사전</a></li>
                </ul>
              </li>
              <li>
                <a href="./contact.html">고객센터</a>
                <ul class="dropdown">
                  <li><a href="/qandaboard/gotoQandAList">Q&A</a></li>

                  <li><a href="/chat/chat_list">실시간 문의</a></li>

                  <li><a href="/announce/getList">공지사항</a></li>
                </ul>
              </li>
            </ul>
          </nav>
          <div id="mobile-menu-wrap"></div>
        </div>
      </div>
    </header>
    <!-- Header End -->

    <!-- Hero Section Begin -->
    <section class="hero-section">
      <div class="hero-items owl-carousel">
        <div class="single-hero-items set-bg" data-setbg="/resources/img/hero-3.jpg">
          <div class="container">
            <div class="row">
              <div class="col-lg-5">
                <span>Bag,kids</span>
                <h1>Black friday</h1>
                <p>
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
                  do eiusmod tempor incididunt ut labore et dolore
                </p>
                <a href="#" class="primary-btn">Shop Now</a>
              </div>
            </div>
          </div>
        </div>
        <div class="single-hero-items set-bg" data-setbg="/resources/img/hero-2.jpg">
          <div class="container">
            <div class="row">
              <div class="col-lg-5">
                <span>Bag,kids</span>
                <h1>Black friday</h1>
                <p>
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
                  do eiusmod tempor incididunt ut labore et dolore
                </p>
                <a href="#" class="primary-btn">Shop Now</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Hero Section End -->

    <!-- Instagram Section Begin -->
    <div class="banner-section spad" id="activities">
      <div class="instagram-photo">
        <div class="insta-item set-bg" data-setbg="/resources/img/insta-1.jpg">
          <div class="inside-text">
            <i class="ti-instagram"></i>
            <h5><a href="#">스트리밍 중</a></h5>
          </div>
        </div>
        <div class="insta-item set-bg" data-setbg="/resources/img/insta-2.jpg">
          <div class="inside-text">
            <i class="ti-instagram"></i>
            <h5><a href="#">스트리밍 중</a></h5>
          </div>
        </div>
        <div class="insta-item set-bg" data-setbg="/resources/img/insta-3.jpg">
          <div class="inside-text">
            <i class="ti-instagram"></i>
            <h5><a href="#">스트리밍 중</a></h5>
          </div>
        </div>
        <div class="insta-item set-bg" data-setbg="/resources/img/insta-4.jpg">
          <div class="inside-text">
            <i class="ti-instagram"></i>
            <h5><a href="#">스트리밍 중</a></h5>
          </div>
        </div>
        <div class="insta-item set-bg" data-setbg="/resources/img/insta-5.jpg">
          <div class="inside-text">
            <i class="ti-instagram"></i>
            <h5><a href="#">스트리밍 중</a></h5>
          </div>
        </div>
        <div class="insta-item set-bg" data-setbg="/resources/img/insta-6.jpg">
          <div class="inside-text">
            <i class="ti-instagram"></i>
            <h5><a href="#">스트리밍 중</a></h5>
          </div>
        </div>
      </div>
    </div>
    <!-- Instagram Section End -->

    <!-- Women Banner Section Begin -->
    <section class="women-banner spad" id="">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-3">
            <div
              class="product-large set-bg"
              data-setbg="/resources/img/products/women-large.jpg"
            >
              <h2>추천상품</h2>
              <a href="#">자세히</a>
            </div>
          </div>
          <div class="col-lg-8 offset-lg-1">
            <div class="filter-control">
              <ul>
                <li class="active">보충제</li>
                <li>건강</li>
                <li>패션</li>
                <li>헬스</li>
              </ul>
            </div>
            <div class="product-slider owl-carousel">
              <div class="product-item">
                <div class="pi-pic">
                  <img src="/resources/img/products/women-1.jpg" alt="" />
                  <div class="sale">Sale</div>
                  <div class="icon">
                    <i class="icon_heart_alt"></i>
                  </div>
                  <ul>
                    <li class="w-icon active">
                      <a href="#"><i class="icon_bag_alt"></i></a>
                    </li>
                    <li class="quick-view"><a href="#">+ Quick View</a></li>
                    <li class="w-icon">
                      <a href="#"><i class="fa fa-random"></i></a>
                    </li>
                  </ul>
                </div>
                <div class="pi-text">
                  <div class="catagory-name">Coat</div>
                  <a href="#">
                    <h5>Pure Pineapple</h5>
                  </a>
                  <div class="product-price">
                    $14.00
                    <span>$35.00</span>
                  </div>
                </div>
              </div>
              <div class="product-item">
                <div class="pi-pic">
                  <img src="/resources/img/products/women-2.jpg" alt="" />
                  <div class="icon">
                    <i class="icon_heart_alt"></i>
                  </div>
                  <ul>
                    <li class="w-icon active">
                      <a href="#"><i class="icon_bag_alt"></i></a>
                    </li>
                    <li class="quick-view"><a href="#">+ Quick View</a></li>
                    <li class="w-icon">
                      <a href="#"><i class="fa fa-random"></i></a>
                    </li>
                  </ul>
                </div>
                <div class="pi-text">
                  <div class="catagory-name">Shoes</div>
                  <a href="#">
                    <h5>Guangzhou sweater</h5>
                  </a>
                  <div class="product-price">$13.00</div>
                </div>
              </div>
              <div class="product-item">
                <div class="pi-pic">
                  <img src="/resources/img/products/women-3.jpg" alt="" />
                  <div class="icon">
                    <i class="icon_heart_alt"></i>
                  </div>
                  <ul>
                    <li class="w-icon active">
                      <a href="#"><i class="icon_bag_alt"></i></a>
                    </li>
                    <li class="quick-view"><a href="#">+ Quick View</a></li>
                    <li class="w-icon">
                      <a href="#"><i class="fa fa-random"></i></a>
                    </li>
                  </ul>
                </div>
                <div class="pi-text">
                  <div class="catagory-name">Towel</div>
                  <a href="#">
                    <h5>Pure Pineapple</h5>
                  </a>
                  <div class="product-price">$34.00</div>
                </div>
              </div>
              <div class="product-item">
                <div class="pi-pic">
                  <img src="/resources/img/products/women-4.jpg" alt="" />
                  <div class="icon">
                    <i class="icon_heart_alt"></i>
                  </div>
                  <ul>
                    <li class="w-icon active">
                      <a href="#"><i class="icon_bag_alt"></i></a>
                    </li>
                    <li class="quick-view"><a href="#">+ Quick View</a></li>
                    <li class="w-icon">
                      <a href="#"><i class="fa fa-random"></i></a>
                    </li>
                  </ul>
                </div>
                <div class="pi-text">
                  <div class="catagory-name">Towel</div>
                  <a href="#">
                    <h5>Converse Shoes</h5>
                  </a>
                  <div class="product-price">$34.00</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Women Banner Section End -->

    <!-- Man Banner Section Begin -->
    <section class="man-banner spad" id="services">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-8">
            <div class="filter-control">
              <ul>
                <li class="active">...</li>
                <li>...</li>
                <li>...</li>
                <li>...</li>
              </ul>
            </div>
            <div class="product-slider owl-carousel">
              <div class="product-item">
                <div class="pi-pic">
                  <img src="/resources/img/products/man-1.jpg" alt="" />
                  <div class="sale">Sale</div>
                  <div class="icon">
                    <i class="icon_heart_alt"></i>
                  </div>
                  <ul>
                    <li class="w-icon active">
                      <a href="#"><i class="icon_bag_alt"></i></a>
                    </li>
                    <li class="quick-view"><a href="#">+ Quick View</a></li>
                    <li class="w-icon">
                      <a href="#"><i class="fa fa-random"></i></a>
                    </li>
                  </ul>
                </div>
                <div class="pi-text">
                  <div class="catagory-name">Coat</div>
                  <a href="#">
                    <h5>Pure Pineapple</h5>
                  </a>
                  <div class="product-price">
                    $14.00
                    <span>$35.00</span>
                  </div>
                </div>
              </div>
              <div class="product-item">
                <div class="pi-pic">
                  <img src="/resources/img/products/man-2.jpg" alt="" />
                  <div class="icon">
                    <i class="icon_heart_alt"></i>
                  </div>
                  <ul>
                    <li class="w-icon active">
                      <a href="#"><i class="icon_bag_alt"></i></a>
                    </li>
                    <li class="quick-view"><a href="#">+ Quick View</a></li>
                    <li class="w-icon">
                      <a href="#"><i class="fa fa-random"></i></a>
                    </li>
                  </ul>
                </div>
                <div class="pi-text">
                  <div class="catagory-name">Shoes</div>
                  <a href="#">
                    <h5>Guangzhou sweater</h5>
                  </a>
                  <div class="product-price">$13.00</div>
                </div>
              </div>
              <div class="product-item">
                <div class="pi-pic">
                  <img src="/resources/img/products/man-3.jpg" alt="" />
                  <div class="icon">
                    <i class="icon_heart_alt"></i>
                  </div>
                  <ul>
                    <li class="w-icon active">
                      <a href="#"><i class="icon_bag_alt"></i></a>
                    </li>
                    <li class="quick-view"><a href="#">+ Quick View</a></li>
                    <li class="w-icon">
                      <a href="#"><i class="fa fa-random"></i></a>
                    </li>
                  </ul>
                </div>
                <div class="pi-text">
                  <div class="catagory-name">Towel</div>
                  <a href="#">
                    <h5>Pure Pineapple</h5>
                  </a>
                  <div class="product-price">$34.00</div>
                </div>
              </div>
              <div class="product-item">
                <div class="pi-pic">
                  <img src="/resources/img/products/man-4.jpg" alt="" />
                  <div class="icon">
                    <i class="icon_heart_alt"></i>
                  </div>
                  <ul>
                    <li class="w-icon active">
                      <a href="#"><i class="icon_bag_alt"></i></a>
                    </li>
                    <li class="quick-view"><a href="#">+ Quick View</a></li>
                    <li class="w-icon">
                      <a href="#"><i class="fa fa-random"></i></a>
                    </li>
                  </ul>
                </div>
                <div class="pi-text">
                  <div class="catagory-name">Towel</div>
                  <a href="#">
                    <h5>Converse Shoes</h5>
                  </a>
                  <div class="product-price">$34.00</div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-3 offset-lg-1">
            <div
              class="product-large set-bg m-large"
              data-setbg="/resources/img/products/man-large.jpg"
            >
              <h2>인기상품</h2>
              <a href="#">자세히</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Man Banner Section End -->

    <!-- Latest Blog Section Begin -->
    <section class="latest-blog spad" id="facilities">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="section-title">
              <h2>뉴스(혹은 공지사항, 커뮤니티 인기글)</h2>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4 col-md-6">
            <div class="single-latest-blog">
              <img src="/resources/img/latest-1.jpg" alt="" />
              <div class="latest-text">
                <div class="tag-list">
                  <div class="tag-item">
                    <i class="fa fa-calendar-o"></i>
                    May 4,2019
                  </div>
                  <div class="tag-item">
                    <i class="fa fa-comment-o"></i>
                    5
                  </div>
                </div>
                <a href="#">
                  <h4>The Best Street Style From London Fashion Week</h4>
                </a>
                <p>
                  Sed quia non numquam modi tempora indunt ut labore et dolore
                  magnam aliquam quaerat
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="single-latest-blog">
              <img src="/resources/img/latest-2.jpg" alt="" />
              <div class="latest-text">
                <div class="tag-list">
                  <div class="tag-item">
                    <i class="fa fa-calendar-o"></i>
                    May 4,2019
                  </div>
                  <div class="tag-item">
                    <i class="fa fa-comment-o"></i>
                    5
                  </div>
                </div>
                <a href="#">
                  <h4>Vogue's Ultimate Guide To Autumn/Winter 2019 Shoes</h4>
                </a>
                <p>
                  Sed quia non numquam modi tempora indunt ut labore et dolore
                  magnam aliquam quaerat
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="single-latest-blog">
              <img src="/resources/img/latest-3.jpg" alt="" />
              <div class="latest-text">
                <div class="tag-list">
                  <div class="tag-item">
                    <i class="fa fa-calendar-o"></i>
                    May 4,2019
                  </div>
                  <div class="tag-item">
                    <i class="fa fa-comment-o"></i>
                    5
                  </div>
                </div>
                <a href="#">
                  <h4>How To Brighten Your Wardrobe With A Dash Of Lime</h4>
                </a>
                <p>
                  Sed quia non numquam modi tempora indunt ut labore et dolore
                  magnam aliquam quaerat
                </p>
              </div>
            </div>
          </div>
        </div>
        <div class="benefit-items">
          <div class="row">
            <div class="col-lg-4">
              <div class="single-benefit">
                <div class="sb-icon">
                  <img src="/resources/img/icon-1.png" alt="" />
                </div>
                <div class="sb-text">
                  <h6>무료 배송</h6>
                  <p>23000원 이상 구매시</p>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="single-benefit">
                <div class="sb-icon">
                  <img src="/resources/img/icon-2.png" alt="" />
                </div>
                <div class="sb-text">
                  <h6>정시 배달</h6>
                  <p>오전 10시 이전 주문시</p>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="single-benefit">
                <div class="sb-icon">
                  <img src="/resources/img/icon-1.png" alt="" />
                </div>
                <div class="sb-text">
                  <h6>안전 결제</h6>
                  <p>100% 안전 결제 보장</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Latest Blog Section End -->

    <!-- Partner Logo Section Begin -->
    <div class="partner-logo" id="contact">
      <div class="container">
        <div class="logo-carousel owl-carousel">
          <div class="logo-item">
            <div class="tablecell-inner">
              <img src="/resources/img/logo-carousel/logo-1.png" alt="" />
            </div>
          </div>
          <div class="logo-item">
            <div class="tablecell-inner">
              <img src="/resources/img/logo-carousel/logo-2.png" alt="" />
            </div>
          </div>
          <div class="logo-item">
            <div class="tablecell-inner">
              <img src="/resources/img/logo-carousel/logo-3.png" alt="" />
            </div>
          </div>
          <div class="logo-item">
            <div class="tablecell-inner">
              <img src="/resources/img/logo-carousel/logo-4.png" alt="" />
            </div>
          </div>
          <div class="logo-item">
            <div class="tablecell-inner">
              <img src="/resources/img/logo-carousel/logo-5.png" alt="" />
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Partner Logo Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-3">
            <div class="footer-left">
              <div class="footer-logo">
                <a href="#"><img src="/resources/img/footer-logo.png" alt="" /></a>
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
                <input
                  type="text"
                  placeholder="당신의 이메일 주소를 적으세요"
                />
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
                Copyright &copy;
                <script>
                  document.write(new Date().getFullYear());
                </script>
                All rights reserved | This template is made with
                <i class="fa fa-heart-o" aria-hidden="true"></i> by
                <a href="https://colorlib.com" target="_blank">Colorlib</a>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
              </div>
              <div class="payment-pic">
                <img src="/resources/img/payment-method.png" alt="" />
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
  </body>
</html>
