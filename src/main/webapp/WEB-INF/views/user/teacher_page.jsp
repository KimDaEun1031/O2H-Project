<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
 	<link rel="stylesheet" href="/resources/css/user_my.css" />
    <link href="https://fonts.googleapis.com/css2?family=Epilogue:wght@500&display=swap" rel="stylesheet">
    <style>
    	.flex-container-te{
		  display: flex;		  
		}
		
		.flex-container-te > div {
			margin: 0 auto;
		}
		
    </style>
	 <div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
					<table>
						<thead>
						  <tr class="table100-head">						  
						    <th class="column1">아이디</th>
						    <th class="column2">${profile.userId}</th>
						  </tr>
						  <tr>
						    <td class="column1">이름</td>
						    <td class="column2">${profile.userName}</td>
						  </tr>
						  <tr>
						    <td class="column1">강사 정보</td>
						    <td class="column2">${profile.teacherInfo}</td>
						  </tr>
						  <tr>
						    <td class="column1">담당 운동</td>
						    <td class="column2">${profile.mainSports}</td>
						  </tr>
						  <tr>
						    <td class="column1">채널 아이디</td>
						    <td class="column2">${profile.channelId}</td>
						  </tr>					  
						</thead>
					</table>
 				</div>
			</div>
		</div>
	</div>
	
	<div class="flex-container-te">
		<div>
			<button class="btn btn-info" onclick="location.href='/user/teacher_profile'">수정하기</button>					
			<button class="btn btn-success"  onclick="location.href='/user/teacher_video'">영상 등록하기</button>		
		</div>
	</div>

	
<%@include file="../includes/user_footer.jsp" %>