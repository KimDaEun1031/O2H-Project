/**
 * 파일첨부와 관련된 스크립트
    passwordForm 유효성 검증-안되고 있음.
 */
$(function() {//비밀번호
	$(".passwordForm").validate({
		//규칙정의 - 이름
		rules:{
			password : {
				required:true
			},
			new_password : {
				required:true,
				validPwd:true
			},
			confirm_password : {
				required:true,
				validPwd:true,
				equalTo: "#new_password"
			}
		},//rules
		//규칙에 대한 메세지 정의
		messages:{
			password : {
				required:"현재 비밀번호를 입력해 주세요."
				
			},
			new_password : {
				required:"새로운 비밀번호를 입력해 주세요."
			},
			confirm_password : {
				required:"새로운 비밀번호를 입력해 주세요.",
				equalTo: "이전 비밀번호와 다릅니다"
			}
		},//messages
		
		errorPlacement:function(error,element) {
			$(element).closest("form")
					  .find("small[id='"+element.attr('id')+"']")
					  .append(error);
		},//messages
		
		success : function(label) {
			var name = label.attr('for');
			label.text(name+ ' is ok!');
		}


	});//"#modifyform").validate
});//function()

//사용자 검증 메소드 추가
$.validator.addMethod("validPwd", function(value) {
	var regPwd = /^(?=.*[\d])[A-Za-z\d!@#$%^&*]{5,15}$/;
	return regPwd.test(value);
}, "비밀번호를 5~15자리로 만들어 주세요");


$(function() { //이메일
	$(".infoUpdateForm").validate({
		//규칙정의 - 이름
		rules:{
			userEmail : {
				required:true,
				validEmail:true
			},
			userName : {
				required:true,
				validName:true
				//maxbytelength:10
				//rangelength : [1, 10]								
			},
			address : {
				required:true,
				validAddr:true
			},
			phoneNumber : {
				required:true,
				validPhone:true
			},			
			userBirth : {
				required:true,
				validBirth:true
			}			
		},//rules
		//규칙에 대한 메세지 정의
		messages:{
			userEmail : {
				required:"이메일을 입력해주세요."				
			},
			userName : {
				required:"이름을 입력해주세요.",
				//maxbytelength:"최대 {10}바이트 이하(한글 3자, 영숫자 10자)"
				//rangelength: "이름은 한글 2~3자리\n알파벳 1~10자 사이입니다."				
			},
			address : {
				required:"주소를 입력해주세요."				
			},
			phoneNumber : {
				required:"전화번호를 입력해주세요."				
			},
			userBirth : {
				required:"생일을 입력해주세요."				
			}
		},//messages
		
		errorPlacement:function(error,element) {
			$(element).closest("form")
					  .find("small[id='"+element.attr('id')+"']")
					  .append(error);
		},//messages
		
		success : function(label) {
			var name = label.attr('for');
			label.text(name+ ' is ok!');
		}


	});//"#modifyform").validate
});//function()

/*//사용자 검증 메소드 추가-이름
$.validator.addMethod("validName", function(value) {
	var regName = /^[가-힣|a-z|A-Z|0-9|\*]+$/;
	return regName.test(value);
}, "이름을 확인해 주세요.");*/

//사용자 검증 메소드 추가-이름
$.validator.addMethod("validName", function(value) {
	var regName = /^[a-z|A-Z|0-9|\*]{1,10}$/;
	return regName.test(value);
}, "이름을 확인해 주세요. 영어 숫자 1~10자");
//사용자 검증 메소드 추가-주소
$.validator.addMethod("validAddr", function(value) {
	var regAddr = /^[가-힣A-Za-z\d\s]{1,100}$/;
	return regAddr.test(value);
}, "주소를 확인해 주세요.");
//사용자 검증 메소드 추가-전화번호
$.validator.addMethod("validPhone", function(value) {
	var regPhone = /^(?=.*[\d])[\d]{1,13}$/;
	return regPhone.test(value);
}, "전화번호를 확인해 주세요.");
//사용자 검증 메소드 추가-이메일
$.validator.addMethod("validEmail", function(value) {
	var regEmail = /^.+@.+\..{1,50}$/;
	return regEmail.test(value);
}, "email을 확인해 주세요.");
//사용자 검증 메소드 추가-생일
$.validator.addMethod("validBirth", function(value) {
	var regBirth = /\d{4}-\d{2}-\d{2}$/;
	return regBirth.test(value);
}, "생일을 확인해 주세요.");


/**
 * 파일첨부와 관련된 스크립트

 */

$(function(){
	
	//비밀번호 변경
	$("#pwd-btn").click(function(e){ //비밀번호 변경이랑 info변경이랑 나눔 210212
		e.preventDefault();
		var form = $(".passwordForm");
		form.submit();		
	})	
			
	//게시글 등록 버튼 등작-과 관련된 스크립트
	$("#update-btn").click(function(e){ //영역 다시 잡음 210205
		e.preventDefault();
		
		//첨부파일 없으면 alert 창 보냄
		var imgAttach = $("#myImg").attr("src"); //.val() 붙였더니 에러남
			if(!imgAttach){
				alert("첨부파일을 등록 후 수정해주세요.");
				console.log(imgAttach);
				return false;
			}

		var str = "";
		//첨부파일 영역에 정보 수집
		$(".uploadResult ul li").each(function(idx,obj){
			var job = $(obj);
			//수집된 정보를 hidden 태그로 작성
			str+="<input type='hidden' name='attachList["+idx+"].uuid' value='"+job.data("uuid")+"'>";
			str+="<input type='hidden' name='attachList["+idx+"].uploadPath' value='"+job.data("path")+"'>";
			str+="<input type='hidden' name='attachList["+idx+"].fileName' value='"+job.data("filename")+"'>";
			str+="<input type='hidden' name='attachList["+idx+"].fileType' value='"+job.data("type")+"'>";			
		})
		console.log(str);
		
		//hidden 태그를 게시글 등록 폼에 추가한 후 폼 전송하기
		//1. 게시글 등록 폼 가져오기
		var form = $(".infoUpdateForm"); //폼을 두개로 나누면서 폼에 넣을 영역 다시 잡음
		//var form = $("form");
		//2. 폼에 추가하기
		form.append(str);
		//3. 전송
		form.submit();				
	})
	
		
	//파일버튼이 클릭되어 변화가 일어나는 경우
	//현재 목록의 파일을 서버로 보내서 저장하기
	//첨부파일 버튼 바꿀거면 여기서 어떻게 함수 변경해서-안해도 잘 되네
	$("input[type='file']").change(function(){
		console.log("업로드 호출");
		

		var inputFile = $("input[name='uploadFile']");
		console.log(inputFile);
		
		//첨부 파일 목록
		var files = inputFile[0].files; //$("input[name='uploadFile']")
		
		// <form> ~ </form> 대체 ajax로 데이터를 쉽게 전송할 수 있도록 해줌
		var formData = new FormData();  // formData == form 형식으로 submit 하듯이 갈 수 있게 해주는 멋진 녀석/ 속성 multipart/form-data
		//객체 안에 요소 추가
		for(var i=0;i<files.length;i++){
			formData.append("uploadFile",files[i]); // FormData객체에 첨부파일 붙여넣음 - 이거 key-value 써준거/추가하기,뒤에 붙이기
			// script로 .append 여기에서 key 값 써준거랑 == controller에서 파라미터로 multipartFile객체 변수명이랑 같아야함 
		}
		

		$.ajax({
			url:'/uploadAjax',
			type:'post',
			processData:false, //데이터를 query string 형태로 보낼 것인지 결정
			contentType:false, //기본값은 application/x-www-form-urlencoded임(파일첨부이므로 multipart/form-data로 보내야 함)
			data:formData, // 위에서 객체에 요소추가한 것을 data로 보낸다?(데이타 형식이 아니라 변수명 쓴거였나?)-form 형식으로 submit 하듯이 갈 수 있게 해주는 멋진 녀석
			/*beforeSend:function(xhr){ //헤더에 토큰값 넣기 // 토큰 에러남
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},*/
			success:function(result){
				console.log(result);
				showUploadedFile(result); // 서버에서 돌아온 결과를 브라우저에 뿌려 - 여기서는 파일명을 뿌리는거지
				showUploadedFile2(result); // 서버에서 돌아온 결과를 브라우저에 뿌려 - 여기서는 파일명을 뿌리는거지
				$("input[name='uploadFile']").val(""); //업로드 성공 후 기존 파일명 제거
			},
			error:function(xhr,status,error){
				console.log(status);
			}
		})	

	})//파일첨부 종료
	
	function showUploadedFile(profile) { // 받을 변수 하나 설정해 둔+위에서 
		//결과를 보여줄 영역 가져오기
		var profileImg = $("#myImg");	
			
		var fileCallPath = encodeURIComponent(profile.uploadPath+"\\s_"+profile.uuid+"_"+profile.fileName);	
		
		profileImg.attr('src','/display?fileName='+fileCallPath);	
		
		console.log(profileImg);		
			
	
	}// 첨부파일 보여주기 종료 
	
	
	//게시글 등록 버튼 등작-과 관련된 스크립트<- 위에 있는 이게 못 읽어서
	//원래 있던거 추가함 display:none 으로 하고
	function showUploadedFile2(uploadResultArr) { // 받을 변수 하나 설정해 둔+위에서 
			//결과를 보여줄 영역 가져오기
			var uploadResult = $(".uploadResult ul");
			var str="";		
			$(uploadResultArr).each(function(idx,obj) { // var i=0 - idx - 인덱스 /// obj - 행 가져오기
				if(obj.fileType){//formDate에 넣어서 보내고 - 서버에 들어갔다가 결과 가지고 나온거?-vo files에 넣고서 돌렸지
					//썸네일 이미지 경로 uploadPath - 2021\01\20
					var fileCallPath = encodeURIComponent(obj.uploadPath+"\\s_"+obj.uuid+"_"+obj.fileName);
					
					//원본 이미지 경로
					var originPath = obj.uploadPath+"\\"+obj.uuid+"_"+obj.fileName;
					
					originPath = originPath.replace(new RegExp(/\\/g),"/");
					
					str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'";
					str+="data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
					str+="<a href=\"javascript:showImage(\'"+originPath+"\')\">"; 			//새미콜론 없어도 뜨네?!
					str+="<img src='/display?fileName="+fileCallPath+"'><div>"+obj.fileName+"</a>";
					str+="<button type='button' class='btn btn-warning btn-circle' data-file='";
					str+=fileCallPath+"' data-type='image'>";
					str+="<i class='fa fa-times'></i>"
					str+="</button>"
					str+="</div></li>";			
				}
			}); //  - .each
			uploadResult.append(str); // append - 뒤에 가져다 붙이기
		}// 첨부파일 보여주기 종료 - showUploadedFile




})

function showImage(fileCallPath) {
	$(".bigPictureWrapper").css("display","flex").show();
	$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>")
					.animate({width:'100%', hight:'100%'},1000);
}






//이거 안되네.
//그래 이미지 보여주는 것까지는 되네
//이제 img 태그에 있는 걸 src 받아서 서버랑 sql에 넘기는 것만 하면 되네
//data- 요소들을 잘 넘기면 됨

//   => 안됨. 아이디를 받아서 보여주는 것까지는 되는데. 그 보여준 이미지가 자동 저장이 안됨.
//		자동저장이 되지 않는 이상 보여주는 것에 클라이언트의 혼란만 줄 수 있으니 아예 보여주지 않도록 함.

/*
$(function(){
	
	//비밀번호 변경
	$("#pwd-btn").click(function(e){ //비밀번호 변경이랑 info변경이랑 나눔 210212
		e.preventDefault();
		var form = $(".passwordForm");
		form.submit();		
	})	

	
	//게시글 등록 버튼 등작-과 관련된 스크립트
	$("#update-btn").click(function(e){ //영역 다시 잡음 210205
		e.preventDefault();
		
		//첨부파일 없으면 alert 창 보냄
		var imgAttach = $("#myImg").attr("src"); //.val() 붙였더니 에러남
			if(!imgAttach){
				alert("첨부파일을 등록 후 수정해주세요.");
				console.log(imgAttach);
				return false;
			}

		var str = "";
		//첨부파일 영역에 정보 수집

		var job =  $("#myImg");
		//수집된 정보를 hidden 태그로 작성
		str+="<input type='hidden' name='attach.uuid' value='"+job.data("uuid")+"'>";
		str+="<input type='hidden' name='attach.uploadPath' value='"+job.data("path")+"'>";
		str+="<input type='hidden' name='attach.fileName' value='"+job.data("filename")+"'>";
		str+="<input type='hidden' name='attach.fileType' value='"+job.data("type")+"'>";	
		console.log("폼 src 확인"+str);
		
		//hidden 태그를 게시글 등록 폼에 추가한 후 폼 전송하기
		//1. 게시글 등록 폼 가져오기
		var form = $(".infoUpdateForm"); //폼을 두개로 나누면서 폼에 넣을 영역 다시 잡음
		//var form = $("form");
		//2. 폼에 추가하기
		form.append(str);
		//3. 전송
		form.submit();				
	})
})


$(document).ready(function(){ 
	
	$.getJSON({
		url:'/user/getAttachList',
		data: {
			userId:userIdVal
		},
		success:function(data){
			console.log(data);
			
			$(data).each(function(idx,obj){
				if(obj.fileType){
					var profileImg = $("#myImg");
					
					//썸네일 이미지 경로 uploadPath - 2021\01\20
					var fileCallPath = encodeURIComponent(obj.uploadPath+"\\s_"+obj.uuid+"_"+obj.fileName);
					
					profileImg.attr('src','/display?fileName='+fileCallPath);
					profileImg.attr('data-path',obj.uploadPath);
					profileImg.attr('data-uuid',obj.uuid);
					profileImg.attr('data-filename',obj.fileName);
					profileImg.attr('data-type',obj.fileType);
				}								
			})
		} 
	}) //getJSON 종료
	
	//파일버튼이 클릭되어 변화가 일어나는 경우
	//현재 목록의 파일을 서버로 보내서 저장하기
	$("input[type='file']").change(function(){
		console.log("업로드 호출");

		var inputFile = $("input[name='uploadFile']");
		console.log(inputFile);
		
		//첨부 파일 목록
		var files = inputFile[0].files;		
		
		var formData = new FormData();
		//객체 안에 요소 추가
		for(var i=0;i<files.length;i++){
			formData.append("uploadFile",files[i]);
		}		

		$.ajax({
			url:'/uploadAjax',
			type:'post',
			processData:false, //데이터를 query string 형태로 보낼 것인지 결정
			contentType:false, //기본값은 application/x-www-form-urlencoded임(파일첨부이므로 multipart/form-data로 보내야 함)
			data:formData,
			success:function(result){
				console.log(result);
				showUploadedFile(result); 				
				$("input[name='uploadFile']").val(""); //업로드 성공 후 기존 파일명 제거
			},
			error:function(xhr,status,error){
				console.log(status);
			}
		})	
	})//파일첨부 종료
	
	function showUploadedFile(profile) { // 받을 변수 하나 설정해 둔+위에서 
		//결과를 보여줄 영역 가져오기
		var profileImg = $("#myImg");	
			
		var fileCallPath = encodeURIComponent(profile.uploadPath+"\\s_"+profile.uuid+"_"+profile.fileName);	
		
		profileImg.attr('src','/display?fileName='+fileCallPath);	
		profileImg.attr('data-path',profile.uploadPath);
		profileImg.attr('data-uuid',profile.uuid);
		profileImg.attr('data-filename',profile.fileName);
		profileImg.attr('data-type',profile.fileType);	
		
		console.log(profileImg);
					
	}// 첨부파일 보여주기 종료 
})
*/