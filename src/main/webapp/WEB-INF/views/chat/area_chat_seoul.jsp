<%@page import="com.company.domain.KDLoginVO"%>
<%@page import="com.company.domain.YHAnnouceReplyVO"%>
<%@page import="java.util.List"%>
<%@page import="com.company.domain.KDLoginInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
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
	.chat-container {
		display: flex;
		flex-flow: row wrap;
		margin: 30px;	
	}
	#chatBox {
		margin: 0 auto;
		resize: none;
	}
	.chatInput-container {
		display: flex;
		flex-flow: row wrap;
		
	}
	#inputBox {
		margin: 0 auto;
		
	}
	.chatBtn-container {
		margin-left: 45%;
	}
	#inputBtn, #goOut {	
		margin-left: 15px;			
		margin-top: 30px;
		
	}
</style>
<!-- Breadcrumb Section Begin -->
	<div class="breacrumb-section">
	      <div class="container">
	        <div class="row">
	          <div class="col-lg-12">
	            <div class="breadcrumb-text">
	              <a class="nav-link nav-link-2" href="/areaChat/goSeoul">서울 지역 채팅방</a>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
		

	<div class="chat-container">
		<textarea rows="20" cols="100" readonly="readonly" id="chatBox"></textarea>
	</div>
	<div class="chatInput-container">
		<input type="text" size="100" style="width: 70" id="inputBox">	
			
	</div>
	<div class="chatBtn-container">
		<button id="inputBtn" class="btn btn-success">입력</button>		
		<button id="getItBtn" class="btn btn-success">가져오기</button>		
		<button id="goOut" class="btn btn-primary">나가기</button>
	</div>	
<script>
	var data;
	var inputBtn = document.getElementById("inputBtn");
	var inputArea = document.getElementById("inputBox");
	var chatBox = document.getElementById("chatBox");
	var goOutBtn = document.getElementById("goOut");
	var inputText;
	var getItBtn=document.getElementById("getItBtn")
	var getthing=document.getElementById("getThing");
	
	var isAdmin = 2;
	if ("${loginInfo.userId}" == "admin") {
		isAdmin = 1;
	}
	var xhr = new XMLHttpRequest();
	
	function hello(){
var xhr = new XMLHttpRequest();
		
		
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
		
		
		
		xhr.open("get", "/chatAjax/seoulre");
		xhr.send();
	}
	getItBtn.onclick = function(e) {
		var xhr = new XMLHttpRequest();
		
		
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
		
		
		
		xhr.open("get", "/chatAjax/seoulre");
		xhr.send();
	}
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
	setInterval(hello,5000);
	
</script>

<%@include file="../includes/footer.jsp"%>
</html>
