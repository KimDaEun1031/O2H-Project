<%@page import="com.company.domain.KDLoginVO"%>
<%@page import="com.company.domain.YHAnnouceReplyVO"%>
<%@page import="java.util.List"%>
<%@page import="com.company.domain.KDLoginInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<span>서울 단체 채팅방</span>
				</div>
			</div>
		</div>
	</div>
</div>

<div style="padding: 10%">
	<textarea rows="20" cols="100" readonly="readonly" id="chatBox"></textarea>
	<input type="text" size="100" style="width: 70" id="inputBox">
	<button id="inputBtn">입력</button>
	
	<button id="goOut">나가기</button>


</div>
<script>
	var data;
	var inputBtn = document.getElementById("inputBtn");
	var inputArea = document.getElementById("inputBox");
	var chatBox = document.getElementById("chatBox");
	var goOutBtn = document.getElementById("goOut");
	var inputText;
	var getthing=document.getElementById("getThing");
	
	var isAdmin = 2;
	if ("${loginInfo.userId}" == "admin") {
		isAdmin = 1;
	}
	var xhr = new XMLHttpRequest();
	
	inputBtn.onclick = function(e) {
		
		inputText = inputArea.value;
		inputArea.value = "";
		var xhr = new XMLHttpRequest();
		var want;
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					want = xhr.response;
					//chatBox.value = want;
					var wantJson=JSON.parse(want);
					
					console.log(wantJson);
					var str="";
					for(var i=wantJson.length-1;i>=0;i--){
						
							str+=wantJson[i].user_id +" : "+wantJson[i].content+"\n";
						
						chatBox.value = str;	
					}
				}
			}
		}
		
		
		
		xhr.open("get", "/chatAjax/seoul?content=" + inputText + "&user_id=${loginInfo.userId}");
		xhr.send();
	}

	goOutBtn.onclick = function(e) {
		
		e.preventDefault();
		inputText = inputArea.value;
		inputArea.value = "";
		var xhr = new XMLHttpRequest();
		var want;
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					want = xhr.response;
					//chatBox.value = want;
					var wantJson=JSON.parse(want);
					
					console.log(wantJson);
					var str="";
					for(var i=wantJson.length-1;i>=0;i--){
						
							str+=wantJson[i].user_id +" : "+wantJson[i].content+"\n";
						
						chatBox.value = str;	
					}
				}
			}
		}
		
		
		
		xhr.open("get", "/chatAjax/seoul?content= 님이 퇴장했습니다&user_id=${loginInfo.userId}");
		xhr.send();
		location.replace("/areaChat/goOutSeoul");

	}
	window.onload=function(e) {
		
		inputText = inputArea.value;
		inputArea.value = "";
		var xhr = new XMLHttpRequest();
		var want;
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					want = xhr.response;
					//chatBox.value = want;
					var wantJson=JSON.parse(want);
					
					console.log(wantJson);
					var str="";
					for(var i=wantJson.length-1;i>=0;i--){
						
							str+=wantJson[i].user_id +" : "+wantJson[i].content+"\n";
						
						chatBox.value = str;	
					}
				}
			}
		}
		
		
		
		xhr.open("get", "/chatAjax/seoul?content=${loginInfo.userId} 님이 접속했습니다 &user_id=${loginInfo.userId}");
		xhr.send();
	}
		
	
</script>

<%@include file="../includes/footer.jsp"%>
</html>
