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
    <link rel="stylesheet" href="/resources/css/boardList.css" type="text/css" />
    
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
    
    <!-- 현영님 포토 보드 -->
    <style>
    /* 가운데 정렬 */
	.wrap{
		width: 100%;
	    text-align: center;
	   /*  align-content: space-around; */
	}
	/* 테두리 박스 만들기 */
	.wrap .col-xl-3{
		 border: 3px solid #009999;
		 /* border: 2px solid #009999; */
		 width: 100%;
		 margin: 10px;
		 padding: 10px;
	}
	/* 리스트 링크 */
	.paginate_button a{
		/* color: #009999; */
		font-weight: 600;
		font-size: 1.5rem;
		font-family: 'Open Sans', 'Helvetica Neue', Arial, sans-serif;	
	}
	.paginate_button a{
		display: flex;
	    justify-content: center;
	    align-items: center;
	    width: 60px;
	    height: 60px;
	    font-size: 1.1rem;
	    color: #999;
	    background-color: #EEEEEE;
	    margin: 10px;
	    border-radius: 5px;
	    text-decoration: none;
	    transition: all 0.3s ease;
	}
	.paginate_button a:hover{
		background-color: #009999;
	    color: #fff; 
	}
		/* 글작성 버튼 */
	.testBtn {
		display: flex;
	    justify-content: center;
	    align-items: center;
	    width: 800px;
	    height: 40px;
	    font-size: 1.1rem;
	    color: #999;
	    background-color: #EEEEEE;
	    margin: 10px;
	    border-radius: 5px;
	    text-decoration: none;
	    transition: all 0.3s ease;
	    border-radius: 300px;
	}
	/* img 태그 hover 시 이미지 확대 */
	.scale {
	  transform: scale(1);
	  -webkit-transform: scale(1);
	  -moz-transform: scale(1);
	  -ms-transform: scale(1);
	  -o-transform: scale(1);
	  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
	}
	.scale:hover {
	  transform: scale(1.2);
	  -webkit-transform: scale(1.2);
	  -moz-transform: scale(1.2);
	  -ms-transform: scale(1.2);
	  -o-transform: scale(1.2);
	}
	.center{
		margin: auto;
	}
	@media(min-width: 700px){
	
		.wrap{
			display: flex; /* 가로로 길게  */
			flex-wrap: wrap;
			justify-content: space-around;	
		}
		.wrap .col-xl-3{
			/* flex-wrap: nowrap; */
			/* flex-wrap: wrap; */
			 
		}
		.wrap .col-xl-3:nth-child(3){
			/* flex: none; */
		}
	}
	    
    </style>
    
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
                	<a class="btn btn-info" id="stream" href="/user/teacher_page" hidden="hidden" role="button">Stream 설정</a>                   
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
				stream.removeAttribute("hidden");	
				
			}else{
				
				login.removeAttribute("hidden");
				signin.removeAttribute("hidden");
				
			}
			if(loginInfo == 'admin') {
				admin.removeAttribute("hidden");				
			}
			
			
