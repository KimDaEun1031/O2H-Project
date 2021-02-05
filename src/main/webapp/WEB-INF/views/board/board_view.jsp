<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/header.jsp" %>

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
		<div class="box1"> 순위 보여줄 게시판 </div>		
		<br />
	
			<div id="msg1">div1</div><!-- 순위를 보여줄 영역 -->
			<div id="msg2">div2</div><!-- 순위를 보여줄 영역 -->
			<br />

			<div id="clear"></div>
			<p></p>
	
			<div id="msg3">div3</div><!-- 순위를 보여줄 영역 -->
			<div id="msg4">div4</div><!-- 순위를 보여줄 영역 -->
			<div class="box3"></div>


		<br />

  <%--  <%@include file="../includes/footer.jsp" %> --%>