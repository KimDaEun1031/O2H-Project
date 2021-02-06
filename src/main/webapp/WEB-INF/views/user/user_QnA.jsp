<%@page import="java.util.List"%>
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
  <link rel="stylesheet" href="/resources/css/boardList.css" type="text/css" />


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
                  <a class="nav-link js-scroll-trigger" href="/user/profile_setting">테스트중</a>
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
     <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcrumb-text">
              <span>Q&A게시판</span>
            </div>
          </div>
        </div>
      </div>
    </div>
   
     

	<div class="board_wrap" style="margin-left: 5%; margin-right: 5%">
	     <table class="board_list" style="text-align: center;">
	       <caption>
	         게시판 목록
	       </caption>
	       <thead >
	         <tr>
	           <th>번호</th>
	           <th>제목</th>
	           <th>글쓴이</th>
	           <th>작성일</th>
	           <th>답변날짜</th>
	         </tr>
	       </thead>
	       <tbody>
	       
	       		<c:forEach var="vo" items="${userlist}">  
	       			
		    		<tr>
		         		<td>${vo.bno}</td>
		   			<td><a href="${vo.bno}">${vo.title}</a></td>
		   			<td>${vo.writer_id}</td>
		          	<td><fmt:formatDate value="${vo.regdate }"
		          			pattern="yyyy-MM-dd HH:mm" /></td>
		         		<td>
		         		<fmt:formatDate value="${vo.replyDate }"
		          			pattern="yyyy-MM-dd HH:mm" /></td>         		
		         	</tr>
	         		
	         </c:forEach>
	       </tbody>
	     </table>
		      <!-- start Pagination -->
		<div class="text-center" style="display: table; margin-left: auto; margin-right: auto;">
			<ul class="pagination" >
				<c:if test="${pageVO.prev }">
					<li class="paginate_button previous"><a
						href="${pageVO.startPage-1 }">Previous</a>
				</c:if>
				<c:forEach var="idx" begin="${pageVO.startPage}"
					end="${pageVO.endPage}">
					<li class="paginate_button ${pageVO.cri.pageNum==idx?'active':''}"><a
						href="${idx}">${idx}</a>
				</c:forEach>
				<c:if test="${pageVO.next }">
					<li class="paginate_button next"><a	href="${pageVO.endPage+1 }">Next</a>
				</c:if>
			</ul>
		</div>
		<!-- end Pagination --> 	 
	</div>
	
	
	<form action="/qandaboard/read" id="actionForm">
		<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum }"/>
   		<input type="hidden" name="bno" />
	</form>      


<script>
 window.onload=function(){
	 
	 console.log("${loginInfo}"+"123");
	 if("${loginInfo.userId}"!=""){
			 document.getElementById("singinbtn").removeAttribute("hidden");
	 }
var actionForm=$("#actionForm")

$(".paginate_button a").click(function(e){
		//a 태그의 기능을 중지
		e.preventDefault();
    	
		//pagenum의 값을 사용자가 선택한 값으로 변경
		//$("actionForm  [name='pageNum']").attr(value='$(this).text')
		actionForm.find("input[name='pageNum']").val($(this).attr("href"))
		console.log($(this).attr("href"));
		console.log($(this));
		actionForm.attr("action","gotoQandAList");
		actionForm.submit();
	})
	 
	
$(".move").click(function(e){
	e.preventDefault();		
	/* 
	actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'> ");
	 */
	 actionForm.find("input[name='bno']").val($(this).attr("href"))
		
	actionForm.attr("action","read"); // /board/read
	actionForm.submit();

})
 }
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
</body>

</html>