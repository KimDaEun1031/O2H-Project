<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
	<div>
		<p>userId : ${profile.userId}</p>
		<p>userName : ${profile.userName}</p>
		<p>teacherInfo : ${profile.teacherInfo}</p>
		<p>mainSports : ${profile.mainSports}</p>
		<p>channelId : ${profile.channelId}</p>
	</div>
	
	<div>
		<button onclick="location.href='/user/teacher_profile'">강사 프로필 수정</button>
		<form></form>
	</div>
	
	<div>
		<button onclick="location.href='/user/teacher_video'">비디오 목록 보기</button>
		<form></form>
	</div>
	

	
<%@include file="../includes/footer.jsp" %>