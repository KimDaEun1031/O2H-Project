/**
 * 정보 첨부물 보여주기
 */
//첨부물
$(document).ready(function(){
	
	var uploadResult = $(".uploadResult ul");
	
	$.getJSON({
		url:'/user/getAttachList',
		data: {
			userId:userIdVal
		},
		success:function(data){
			console.log(data);
			
			var str = "";
			
			$(data).each(function(idx,obj){
				if(obj.fileType){
					//썸네일 이미지 경로 uploadPath - 2021\01\20
					var profileImg = $("#myImg");
					
					var fileCallPath = encodeURIComponent(obj.uploadPath+"\\s_"+obj.uuid+"_"+obj.fileName);
					
					profileImg.attr('src','/display?fileName='+fileCallPath);
				}
								
			})
		}
	}) //getJSON 종료
	
	//이미지 클릭시 원본 이미지 보여주기, 일반파일은 다운로드
	$(uploadResult).on("click","li",function(){
		var liObj = $(this);
		
		var path = encodeURIComponent(liObj.data("path")+"\\"+liObj.data("uuid")+"_"
					+liObj.data("filename"));
				
		if(liObj.data("type")){
			showImage(path.replace(new RegExp(/\\/g),"/"));
		}else{
			location.href="/download?fileName="+path;
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
	$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>")
					.animate({width:'100%', hight:'100%'},1000);
}
