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
	<form action="/user/teacher_profile" method="POST">
		<div class="limiter">
			<div class="container-table100">
				<div class="wrap-table100">
					<div class="table100">
						<table>
							<thead>
							  <tr class="table100-head">	
							  	<th class="column3" rowspan="8"><span class="floatImage"><img src='/user/teacherProfileDisplay?fileName=s_${profile.userId}' onerror='this.src="/resources/img/profile/default_user.jpg";this.parentNode.className="";' /></span></th>				  
							    <th class="column1">아이디</th>
							    <th class="column2"><input type="text" style="background-color:transparent; border:none; text-align: center;" name="userId" value="${profile.userId}" placeholder="${profile.userId}" readonly /></th>
							  </tr>
							  <tr>
							    <td class="column1">이름</td>
							    <td class="column2"><input type="text" style="background-color:transparent; border:none; text-align: center;" name="userName" value="${profile.userName}" placeholder="${profile.userName}" readonly /></td>
							  </tr>
							  <tr>
							    <td class="column1">강사 정보</td>
							    <td class="column2"><input type="text" style="background-color:transparent; border:none; text-align: center;" name="teacherInfo" value="${profile.teacherInfo}" placeholder="${profile.teacherInfo}" /></td>
							  </tr>
							  <tr>
							    <td class="column1">담당 운동</td>
							    <td class="column2"><input type="text" style="background-color:transparent; border:none; text-align: center;" name="mainSports" value="${profile.mainSports}" placeholder="${profile.mainSports}" /></td>
							  </tr>
							  <tr>
							    <td class="column1">채널 아이디</td>
							    <td class="column2"><input type="text" style="background-color:transparent; border:none; text-align: center;"  name="channelId" value="${profile.channelId}" placeholder="${profile.channelId}" /></td>
							  </tr>					  
							</thead>
						</table>
	 				</div>
				</div>
			</div>
		</div>
		<div>
			<p style="text-align: center; font-size: 20px; font-weight: bold;"> 강사 정보, 담당 운동, 채널아이디를 변경하실 수 있습니다. </p>
		</div>
		<!--<span class="floatImage"><img src='/user/teacherProfileDisplay?fileName=s_${profile.userId}' /></span>-->
		<div class="flex-container-te">
			<div>
				<button class="btn btn-info" type="submit" data-oper='list'>돌아가기</button> 
				<button class="btn btn-success" type="submit" data-oper='submit'>저장하기</button>
				<button class="btn btn-danger" type="reset" data-oper='reset'>초기화</button>        		
			</div>			
		</div>			
	</form>

	
	<!-- 원본 이미지 창 -->
	<div class="bigPictureWrapper">
		<div class="bigPicture"></div>
	</div>
	<div>
		<div class="UploadDiv">
			<input style="margin-left: 3%;" type="file" name="uploadFile" />
		</div>
		<!-- 업로드 결과 창 -->
		<div class="uploadResult">
			<ul></ul>
		</div>
	</div>    
	<script>
		var updateForm = $("form[action='/user/teacher_profile']");
		var fileForm = $("input[type='file']");
		var uploadFiles = $(".uploadResult ul");
		
		var bigPictureWrapper = $(".bigPictureWrapper"); // 원본 이미지 통합 창
		var bigPicture = $(".bigPicture"); // 원본 이미지 창
		
		var fileFormFunc = function(event) {
			if (confirm("overwrite")) {
				var file = $(this)[0].files[0];
				var formData = new FormData();

				formData.append("uploadFile", file);
				
				$.ajax({
					url: "/user/teacherProfileUpload",
					type: "post",
					contentType: false,
					processData: false,
					data: formData,
					success: showUploadedFile,
					error: function(jqXHR, textStatus) {
						console.log(jqXHR.responseText);
					}
				});				
			} else {
				fileForm.val("");
			}
		};
		
		var showUploadedFile = function(uploadResult) {
			var str = "<li class='floatImage'><img src='" + "/user/teacherTemporaryDisplay?fileName=s_" + "${profile.userId}" + "&rnd=" + Math.random() + "' /></li>";
			
			uploadFiles.html(str);
			
			fileForm.val("");
		};
		
		var showProfileImage = function(event) {
			event.preventDefault();
			
			bigPictureWrapper.css("display", "flex").show();
			bigPicture
			.html("<img src='/user/teacherProfileDisplay?fileName=${profile.userId}" + "&rnd=" + Math.random() + "' />")
			.animate({
				width: "100%",
				height: "100%"
				}, 1000
			);
		}
		
		var showTemporaryImage = function(event) {
			event.preventDefault();
			
			bigPictureWrapper.css("display", "flex").show();
			bigPicture
			.html("<img src='/user/teacherTemporaryDisplay?fileName=${profile.userId}" + "&rnd=" + Math.random() + "' />")
			.animate({
				width: "100%",
				height: "100%"
				}, 1000
			);
		}
		
		var hideImage = function(event) {
			bigPicture
			.animate({
				width: "0%",
				height: "0%"
				}, 1000);
			setTimeout(() => {
				$(".bigPictureWrapper").hide();
				}, 1000);
		}
		
		fileForm.change(fileFormFunc);

		updateForm.on("click", ".floatImage", showProfileImage);
		uploadFiles.on("click", ".floatImage", showTemporaryImage);
		
		bigPictureWrapper.on("click", hideImage);
		
		$("button").click(function(e) {
			var oper = $(this).data("oper");
			
			if (oper == "list") {
				e.preventDefault();

				location.href = "/user/teacher_page";
			} else {
				return;	
			}
		});
	</script>
<%@include file="../includes/footer.jsp" %>