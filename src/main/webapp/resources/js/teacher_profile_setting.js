/**
 * 파일첨부와 관련된 스크립트
 * 유효성 검증
 */
$(function() {//비밀번호
	$("#profile-form").validate({
		//규칙정의 - 이름
		rules:{
			userInfo : {
				required:true,
				validInfo:true,
				maxLengthByte:300
			}
		},//rules
		//규칙에 대한 메세지 정의
		messages:{
			userInfo : {
				required:"프로필 정보를 입력해 주세요.",
				maxLengthByte:"한글 1~100자, 영어-숫자 1~300자"				
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
$.validator.addMethod("validInfo", function(value) {
	var regInfo = /^[가-힣A-Za-z\d\s,\.!@#$%^&+<>=*\/\|"';:?~`()\[\]\{\}_-]+$/;
	return regInfo.test(value);
}, "프로필 내용을 확인해 주세요.");

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
}, "영어-숫자 1~300자, 한글 1~100자 제한");


/**
 * 파일첨부와 관련된 스크립트
 *
 */

$(function(){
	
	//게시글 등록 버튼 등작-과 관련된 스크립트
	$("button[type='submit']").click(function(e){
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
		var form = $("form");
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
		var files = inputFile[0].files; //$("input[name='uploadFile']")

		var formData = new FormData();
		//객체 안에 요소 추가
		for(var i=0;i<files.length;i++){
			formData.append("uploadFile",files[i]);
		}

		$.ajax({
			url:'/uploadAjax',
			type:'post',
			processData:false, //데이터를 query string 형태로 보낼 것인지 결정
			contentType:false, //기본값 application/x-www-form-urlencoded (파일첨부이므로 multipart/form-data로 전송 필요)
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
	}// 첨부파일 보여주기 종료 
	
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
					str+="<i class='fa fa-times'></i>";
					str+="</button>";
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