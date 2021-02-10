/**
 * 파일첨부와 관련된 스크립트

 */


$(function(){
	
	//게시글 등록 버튼 등작-과 관련된 스크립트
	$("input[type='submit']").click(function(e){ //버튼 하나니까. 상관없지 - 버튼 아니였음. 
	//$("#update-btn").click(function(e){ //영역 다시 잡음 210205
		e.preventDefault();

		var str = "";
		//첨부파일 영역에 정보 수집
		$(".uploadResult ul li").each(function(idx,obj){
		//$("#myImg").each(function(idx,obj){ //str이 안잡혀서 영역 다시 잡음-근데 에러가 나네? 400.
		//$("input[name='uploadFile']").each(function(idx,obj){ //아래 append 한 부분꺼 영역 가져옴
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
		//var form = $(".infoUpdateForm"); //폼을 두개로 나누면서 폼에 넣을 영역 다시 잡음
		var form = $("form[role='form']"); //폼이 하나니까 상관없지 + 아니야. form 이 header 쪽에 하나 더 있었던듯. 입력이 안됐었음. 210208
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
	
	//img 태그에 넣어서 보여주는 방식
	function showUploadedFile(profile) { // 받을 변수 하나 설정해 둔+위에서 
		//결과를 보여줄 영역 가져오기
		var profileImg = $("#myImg");	
			
		//var fileCallPath = encodeURIComponent(profile.uploadPath+"\\s_"+profile.uuid+"_"+profile.fileName);	
		var fileCallPath = encodeURIComponent(profile.uploadPath+"\\"+profile.uuid+"_"+profile.fileName); //썸네일 말고 원본이 뜨게 해보자-이거만 하니까 안나와서 아래도 바꿈.-안나옴.
		
		profileImg.attr('src','/photoBoardDisplay?fileName='+fileCallPath);			
			
	
	}// 첨부파일 보여주기 종료 
	
	
	//게시글 등록 버튼 등작-과 관련된 스크립트<- 위에 있는 이게 못 읽어서
	//원래 있던거 추가함 display:none 으로 하고
	//ul-li로 보여주는 방식 - 이거 없으면 못 읽어옴
	function showUploadedFile2(uploadResultArr) { // 받을 변수 하나 설정해 둔+위에서 
			//결과를 보여줄 영역 가져오기
			var uploadResult = $(".uploadResult ul");
			var str="";		
			$(uploadResultArr).each(function(idx,obj) { // var i=0 - idx - 인덱스 /// obj - 행 가져오기
				if(obj.fileType){//formDate에 넣어서 보내고 - 서버에 들어갔다가 결과 가지고 나온거?-vo files에 넣고서 돌렸지
					//썸네일 이미지 경로 uploadPath - 2021\01\20
					var fileCallPath = encodeURIComponent(obj.uploadPath+"\\s_"+obj.uuid+"_"+obj.fileName);
					//var fileCallPath = encodeURIComponent(obj.uploadPath+obj.uuid+"_"+obj.fileName); //썸네일이 아니라 원본이 뜨게 해보자.
					
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
	
	//크게 열린 이미지 다시 닫기
	$(".bigPictureWrapper").click(function(){
		$(".bigPicture").animate({width:'0%', hight:'0%'},1000);
		setTimeout(function(){
			$(".bigPictureWrapper").hide();
		},1000);
	})// 이미지 닫기 종료





})

function showImage(fileCallPath) {
	$(".bigPictureWrapper").css("display","flex").show();
	$(".bigPicture").html("<img src='/photoBoardDisplay?fileName="+fileCallPath+"'>")
					.animate({width:'100%', hight:'100%'},1000);
}