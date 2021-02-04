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
    <link rel="stylesheet" href="/resources/css/teacher-all.css" />
    <link rel="stylesheet" href="/resources/css/sub.css" />
  </head>

  <!-- 로그인/회원가입 메뉴 추가 -->
  <link rel="shortcut icon" href="img/iconLogo.ico" />

  <!-- Bootstrap core CSS -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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


<!--기본 최상단 -->
  <!-- <body> -->
    <!-- Page Preloder -->
    <!-- <div id="preloder">
      <div class="loader"></div>
    </div> -->

    <!-- Header Section Begin -->
    <!-- <header class="header-section">
      <div class="header-top">
        <div class="container">
          <div class="ht-left">
            <div class="mail-service">
              <i class="fa fa-envelope"></i>
              hello.colorlib@gmail.com
            </div>
            <div class="phone-service">
              <i class="fa fa-phone"></i>
              +65 11.188.888
            </div>
          </div>
          <div class="ht-right">
            <a href="./login.html" class="login-panel"
              ><i class="fa fa-user"></i>로그인</a
            >
            <div class="lan-selector">
              <select
                class="language_drop"
                name="countries"
                id="countries"
                style="width: 300px"
              >
                <option
                  value="yt"
                  data-image="img/flag-1.jpg"
                  data-imagecss="flag yt"
                  data-title="English"
                >
                  English
                </option>
                <option
                  value="yu"
                  data-image="img/flag-2.jpg"
                  data-imagecss="flag yu"
                  data-title="Bangladesh"
                >
                  German
                </option>
              </select>
            </div>
            <div class="top-social">
              <a href="#"><i class="ti-facebook"></i></a>
              <a href="#"><i class="ti-twitter-alt"></i></a>
              <a href="#"><i class="ti-linkedin"></i></a>
              <a href="#"><i class="ti-pinterest"></i></a>
            </div>
          </div>
        </div>
      </div> -->
      
      <body id="page-top">
