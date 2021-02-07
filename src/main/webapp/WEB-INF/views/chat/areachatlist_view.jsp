<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/header.jsp" %>
<%@ page import="com.company.domain.YHAreaChatVO" %>
<style type="text/css">
body{
		/* margin:20px; */
	}
	.box1{
		width:800px;
		background-color:green;
		color:white;
		padding:15px;
		text-align: center;
		margin: 0px auto;
		justify-content: center; 
 	    /* align-items: center; */
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
		border: 2px solid #73ad21;
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
		margin-left: 400px;
	}
	 #msg2{
		float: right;
		margin-right: 400px;
	}
	 #clear{
		clear: both;
	}
	 #msg3{
		float: left;
		margin-left: 400px;
	}
	 #msg4{
		float: right;
		margin-right: 400px;
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
</style>


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
	
 	if( "${loginINfo_userId}" !=null){
		
		alert("hello2")
		room1.removeAttribute("hidden");
		room2.removeAttribute("hidden");
		room3.removeAttribute("hidden");
		room4.removeAttribute("hidden");
		
	}
	
</script>
		<br />

  <%--  <%@include file="../includes/footer.jsp" %> --%>