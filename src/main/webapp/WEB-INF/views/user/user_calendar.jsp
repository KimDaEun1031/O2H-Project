<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/user_header.jsp" %>
    <link rel="stylesheet" href="/resources/css/calendar.css" />
    <link href="https://fonts.googleapis.com/css2?family=Epilogue:wght@500&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/c92986acdf.js" crossorigin="anonymous"></script>
    <script src="/resources/js/calendar.js" defer></script>
    <style>
    	h5{
    		margin: 5px;
    		text-align: center;
    	}
    	input {
    		margin-left: 36%;
    		
    	}
    </style>
    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcrumb-text">
              <a class="nav-link nav-link-2" href="/user/user_calendar">일정관리</a>
            </div>
          </div>
        </div>
      </div>
    </div>
<br /><br /><br />
<div class="col-lg-12">
       <div class="section-title">
           <h2>오늘의 일정</h2>           
       </div>
    </div>

    <section class="main">
        <h3 class="main-title">오늘의 운동/식단</h3>
        <div class="month clearfix">
            <span class="left">
                <i class="fas fa-chevron-left left"></i>
            </span>
            <span class="right">
                <i class="fas fa-chevron-right right"></i>
            </span>
            <p class="month-name"></p>
        </div>
        <div class="dayCount">
            <ul class="dayCount-list clearfix">
                <li>MON</li>
                <li>TUE</li>
                <li>WED</li>
                <li>THU</li>
                <li>FRI</li>
                <li>SAT</li>
                <li>SUN</li>
            </ul>
        </div>
        <ul class="day clearfix">
          
        </ul>

    </section>
    <section class="todo">
        <h3 class="todo-title">
            Today's To Do List
        </h3>
        <div class="textToDo">
        	<h5>날짜</h5>
      		<input type="text" placeholder="날짜를 클릭하면 입력됩니다." readonly>
      		<h5><a href="">식단 칼로리 총량</a></h5>
        	<input type="text" name="total" id="total" value="0">
        	<h5><a href="">운동 칼로리 총량</a></h5>       	
        	<input type="text" name="extime" id="extime" value="0"> 
        	<br />      	
        	<input type="hidden" name="user_id" value="temp" >     
        	<a class="btn btn-success" href="/user/user_my" style="margin-top: 10px; margin-left: 45%" role="button" id="submit">보내기</a>   
            <!-- 삭제시 달력 사라짐 -->
           	<button class="textToDo-button add" hidden="hidden" ></button>
            <button class="textToDo-button reset" hidden="hidden" ></button>
            <button class="textToDo-button allreset" hidden="hidden" ></button>
        	
        </div>
        <ul class="todoList"></ul>
    </section>
    
    
<%@include file="../includes/footer.jsp" %>