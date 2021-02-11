<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
	<div>
		<form action="/user/teacher_profile" method="POST">
			<input type="text" name="userId" value="${profile.userId}" placeholder="${profile.userId}" readonly />
			<input type="text" name="userName" value="${profile.userName}" placeholder="${profile.userName}" readonly />
			<input type="text" name="teacherInfo" value="${profile.teacherInfo}" placeholder="${profile.teacherInfo}" />
			<input type="text" name="mainSports" value="${profile.mainSports}" placeholder="${profile.mainSports}" />
			<input type="text" name="channelId" value="${profile.channelId}" placeholder="${profile.channelId}" />
			
			<!--
			<span class="floatImage"><img src='/user/teacherProfileDisplay?fileName=s_${profile.userId}' /></span>
			-->
			<span class="floatImage"><img src='/user/teacherProfileDisplay?fileName=s_${profile.userId}' onerror='this.src="/resources/img/profile/profile_default.png";this.parentNode.className="";' /></span>
			<button type="submit" data-oper='list'>목록</button> 
			<button type="submit" data-oper='submit'>전송</button>
			<button type="reset" data-oper='reset'>초기화</button>        			
		</form>
	</div>
	
	<!-- 원본 이미지 창 -->
	<div class="bigPictureWrapper">
		<div class="bigPicture"></div>
	</div>
	<div>
		<div class="UploadDiv">
			<input type="file" name="uploadFile" />
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