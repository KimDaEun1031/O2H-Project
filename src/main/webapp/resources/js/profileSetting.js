/**원본
 * 파일첨부와 관련된 스크립트
 * 유효성 검증
 */
$(function() {//비밀번호
	$(".passwordForm").validate({
		//규칙정의 - name 요소
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


$(function() { //회원정보
	$(".infoUpdateForm").validate({
		//규칙정의
		rules:{
			userEmail : {
				required:true,
				validEmail:true
			},
			userName : {
				required:true,
				validName:true,
				maxLengthByte:10							
			},
			address : {
				required:true,
				validAddr:true,
				maxLengthByte:100
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
				maxLengthByte:"한글 1~3자, 영어-숫자 1~10자"
			},
			address : {
				required:"주소를 입력해주세요.",
				maxLengthByte:"한글 1~33자, 영어-숫자 1~100자"				
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
//사용자 검증 메소드 추가-이름
$.validator.addMethod("validName", function(value) {
	var regName = /^[가-힣a-zA-Z0-9]+$/;
	return regName.test(value);
}, "이름을 확인해 주세요. 한글, 영어, 숫자 가능");
//사용자 검증 메소드 추가-주소
$.validator.addMethod("validAddr", function(value) {
	var regAddr = /^[가-힣A-Za-z\d\s]+$/;
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

/*바이트 체크 함수*/
function getByteB(str) {
    var byte = 0;
    for (var i = 0; i < str.length; ++i) {
        // 기본 한글 3바이트 처리 ( UTF-8 )
        (str.charCodeAt(i) > 127) ? byte += 3 : byte++;
    }
    return byte;
}
/*input 바이트 길이 체크 (type=file) 가능 */
$.validator.addMethod("maxLengthByte", function (str, element, param) {
    var byte = 0, result = true;
    if (str) {
        byte +=  getByteB(str);
        if (byte > param) {
            result = false;
        }
    }
    return this.optional(element) || result;
}, "영어-숫자 1~10자, 한글 1~3자 제한");


/**
 * 파일첨부와 관련된 스크립트
 *
 */

$(function(){
	
	//비밀번호 변경
	$("#pwd-btn").click(function(e){ 
		e.preventDefault();
		var form = $(".passwordForm");
		form.submit();		
	})	
			
	//게시글 등록 버튼 등작-과 관련된 스크립트
	$("#update-btn").click(function(e){ 
		e.preventDefault();
		
		//첨부파일 없으면 alert 창 보냄
		var imgAttach = $("#myImg").attr("src"); 
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
		var form = $(".infoUpdateForm"); 
		//2. 폼에 추가하기
		form.append(str);
		//3. 전송
		form.submit();				
	})
	
		
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
				showUploadedFile2(result); 
				$("input[name='uploadFile']").val(""); //업로드 성공 후 기존 파일명 제거
			},
			error:function(xhr,status,error){
				console.log(status);
			}
		})	
	})//파일첨부 종료
	
	function showUploadedFile(profile) { 
		//결과를 보여줄 영역 가져오기
		var profileImg = $("#myImg");	
			
		var fileCallPath = encodeURIComponent(profile.uploadPath+"\\s_"+profile.uuid+"_"+profile.fileName);	
		
		profileImg.attr('src','/display?fileName='+fileCallPath);	
		
		console.log(profileImg);					
			
	}// 첨부파일 보여주기 종료 
	
	
	//게시글 등록 버튼 동작
	function showUploadedFile2(uploadResultArr) { 
			//결과를 보여줄 영역 가져오기
			var uploadResult = $(".uploadResult ul");
			var str="";		
			$(uploadResultArr).each(function(idx,obj) { 
				if(obj.fileType){
					//썸네일 이미지 경로 uploadPath - 2021\01\20
					var fileCallPath = encodeURIComponent(obj.uploadPath+"\\s_"+obj.uuid+"_"+obj.fileName);
					
					//원본 이미지 경로
					var originPath = obj.uploadPath+"\\"+obj.uuid+"_"+obj.fileName;
					
					originPath = originPath.replace(new RegExp(/\\/g),"/");
					
					str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'";
					str+="data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
					str+="<a href=\"javascript:showImage(\'"+originPath+"\')\">"; 		
					str+="<img src='/display?fileName="+fileCallPath+"'><div>"+obj.fileName+"</a>";
					str+="<button type='button' class='btn btn-warning btn-circle' data-file='";
					str+=fileCallPath+"' data-type='image'>";
					str+="<i class='fa fa-times'></i>"
					str+="</button>"
					str+="</div></li>";			
				}
			}); //  - .each
			uploadResult.append(str); 
		}// 첨부파일 보여주기 종료
})
function showImage(fileCallPath) {
	$(".bigPictureWrapper").css("display","flex").show();
	$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>")
					.animate({width:'100%', hight:'100%'},1000);
}