//		}
	
	
	</script>

        
      <!-- 추가 부분 -->
     <div>
     	<a href="/">
          <img src="/resources/img/logo.png" alt=""/>
     	</a>
     </div>
	 

      <div class="container">
        <div class="inner-header">
          <div class="row">
            <div class="col-lg-2 col-md-2">
              <div class="logo">               
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
              <li>
                <a href="/PT/teacher_list">PT</a>               
              </li>
              <li>
                <a href="">홈쇼핑</a>               
              <li>
                <a href="/board/board_photo_list">커뮤니티</a>
                <ul class="dropdown">
                  <li><a href="/areaChat/chatRoomList">지역 채팅방</a></li>
                  <li><a href="/board/board_photo_list">오프라인 미팅</a></li>               
                </ul>
              </li>
              <li>
                <a href="/program/calorDict">프로그램</a>
                <ul class="dropdown">
                  <li><a href="/program/calorDict">칼로리사전</a></li>
                  <li><a href="/program/BMI">BMI계산기</a></li>
                 
                </ul>
              </li>
              <li>
                <a href="/announce/getList">고객센터</a>
                <ul class="dropdown">
                  <li><a href="/qandaboard/gotoQandAList">Q&A</a></li>
                  <li><a href="/chat/chat_list">실시간 문의</a></li>
                  <li><a href="/announce/getList">공지사항</a></li>
                </ul>
              </li>
               <li>
                <a href="/map/healthMap">주변 헬스장</a>
                
              </li>
            </ul>
          </nav>
          <div id="mobile-menu-wrap"></div>
        </div>
      </div>
    </header>
    <!-- Header End -->

    <!-- 슬라이드 광고 -->
    <section class="hero-section">
      <div class="hero-items owl-carousel">
        <div class="single-hero-items set-bg" data-setbg="/resources/img/hero-3.png" onclick="location.href='/chat/chat_list'">
          <div class="container">
            <div class="row">
              <div class="col-lg-5">               
              </div>
            </div>
          </div>
        </div>
        <div class="single-hero-items set-bg" data-setbg="/resources/img/hero-2.png" onclick="location.href='/PT/teacher_list'">
          <div class="container">
            <div class="row">
              <div class="col-lg-5">              
              </div>
            </div>
          </div>
        </div>
        <div class="single-hero-items set-bg" data-setbg="/resources/img/hero-1.png" onclick="location.href='#'">
          <div class="container">
            <div class="row">
              <div class="col-lg-5">              
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Hero Section End -->

    <!-- 현영님 사진 게시판 -->
    <div class="board_wrap" style="margin-top:20px">
   
     <table class="board_list" style="text-align: center;">
       <caption>
         게시판 목록
       </caption>
       
       
   <div class="wrap">
     <!-- 게시판 리스트 반복문 : 박스형태 -->
	     <script>
	     var str="";
	     </script>
     	<c:forEach var="hyvo" items="${hylist}">              	
                           
          	<script>  
			//결과를 보여줄 영역 가져오기
			var uuid = '${hyvo.attach.uuid}';	
			var uploadPath = '${hyvo.attach.uploadPath}';			
			var fileName = '${hyvo.attach.fileName}';	
			
			path = encodeURIComponent(uploadPath+"\\s_"+uuid+"_"+fileName);		
			fileCallPath=path.replace(new RegExp(/\\/g),"/");
			
			//화면에 보여줄 태그 생성
			str+='<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">';
			str+='<figure class="effect-ming tm-video-item">';
			str+='<div class="scale">';
			str+='<a href="${hyvo.bno}" class="move">';
			str+="<img id='myImg' src='/photoBoardDisplay?fileName="+fileCallPath+"' alt='${hyvo.attach.fileName}' class='img-fluid'>";		
			str+='<figcaption class="d-flex align-items-center justify-content-center">';
			str+='<a href="${hyvo.bno}" class="move"><h2>${hyvo.title}</h2></a>';
			str+='</figcaption></div></figure><div class="d-flex justify-content-between tm-text-gray">';
			str+='<span class="tm-text-gray-light"><h4>${vo.writer}</h4></span>';	
			str+='</div></div>';			
		</script> 
	</c:forEach>
	<script>
	$(".wrap").html(str);
	</script>
  </div>

	<!-- start Pagination -->
	<div class="text-center" style="display: table; margin-left: auto; margin-right: auto; ">
		<ul class="pagination" >
			<c:if test="${pageVO.prev }">
				<li class="paginate_button previous" ><a href="${pageVO.startPage-1 }">Previous</a>
			</c:if>
			<c:forEach var="idx" begin="${pageVO.startPage}" end="${pageVO.endPage}">
				<li class="paginate_button ${pageVO.cri.pageNum==idx?'active':''}"><a style="border: 0 solid black; padding: 5px;" href="${idx}">${idx}</a>
			</c:forEach>
			<c:if test="${pageVO.next }">
				<li class="paginate_button next"><a	href="${pageVO.endPage+1 }">Next</a>
			</c:if>
		</ul>
	</div><!-- end Pagination --> 
	</div>
	<%-- 페이지 링크 값을 넘기기 위한 폼 --%>
	<form action="" id="actionForm">
		<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}" id="pageNum"/>
		<input type="hidden" name="amount" value="${pageVO.cri.amount}"  id="amount"/>
	</form>
    <!-- 현영님 게시판 end -->

    <!-- 프로그램 메뉴 및 맵 -->
    <div class="flex-container">
    	<div>
    		<a href="/program/BMI"><img src="/resources/img/BMI_Button.png" style="width: 300px; height: 300px;" alt="" /></a>
	    	<a href="/program/calorDict"><img src="/resources/img/CAL_Button.png" style="width: 300px; height: 300px;" alt="" /></a>   	
	    	<a href=""><img src="/resources/img/MAP_Button.png" style="width: 300px; height: 300px;" alt="" /></a> 	
    	</div>
    </div>
    <!-- 프로그램 & 맵 end -->

    <!-- 공지사항 게시판 -->
    <section class="latest-blog spad" id="facilities">
      <div class="container">
      	    <div class="col-lg-12">
               <div class="section-title">
                   <h2>공지사항</h2>
               </div>
            </div>
			<div class="board_wrap" style="margin-left: 5%; margin-right: 5%">
				<span><a href="/announce/getList">more+</a></span>
			     <table class="board_list" style="text-align: center;">
			       <caption>
			         게시판 목록
			       </caption>
			       <thead >
			         <tr>
			           <th>번호</th>
			           <th>제목</th>
			           <th>작성일</th>
			           <th>조회수</th>
			           <th>댓글수</th>
			         </tr>
			       </thead>
			       <tbody>
			         <c:forEach var="vo" items="${list }">
			    		<tr>
			         		<td>${vo.bno }</td>
			   			<td><a href="${vo.bno }" class="move">${vo.title}</a></td>
			          	<td><fmt:formatDate value="${vo.regdate }"
			          			pattern="yyyy-MM-dd HH:mm" /></td>
			         	<td>${vo.written }
			   			<td>${vo.replycnt }  </td>
			         	   		
			         	</tr>
			         </c:forEach>
			       </tbody>
			     </table>
			     <br />
			     <!-- start Pagination
				<div class="text-center" style="display: table; margin-left: auto; margin-right: auto;">
					<ul class="pagination" >
						<c:if test="${pageVO.prev }">
							<li class="paginate_button previous"><a href="${pageVO.startPage-1 }">Previous</a>
						</c:if>
						<c:forEach var="idx" begin="${pageVO.startPage}" end="${pageVO.endPage}">
							<li class="paginate_button ${pageVO.cri.pageNum==idx?'active':''}"><a style="border: 0 solid black; padding: 5px" href="${idx}">${idx+1}</a>
						</c:forEach>
						<c:if test="${pageVO.next }">
							<li class="paginate_button next"><a	href="${pageVO.endPage+1 }">Next</a>
						</c:if>
					</ul>
				</div>
				end Pagination -->     
				<div class="bt_wrap">
				  <button class="btn btn-info" id="write" hidden="hidden">글 작성</button> 
				</div>
			</div>
			
			
				<form action="/announce/read" id="actionForm">							
				   <input type="hidden" name="pageNum" id="pageNum" value="1"/>				   
				   <input type="hidden" name="bno" />
				</form>      				
				<form action="/announce/write" id="actionForRead">							
				   <input type="hidden" name="pageNum" id="pageNum" value="1"/>				   
				</form>      
			</div>      
	    </section>

		<script>
		 window.onload=function(){
		 
			 var pageNumDiv=document.getElementById("pageNum")
			 if("${pageNum}"!="1"){
				 pageNumDiv.setAttribute("value",'${pageNum}')
			 }
			 var actionForm=$("#actionForm")
			write.onclick=function(e){
				 e.preventDefault();
				 
				 $("#actionForRead").submit();
				 
				 
			 } 
			$(".paginate_button a").click(function(e){
				//a 태그의 기능을 중지
				e.preventDefault();
		    	
				//pagenum의 값을 사용자가 선택한 값으로 변경
				//$("actionForm  [name='pageNum']").attr(value='$(this).text')
				actionForm.find("input[name='pageNum']").val($(this).attr("href"))
				console.log($(this).attr("href"));
				console.log($(this));
				actionForm.attr("action","getList");
				actionForm.submit();
			})
			
			 
			
		$(".move").click(function(e){
			e.preventDefault();		
			/* 
			actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'> ");
			 */
			 actionForm.find("input[name='bno']").val($(this).attr("href"))
				
			actionForm.attr("action","/announce/read"); // /board/read
			actionForm.submit();
		
		})
		 }
		</script>
       
    <!-- 공지사항 end -->

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
                <li>Address: 솔데스크</li>
                <li>Phone: +65 11.188.888</li>
                <li>Email: hello.colorlib@gmail.com</li>
              </ul>
              <div class="footer-social">
                <a href="http://www.facebook.com"><i class="fa fa-facebook"></i></a>
                <a href="http://www.twitter.com"><i class="fa fa-twitter"></i></a>
              </div>
            </div>
          </div>
          <div class="col-lg-2 offset-lg-1">
            <div class="footer-widget">
              <h5>Information</h5>
              <ul>
                <li><a href="#">About Us</a></li>
                <li><a href="#">고객 센터</a></li>
              </ul>
            </div>
          </div>
          <div class="col-lg-2">
            <div class="footer-widget">
              <h5>My Account</h5>
              <ul>
                <li><a href="#">내 정보</a></li>
                <li><a href="#">회원수정</a></li>
                <li><a href="#">회원탈퇴</a></li>
              </ul>
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
                <a href="/" target="_blank">Colorlib</a>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
              </div>            
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- Footer Section End -->

   
  </body>
</html>
