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
	.waitContainer {
		display: flex;
		flex-flow: row wrap;
		margin-left: 30%;	
		margin-right: 30%;	
		margin-top: 10%;	
	}
	
	.waitContainer h5, input {
		margin: 0 auto;
	}
	
	.waitBtn {
		display: flex;
		margin-left: 30%;	
		margin-right: 30%;	
		margin-top: 10%;	
	}
	
	.waitBtn input {
		margin: 0 auto;
	}
	

</style>
<body>
	<!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcrumb-text">
              <a class="nav-link nav-link-2" href="/chat/chat_list">실시간 문의 대기방</a>
            </div>
          </div>
        </div>
      </div>
    </div>
	<div style="height: 500px">
	<div id="hello"></div>
	<div class="waitContainer">
		<h5>현재 나의 티켓 은?</h5>
		<input type="text" value="${wait_ticket }" style="width: 100px; text-align: center;" id="waitTicket" readonly>
		<h5>내 앞의 대기 인원은?</h5>
		<input type="text" value="${wait_beforeme }" style="width: 100px; text-align: center;" id="waitArea" readonly>
	</div>
	<div class="waitBtn">
		<input type="button" id="wait" class="btn btn-secondary" value="다시 확인">
		<input type="button" id="useable" class="btn btn-info" value="방에 사람 있는지 확인" hidden="hidden">
		<input type="button" id="getIn" class="btn btn-success" value="들어가기" hidden="hidden">
		<input type="button" id="getOutBtn" class="btn btn-danger" value="나가기" >
	</div>	
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
			alert("실시간 문의 방을 나가셨습니다.");
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
