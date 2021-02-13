/**
 * 파일첨부와 관련된 스크립트
 */
$(function(){
	
	//게시글 등록 버튼 등작-과 관련된 스크립트
	$("button[type='submit']").click(function(e){
		e.preventDefault();
		
		//첨부파일 등록 필수
		var imgAttach = $("#myImg").attr("src");
		if(!imgAttach){
			alert("사진 게시판입니다.\n첨부파일을 등록해 주세요.");
			console.log(imgAttach);
			return false;
		}
		
		var str = "";

		var job = $("#myImg");
		//수집된 정보를 hidden 태그로 작성
		str+="<input type='hidden' name='attach.uuid' value='"+job.data("uuid")+"'>";
		str+="<input type='hidden' name='attach.uploadPath' value='"+job.data("path")+"'>";
		str+="<input type='hidden' name='attach.fileName' value='"+job.data("filename")+"'>";
		str+="<input type='hidden' name='attach.fileType' value='"+job.data("type")+"'>";			

		console.log(str);
		
		//hidden 태그를 게시글 등록 폼에 추가한 후 폼 전송하기
		//1. 게시글 등록 폼 가져오기
		var form = $("form[role='form']");
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
			url:'/photoBoardUploadAjax',
			type:'post',
			processData:false, //데이터를 query string 형태로 보낼 것인지 결정
			contentType:false, //기본값은 application/x-www-form-urlencoded (파일첨부이므로 multipart/form-data로 보내야 함)
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
	
	//img 태그로 보여주는 방식
	function showUploadedFile(profile) { 
		//결과를 보여줄 영역 가져오기
		var profileImg = $("#myImg");	
			
		var fileCallPath = encodeURIComponent(profile.uploadPath+"\\"+profile.uuid+"_"+profile.fileName);
		
		profileImg.attr('src','/photoBoardDisplay?fileName='+fileCallPath);		
		profileImg.attr('data-path',profile.uploadPath);
		profileImg.attr('data-uuid',profile.uuid);
		profileImg.attr('data-filename',profile.fileName);
		profileImg.attr('data-type',profile.fileType);	
	
	}// 첨부파일 보여주기 종료 
})