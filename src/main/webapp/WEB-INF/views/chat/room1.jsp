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
					<span>문의 대화방 1</span>
				</div>
			</div>
		</div>
	</div>
</div>

<div style="padding: 10%">
	<textarea rows="100" cols="100" readonly="readonly" id="chatBox"></textarea>
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
		alert("sibal..pigonhee");
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
					for(var i=0;i<wantJson.length;i++){
						if(wantJson[i].fromId==2){
							str+="당신 : "+wantJson[i].content+"\n";
						}else{
							str+="운영자 :"+wantJson[i].content+"\n";
						}
						console.log(str +"ㅇㅅㅇ?");
						chatBox.value = str;	
					}
				}
			}
		}
		
		
		alert(isAdmin);
		xhr.open("get", "/chatAjax/room1?content=" + inputText + "&fromid="
				+ isAdmin);
		xhr.send();
	}

	goOutBtn.onclick = function(e) {
		alert("hello");
		e.preventDefault();
		location.replace("/chat/goOutRoom1");

	}
</script>

<%@include file="../includes/footer.jsp"%>
</html>
