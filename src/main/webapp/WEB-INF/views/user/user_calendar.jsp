<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/calendar.css" />
    <link href="https://fonts.googleapis.com/css2?family=Epilogue:wght@500&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/c92986acdf.js" crossorigin="anonymous"></script>
    <script src="/resources/js/calendar.js" defer></script>
    <title>Document</title>
</head>
<body>
    <section class="main">
        <h1 class="main-title">달력</h1>
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
        <h1 class="todo-title">
            Today's To Do List
        </h1>
        <div class="textToDo">
      		<input type="text" >	
        	<input type="hidden" name="user_id" value="temp">     
        	<input type="text" name="total" id="total" value="0">       	
        	<input type="text" name="extime" id="extime" value="0">       	
        	<a class="textToDo-button" href="/helloworld/see" role="button" id="submit">보내기</a>   
            <!-- 삭제시 달력 사라짐 -->
           	<button class="textToDo-button add" hidden="hidden" ></button>
            <button class="textToDo-button reset" hidden="hidden" ></button>
            <button class="textToDo-button allreset" hidden="hidden" ></button>
        	
        </div>
        <ul class="todoList"></ul>
    </section>
    
    
   
</body>
</html>