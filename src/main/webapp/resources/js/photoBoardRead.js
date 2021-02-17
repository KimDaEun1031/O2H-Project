/**
 * 내 정보 첨부물 보여주기
 */
//첨부물
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
					//썸네일 이미지 경로 uploadPath - 2021\01\20
					var profileImg = $("#myImg");					
					
					var fileCallPath = encodeURIComponent(obj.uploadPath+"\\"+obj.uuid+"_"+obj.fileName); //원본
					
					profileImg.attr('src','/photoBoardDisplay?fileName='+fileCallPath);					
				}

			})
		} 
	}) //getJSON 종료	
		
})
