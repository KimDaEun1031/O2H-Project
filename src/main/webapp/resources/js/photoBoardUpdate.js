/**
 * 파일첨부와 관련된 스크립트
 */
$(document).ready(function(){
	
	$.getJSON({
		url:'/board/getAttachList',
		data: {
			bno:bnoVal
		},
		success:function(data){
			console.log(data);
			
			$(data).each(function(idx,obj){
				if(obj.fileType){
					var profileImg = $("#myImg");
									
					//원본 이미지 경로 uploadPath - 2021\01\20													
					var fileCallPath = encodeURIComponent(obj.uploadPath+"\\"+obj.uuid+"_"+obj.fileName); //원본
					
					profileImg.attr('src','/photoBoardDisplay?fileName='+fileCallPath);
					//img 태그에 data-# 요소 추가
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
	
	function showUploadedFile(profile) {  
		//결과를 보여줄 영역 가져오기
		var profileImg = $("#myImg");				
		
		var fileCallPath = encodeURIComponent(profile.uploadPath+"\\"+profile.uuid+"_"+profile.fileName); //원본
		
		profileImg.attr('src','/photoBoardDisplay?fileName='+fileCallPath);			
		profileImg.attr('data-path',profile.uploadPath);
		profileImg.attr('data-uuid',profile.uuid);
		profileImg.attr('data-filename',profile.fileName);
		profileImg.attr('data-type',profile.fileType);	
	
	}// 첨부파일 보여주기 종료 		
})