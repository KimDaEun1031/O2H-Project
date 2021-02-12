<%@page import="com.company.domain.KDLoginVO"%>
<%@page import="com.company.domain.YHAnnouceReplyVO"%>
<%@page import="java.util.List"%>
<%@page import="com.company.domain.KDLoginInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<body>
	<div style="height: 500px">
	<div id="hello"></div>
	현재 나의 티켓 은?
	<input type="text" value="${wait_ticket }" id="waitTicket">
	내 앞의 대기 인원은?
	<input type="text" value="${wait_beforeme }" id="waitArea">
	<input type="button" id="wait" value="다시 확인">
	<input type="button" id="useable" value="방에 사람 있는지 확인" hidden="hidden">
	<input type="button" id="getIn" value="들어가기" hidden="hidden">
	<input type="button" id="getOutBtn" value="나가기">
	<form id="getOut" action="/chat/goOutWaittingRoom1">
		<input type="text" name="ticket" value="${wait_ticket }" hidden="hidden"> 
	</form>
	<form id="getInForm" action="/chat/goInFromWaittingRoom1" hidden="hidden">
		<input type="text" name="ticket" value="${wait_ticket }" hidden="hidden"> 
	</form>
	
<script>
		var waitBtn=document.getElementById("wait");
		var getInBtn=document.getElementById("getIn");
		var place=document.getElementById("hello");
		var waitArea=document.getElementById("waitArea");
		var getOutBtn=document.getElementById("getOutBtn");
		var getOutForm=document.getElementById("getOut")
		var useableBtn=document.getElementById("useable");
		var getInForm=document.getElementById("getInForm");
		getOutBtn.onclick=function(e){
			alert("나가욧");
			getOutForm.submit();
			
		}
		waitBtn.onclick = function(e) {
			
			var myTicket = ${wait_ticket};
			
			var xhr = new XMLHttpRequest();
			var want;
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
						want = xhr.response;
						//chatBox.value = want;
						var wantJson=JSON.parse(want);
						
						console.log(wantJson);
						waitArea.value=wantJson;
						if(wantJson==0){
							useableBtn.removeAttribute("hidden");
							waitBtn.setAttribute("hidden","hidden");
						}
					}
					}
				}
			xhr.open("get", "/chatAjax/many?wait_ticket=${wait_ticket}");
			xhr.send();
			}
			

		
	useableBtn.onclick = function(e) {
			
			
			var xhr = new XMLHttpRequest();
			var want;
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
						want = xhr.response;
						console.log(want);
						//chatBox.value = want;
						var wantJson=JSON.parse(want);
						
						console.log(wantJson);
						
						if(wantJson==1){
							alert("사용 가능")
							getInBtn.removeAttribute("hidden");
							useableBtn.setAttribute("hidden","hidden");
							
						}else{
							alert("사용 불가")
						}
					}
					}
				}
			xhr.open("get", "/chatAjax/usable");
			xhr.send();
			}
		
	getInBtn.onclick=function(){
		getInForm.submit();
	}
			
			
		
</script>
</div>
</body>


<%@include file="../includes/footer.jsp"%>
</html>
