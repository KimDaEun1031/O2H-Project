<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/header.jsp" %>
<%@ page import="com.company.domain.YHAreaChatVO" %>
<style type="text/css">
	.box1{
		width:800px;
		background-color: #e7ab3c;
		color:white;
		padding:15px;
		text-align: center;
		margin: 0px auto;
		justify-content: center; 
 	    /* align-items: center; */
 	    border-radius: 10px;
	}
	.box2{
		width:400px;
		 display: block;
		margin-top:15px;
		text-align: center;
		margin: 0px auto;
		justify-content: center; 
 	    align-items: center;
	}
	#msg1, #msg2, #msg3, #msg4 {
		border-radius: 5px;
		border: 2px solid black;
		padding: 10px;
		padding-left: 20px;
		margin-top: 15px;
		margin-right:10px;
		width:400px;
		height: 200px;
		font-size:14px;
		text-align: left;
		margin: 0px auto;
		justify-content: center; 
 	    align-items: center;
 	    margin-bottom: 20px;
	}
	
/* 	#msg1, #msg2{
		float: left;
	
	}
	#msg3, #msg4{
		float: left;
		
	} */
	/* 중앙 정렬 안 됨 */
	 #msg1{
		float: left;
		width:400px;
		margin-left: 300px;
	}
	 #msg2{
		float: right;
		width:400px;
		margin-right: 300px;
	}
	 #clear{
		clear: both;
	}
	 #msg3{
		float: left;
		width:400px;
		margin-left: 300px;
		
	}
	 #msg4{
		float: right;
		width:400px;
		margin-right: 300px;
		
	} 
	.bigDiv1{
	position: absolute;
	top: 10px;
	left: 50%;
	margin-left: -533px;
	}
	.bigDiv2{
	position: absolute;
	top: 10px;
	left: 50%;
	margin-left: -533px;
	}
	.breadcrumb-text a {
	    top: 0px;
	    content: none;
	    font-size: 18px;
	    font-family: "Malgun Gothic", Gulim !import;
	}
	.breadcrumb-text a::after {
	    position: absolute;
	    right: -18px;
	    top: 0px;
	    content: none;
	    font-size: 18px;
	    color: #009999;
	}
	.nav-link {
	  color: #666666;
	  border-bottom: 4px solid transparent;
	  font-size: 1.2rem;
	  display: block;
	  padding: .5rem 1rem;
	  font-family: 'Merriweather', 'Helvetica Neue', Arial, sans-serif;
	}
	.nav-link-2.active,
	.nav-link-2:hover {
	  border-color: #ff6666;
	}
	#room1, #room2, #room3, #room4 {
		padding: 7px;
		background-color: #e7ab3c;
		font-weight: bold;
		color: white;
		border: 0;
		outline: 0;
		border-radius: 10px;
		margin-bottom: 10px;
	
	}
	#room1:hover, #room2:hover, #room3:hover, #room4:hover {
		background-color: #f5c05e;
	
	}
</style>
		<!-- Breadcrumb Section Begin -->
	    <div class="breacrumb-section">
	      <div class="container">
	        <div class="row">
	          <div class="col-lg-12">
	            <div class="breadcrumb-text">
	              <a class="nav-link nav-link-2" href="/areaChat/chatRoomList">지역 채팅방</a>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
		

			<!-- <br />
			<div class="box1"> 순위 보여줄 게시판 </div>		
			<br />
			<div class="bigDiv1">
				<div id="msg1">div1</div>순위를 보여줄 영역
				<div id="msg2">div2</div>순위를 보여줄 영역
				<br />
			</div>
				<div id="clear"></div>
				<p></p>
			<div class="bigDiv2">
				<div id="msg3">div3</div>순위를 보여줄 영역
				<div id="msg4">div4</div>순위를 보여줄 영역
				<div class="box3"></div>
			</div>	
				
			<br /> -->
			<br />
			<div class="box1"> 지역 별 채팅창 </div>		
			<br />
									
			<div id="msg1"> <a href="/areaChat/goSeoul"><button hidden="hidden"  id="room1">서울 채팅방 입장</button> </a>
				<div>현재 입장한 고객 수 ${roomInfoList[4].getUserNum()} /100</div>
				<div>최근 대화 5줄</div>
			
				<div>${seoulChatList5.get(4).user_id} :${seoulChatList5.get(4).content} </div>
				<div>${seoulChatList5.get(3).user_id} :${seoulChatList5.get(3).content} </div>
				<div>${seoulChatList5.get(2).user_id} :${seoulChatList5.get(2).content} </div>
				<div>${seoulChatList5.get(1).user_id} :${seoulChatList5.get(1).content} </div>
				<div>${seoulChatList5.get(0).user_id} :${seoulChatList5.get(0).content} </div>
				<!-- 역순으로 나옴 -->
				<%-- <c:forEach var="vo" items="${seoulChatList5}" >
				<div> ${vo.user_id }:${vo.content }  </div>
				</c:forEach>  --%>
			</div><!-- 순위를 보여줄 영역 -->
			
			<div id="msg2"><a href=""><button hidden="hidden"  id="room2">경기도 채팅방 입장</button></a>
				<div>현재 입장한 고객 수 ${roomInfoList[3].getUserNum()}/100</div>	
	
			
			
			</div><!-- 순위를 보여줄 영역 -->
			<br />
			<div id="clear"></div>
			<p></p>
	
			<div id="msg3"><a href=""><button hidden="hidden"  id="room3">전라도 채팅방 입장</button> </a>
			<div>현재 입장한 고객 수 ${roomInfoList[2].getUserNum()}/100</div>	
	
			
			</div><!-- 순위를 보여줄 영역 -->
			<div id="msg4"><a href=""><button hidden="hidden"  id="room4">경상도 채팅방 입장</button> </a>
			<div>현재 입장한 고객 수 ${roomInfoList[1].getUserNum()}/100</div>	
	
			
			</div><!-- 순위를 보여줄 영역 -->
			<div class="box3"></div>

<script>
 var room1=document.getElementById("room1");
 var room2=document.getElementById("room2");
 var room3=document.getElementById("room3");
 var room4=document.getElementById("room4");
	
 	if( "${loginInfo.userId}" !="" ){
		
		
		room1.removeAttribute("hidden");
		room2.removeAttribute("hidden");
		room3.removeAttribute("hidden");
		room4.removeAttribute("hidden");

		
	}
	
</script>
		<br />
 

   <!-- Footer Section Begin -->
    <footer class="footer-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-3">
            <div class="footer-left">
              <div class="footer-logo">
                <a href="/"><img src="/resources/img/logo.png" style="margin-right: 50px; width: 140px; height: 80px;" alt="" /></a>
              </div>
              <ul>
                <li>Address: 솔데스크</li>
                <li>Phone: +82 00.0000.0000</li>
                <li>Email: 02H.soldesk@gmail.com</li>
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
                All rights reserved | This Site is made with
                <i class="fa fa-heart-o" aria-hidden="true"></i> by
                <a href="/" target="_blank">02H</a>
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
