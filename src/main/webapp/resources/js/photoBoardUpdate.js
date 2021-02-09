/**
 * 파일첨부와 관련된 스크립트

 */

$(document).ready(function(){
	
	var uploadResult = $(".uploadResult ul"); // 에러!!!
	
	$.getJSON({
		//url:'getAttachList',
		//url:'/program/getAttachList',
		//url:'/user/getAttachList',
		url:'/board/getAttachList',
		data: {
			bno:bnoVal	//at HTMLDocument.<anonymous> 에러남-변수''에 담으니까 에러 없어짐.
		},
		success:function(data){
			console.log(data);
			
			var str = "";
			
			$(data).each(function(idx,obj){
				if(obj.fileType){
					//썸네일 이미지 경로 uploadPath - 2021\01\20
					var fileCallPath = encodeURIComponent(obj.uploadPath+"\\s_"+obj.uuid+"_"+obj.fileName);
				
					str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'";
					str+="data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
					str+="<img src='/photoBoardDisplay?fileName="+fileCallPath+"'><div>"+obj.fileName;
					str+="</div></li>";	
					
					//이렇게 되는구나 - 와 신기하다.
					var profileImg = $("#myImg");
					
					//var fileCallPath = encodeURIComponent(obj.uploadPath+"\\s_"+obj.uuid+"_"+obj.fileName); //썸네일로 보기
					var fileCallPath = encodeURIComponent(obj.uploadPath+"\\"+obj.uuid+"_"+obj.fileName); //원본으로 보기
					
					profileImg.attr('src','/photoBoardDisplay?fileName='+fileCallPath);
					
				}
								
			})//each 종료
			uploadResult.html(str);
		} //success
	}) //getJSON 종료
	
	//이미지 클릭시 원본 이미지 보여주기, 일반파일은 다운로드
	$(uploadResult).on("click","li",function(){
		var liObj = $(this);
		
		var path = encodeURIComponent(liObj.data("path")+"\\"+liObj.data("uuid")+"_"
					+liObj.data("filename"));
				
		if(liObj.data("type")){
			showImage(path.replace(new RegExp(/\\/g),"/"));
		}else{
			location.href="/photoBoardDownload?fileName="+path;
		}		
	})
	
	
	
	//크게 열린 이미지 다시 닫기
	$(".bigPictureWrapper").click(function(){
		$(".bigPicture").animate({width:'0%', hight:'0%'},1000);
		setTimeout(function(){
			$(".bigPictureWrapper").hide();
		},1000);
	})// 이미지 닫기 종료

	
	//x 버튼 클릭 - 이벤트 위임
	$(".uploadResult").on("click","button",function(){
		
		//해당 파일 경로 가져오기
		var targetFile=$(this).data("file");
		//파일 타입 가져오기
		var type=$(this).data("type");
		//span 태그가 속한 부모 li 태그 가져오기-가장 가까운 태그 가져오기 .closest
		var targetLi=$(this).closest("li");

		
		//서버 폴더에서 제거
		$.ajax({
			url:'/photoBoardDeleteFile',
			type:'post',
			data:{
				fileName:targetFile,
				type:type
			},
			success:function(result){
				console.log(result);
				//화면 목록에서 제거
				targetLi.remove();
			}
		})	
	})// x버튼 종료
	
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
			url:'/photoBoardUploadAjax',
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
			
		//var fileCallPath = encodeURIComponent(profile.uploadPath+"\\s_"+profile.uuid+"_"+profile.fileName);	//썸네일로 보여주기
		var fileCallPath = encodeURIComponent(profile.uploadPath+"\\"+profile.uuid+"_"+profile.fileName);		//원본 이미지로 보여주기
		
		profileImg.attr('src','/photoBoardDisplay?fileName='+fileCallPath);			
			
	
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
					str+="<img src='/photoBoardDisplay?fileName="+fileCallPath+"'><div>"+obj.fileName+"</a>";
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
	$(".bigPicture").html("<img src='/photoBoardDisplay?fileName="+fileCallPath+"'>")
					.animate({width:'100%', hight:'100%'},1000);
}