/**
 * 내 정보 첨부물 보여주기
 */
//첨부물
$(document).ready(function(){
	
	var uploadResult = $(".uploadResult ul"); // 에러!!!
	
	$.getJSON({
		//url:'getAttachList',
		//url:'/program/getAttachList',
		url:'/board/getAttachList', //맞다 이거 주소마다 바꿔줘야했었지- 안되네
		data: {
			bno:bnoVal	//at HTMLDocument.<anonymous> 에러남-변수''에 담으니까 에러 없어짐.
						//이거 맨처음 bno만 가져왔나본데? 왜?
		},
		success:function(data){
			console.log(data);
			
			var str = "";
			
			$(data).each(function(idx,obj){
				if(obj.fileType){
					//썸네일 이미지 경로 uploadPath - 2021\01\20
					var fileCallPath = encodeURIComponent(obj.uploadPath+"\\s_"+obj.uuid+"_"+obj.fileName);
					
					//못써먹음 제대로 돌아가면 막을거임.
					str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"'";
					str+="data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
					//str+="<img src='/photoBoardDisplay?fileName="+fileCallPath+"'><div>"+obj.fileName;
					str+="<img src='/photoBoardDisplay?fileName="+fileCallPath+"'><div>";
					str+="</div></li>";	
					
					//이렇게 되는구나 - 와 신기하다.
					var profileImg = $("#myImg");
					
					var fileCallPath = encodeURIComponent(obj.uploadPath+"\\s_"+obj.uuid+"_"+obj.fileName);
					
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
	
	
	
	
	
})
function showImage(fileCallPath) {
	$(".bigPictureWrapper").css("display","flex").show();
	$(".bigPicture").html("<img src='/photoBoardDisplay?fileName="+fileCallPath+"'>")
					.animate({width:'100%', hight:'100%'},1000);
}
