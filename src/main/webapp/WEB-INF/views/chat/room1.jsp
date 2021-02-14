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
              <a class="nav-link nav-link-2" href="/chat/chat_list">실시간 문의 1번방</a>
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
		
		<button id="goOut" class="btn btn-primary">나가기</button>
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
					
					
					var str="";
					for(var i=wantJson.length-1;i>=0;i--){
						
						if(wantJson[i].fromId==2){
							str+="당신 : "+wantJson[i].content+"\n";
						}else{
							str+="운영자 :"+wantJson[i].content+"\n";
						}
						
						chatBox.value = str;	
					}
				}
			}
		}
		
		
		
		xhr.open("get", "/chatAjax/room1?content=" + inputText + "&fromid="
				+ isAdmin);
		xhr.send();
	}

	goOutBtn.onclick = function(e) {
		
		e.preventDefault();
		location.replace("/chat/goOutRoom1");

	}
</script>

<%@include file="../includes/footer.jsp"%>
</html>