<!---->
        <!-- Navigation  class="nav-link js-scroll-trigger"-->
        <nav class="navbar navbar-expand-lg navbar-light afixed-top" id="mainNav"><!-- fixed-top 수정해서 스크롤 제거 -->
          <div class="container">

            <a class="anavbar-brand js-scroll-trigger" href="/">HOME</a>

  
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
                  <a class="nav-link js-scroll-trigger" href="#contact">Contact</a>
                </li>
      
                <li class="nav-item">
                  <a class="btn btn-success btn-lg" href="/register/login" role="button">로그인</a>
                  <a class="btn btn-success btn-lg" href="/register/signup" role="button">회원가입</a>         
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
                <a href="./index.html">
                  <img src="img/logo.png" alt="" />
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
            <div class="col-lg-3 text-right col-md-3">
              <ul class="nav-right">
                <li class="heart-icon">
                  <a href="#">
                    <i class="icon_heart_alt"></i>
                    <span>1</span>
                  </a>
                </li>
                <li class="cart-icon">
                  <a href="./shopping-cart.html">
                    <i class="icon_bag_alt"></i>
                    <span>3</span>
                  </a>
                  <div class="cart-hover">
                    <div class="select-items">
                      <table>
                        <tbody>
                          <tr>
                            <td class="si-pic">
                              <img src="img/select-product-1.jpg" alt="" />
                            </td>
                            <td class="si-text">
                              <div class="product-selected">
                                <p>$60.00 x 1</p>
                                <h6>Kabino Bedside Table</h6>
                              </div>
                            </td>
                            <td class="si-close">
                              <i class="ti-close"></i>
                            </td>
                          </tr>
                          <tr>
                            <td class="si-pic">
                              <img src="img/select-product-2.jpg" alt="" />
                            </td>
                            <td class="si-text">
                              <div class="product-selected">
                                <p>$60.00 x 1</p>
                                <h6>Kabino Bedside Table</h6>
                              </div>
                            </td>
                            <td class="si-close">
                              <i class="ti-close"></i>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                    <div class="select-total">
                      <span>total:</span>
                      <h5>$120.00</h5>
                    </div>
                    <div class="select-button">
                      <a href="#" class="primary-btn view-card"
                        >결제수단 보기</a
                      >
                      <a href="#" class="primary-btn checkout-btn">결제</a>
                    </div>
                  </div>
                </li>
                <li class="cart-price">$150.00</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="nav-item">
        <div class="container">
          <div class="nav-depart">
            <div class="depart-btn">
              <i class="ti-menu"></i>
              <span>전체 상품 목록</span>
              <ul class="depart-hover">
                <li class="active"><a href="#">보충제</a></li>
                <li><a href="#">건강용품</a></li>
                <li><a href="#">헬스용품</a></li>
                <li><a href="#">패션</a></li>
                <li><a href="#">브랜드</a></li>
                <li><a href="#">...</a></li>
                <li><a href="#">...</a></li>
                <li><a href="#">...</a></li>
              </ul>
            </div>
          </div>
          <nav class="nav-menu mobile-menu">
            <ul>
              <li class="active"><a href="./index.html">홈</a></li>
              <li>
                <a href="#">PT</a>
                <ul class="dropdown">
                  <li><a href="/PT/teacher-all">전체 강사</a></li>
                  <li><a href="#">스트리밍</a></li>
                  <li><a href="#">...</a></li>
                </ul>
              </li>
              <li>
                <a href="./shop.html">홈쇼핑</a>
                <ul class="dropdown" id="one">
                  <li id="on">
                    <a href="#">식품</a>
                    <!-- test -->
                    <ul class="dropdown" id="two">
                      <li id="on">
                        <a href="#">단백질</a>
                        <!-- test2 -->
                        <ul class="dropdown" id="three">
                          <li><a href="#">복합단백질/MRP</a></li>
                          <li><a href="#">가성비/무맛 단백질</a></li>
                          <li><a href="#">유기농/Grass Fed</a></li>
                          <li><a href="#">분리유청(WPI,유당제거)</a></li>
                          <li><a href="#">느린흡수/카제인</a></li>
                          <li><a href="#">소고기/대두/기타단백질</a></li>
                          <li><a href="#">프로틴스낵</a></li>
                          <li><a href="#">프로틴/에너지바</a></li>
                          <li><a href="#">프로틴음료/RTD</a></li>
                          <li><a href="#">체중증가/게이너</a></li>
                        </ul>
                        <!-- test2 -->
                      </li>
                      <li id="on">
                        <a href="#">다이어트</a>
                        <!-- test2 -->
                        <ul class="dropdown" id="three">
                          <li><a href="#">도시락&샐러드</a></li>
                          <li><a href="#">간편식</a></li>
                          <li><a href="#">체지방관리</a></li>
                        </ul>
                        <!-- test2 -->
                      </li>
                      <li id="on">
                        <a href="#">보조영양제</a>
                        <!-- test2 -->
                        <ul class="dropdown" id="three">
                          <li><a href="#">아르기닌</a></li>
                          <li><a href="#">크레아틴</a></li>
                          <li><a href="#">동화대사</a></li>
                          <li><a href="#">아미노산</a></li>
                        </ul>
                        <!-- test2 -->
                      </li>
                      <li id="on">
                        <a href="#">다이어트2</a>
                        <!-- test2 -->
                        <ul class="dropdown" id="three">
                          <li><a href="#">단일성분</a></li>
                          <li><a href="#">복합성분</a></li>
                          <li><a href="#">신진대사촉진</a></li>
                          <li><a href="#">MCT오일</a></li>
                          <li><a href="#">디톡스/배변</a></li>
                        </ul>
                        <!-- test2 -->
                      </li>
                    </ul>
                    <!-- test -->
                  </li>
                  <li id="on">
                    <a href="#">운동기구</a>
                    <!-- test -->
                    <ul class="dropdown" id="two">
                      <li id="on"><a href="#">유산소운동기구</a></li>
                      <li id="on"><a href="#">리프팅</a></li>
                      <li id="on"><a href="#">보조기구</a></li>
                    </ul>
                    <!-- test -->
                  </li>
                  <li id="on">
                    <a href="#">의류</a>
                    <!-- test -->
                    <ul class="dropdown" id="two">
                      <li id="on"><a href="#">헬스장갑</a></li>
                      <li id="on"><a href="#">리프팅벨트</a></li>
                      <li id="on"><a href="#">패션</a></li>
                    </ul>
                    <!-- test -->
                  </li>
                </ul>
              </li>
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
                  <li><a href="#">칼로리사전</a></li>
                </ul>
              </li>
              <li>
                <a href="./contact.html">고객센터</a>
                <ul class="dropdown">
                  <li><a href="#">Q&A</a></li>
                  <li><a href="#">문의하기</a></li>
                  <li><a href="#">공지사항</a></li>
                </ul>
              </li>
            </ul>
          </nav>
          <div id="mobile-menu-wrap"></div>
        </div>
      </div>
    </header>
    <!-- Header End -->
	<!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <a href="./shop.html">PT</a>
                        <span>전체 강사</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- recommand 보충제 Banner Section Begin -->
    <section class="recommand-product one-banner">
        <div class="container-fluid">
            <div class="row">
            	<div class="col-lg-10 offset-lg-1">
                    <div class="filter-control">
                        <ul>
                            <li class="active">추천 강사</li>                       
                        </ul>
                    </div>
	                <div class="product-slider owl-carousel">            
	                    <div class="product-item">
	                        <div class="pi-pic">
	                            <a href="#"><img src="/resources/img/products/women-1.jpg" alt=""></a>
	                                                     
	                        </div>
	                        <div class="pi-text">
	                            <div class="catagory-name">담당 운동</div>
	                            <a href="#">
	                                <h5>강사 이름</h5>
	                            </a>                           
	                        </div>
	                    </div>
	                    <div class="product-item">
	                        <div class="pi-pic">
	                            <a href=""><img src="/resources/img/products/women-2.jpg" alt=""></a>
	                            
	                        </div>
	                        <div class="pi-text">
	                            <div class="catagory-name">담당 운동</div>
	                            <a href="#">
	                                <h5>강사 이름</h5>
	                            </a>    
	                        </div>
	                    </div>
	                    <div class="product-item">
	                        <div class="pi-pic">
	                            <a href=""><img src="/resources/img/products/women-3.jpg" alt=""></a>
	                            
	                        </div>
	                        <div class="pi-text">
	                            <div class="catagory-name">담당 운동</div>
	                            <a href="#">
	                                <h5>강사 이름</h5>
	                            </a>
	                            
	                        </div>
	                    </div>
	                    <div class="product-item">
	                        <div class="pi-pic">
	                            <a href=""><img src="/resources/img/products/women-4.jpg" alt=""></a>
	                                                     
	                        </div>
	                        <div class="pi-text">
	                            <div class="catagory-name">담당 운동</div>
	                            <a href="#">
	                                <h5>강사 이름</h5>
	                            </a> 
	                        </div>
	                    </div>
	                </div>
	            </div>
            </div>
        </div>
    </section>
    <!-- recommand 보충제 Banner Section End -->

    <section class="teacher-section" >
        <h3>전체 강사 보기</h3>
        <div class="teacher" style="text-align: center">
            <a href=""><img class="teacher-img" src="/resources/img/products/women-4.jpg" alt=""></a>  
            <a href=""><img class="teacher-img" src="/resources/img/products/women-4.jpg" alt=""></a>
            <a href=""><img class="teacher-img" src="/resources/img/products/women-4.jpg" alt=""></a>
            <a href=""><img class="teacher-img" src="/resources/img/products/women-4.jpg" alt=""></a>
            <a href=""><img class="teacher-img" src="/resources/img/products/women-4.jpg" alt=""></a>
            <a href=""><img class="teacher-img" src="/resources/img/products/women-4.jpg" alt=""></a>
            <a href=""><img class="teacher-img" src="/resources/img/products/women-4.jpg" alt=""></a>          
        </div>      
    </section>
<%@include file="../includes/footer.jsp" %>