<%-- <%@page import="com.company.domain.YHQandABoardVO"%>
<%@page import="java.util.List"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>
<style>
body {
    text-align: center;
}
/* 가운데 정렬 */
.wrap{
	width: 100%;
    text-align: center;
   /*  align-content: space-around; */
}
/* 테두리 박스 만들기 */
.wrap .col-xl-3{
	 border: 3px solid #009999;
	 /* border: 2px solid #009999; */
	 width: 100%;
	 margin: 10px;
	 padding: 10px;
}
/* 리스트 링크 */
.paginate_button a{
	/* color: #009999; */
	font-weight: 600;
	font-size: 1.5rem;
	font-family: 'Open Sans', 'Helvetica Neue', Arial, sans-serif;	
}
.paginate_button a{
	display: flex;
    justify-content: center;
    align-items: center;
    width: 60px;
    height: 60px;
    font-size: 1.1rem;
    color: #999;
    background-color: #EEEEEE;
    margin: 10px;
    border-radius: 5px;
    text-decoration: none;
    transition: all 0.3s ease;
}
.paginate_button a:hover{
	background-color: #009999;
    color: #fff; 
}
/* 글작성 버튼 */
.testBtn {
	display: flex;
    justify-content: center;
    align-items: center;
    width: 800px;
    height: 40px;
    font-size: 1.1rem;
    color: #999;
    background-color: #EEEEEE;
    margin: 10px;
    border-radius: 5px;
    text-decoration: none;
    transition: all 0.3s ease;
    border-radius: 300px;
}
/* img 태그 hover 시 이미지 확대 */
.scale {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
}
.scale:hover {
  transform: scale(1.2);
  -webkit-transform: scale(1.2);
  -moz-transform: scale(1.2);
  -ms-transform: scale(1.2);
  -o-transform: scale(1.2);
}
.center{
	margin: auto;
}
@media(min-width: 700px){

	.wrap{
		display: flex; /* 가로로 길게  */
		flex-wrap: wrap;
		justify-content: space-around;	
	}
	.wrap .col-xl-3{
		/* flex-wrap: nowrap; */
		/* flex-wrap: wrap; */
		 
	}
	.wrap .col-xl-3:nth-child(3){
		/* flex: none; */
	}
}
</style>
    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcrumb-text">
              <a href="board_photo_list"><span><b>사진 게시판</b></span></a>
            </div>
          </div>
        </div>
      </div>
    </div>
   <br />
  	<!-- 큰 버튼 -->
    <button type="button" class="btn btn-primary btn-block active center testBtn" onclick="location.href='/board/board_photo_write'" >글작성</button>
    <!-- <button type="button" style="height: 35px; font-weight: 900; border-radius: 300px; border: none; font-family: 'Open Sans', 'Helvetica Neue', Arial, sans-serif; max-width: 800px; min-width: 60px;" data-oper='list' class="btn btn-primary btn-block active center" onclick="location.href='/board/board_photo_write'" >글작성</button> -->
   <!--  <button type="button" style="height: 35px; font-size: 1rem; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; max-width: 600px; min-width: 60px;" data-oper='list' class="btn btn-primary btn-block active center" onclick="location.href='/board/board_photo_write'" >글작성</button> -->
    <!-- 작은 버튼 -->
    <!-- <input type="reset" data-oper='list' class="btn btn-primary tm-btn-next active" onclick="location.href='/board/board_photo_write'" value="글작성"> -->
    <!-- Breadcrumb Section Begin -->
<link rel="stylesheet" href="/resources/css/boardList.css" type="text/css" />

<div class="board_wrap" style="margin-top:20px">
   
     <table class="board_list" style="text-align: center;">
       <caption>
         게시판 목록
       </caption>
       
       
   <div class="wrap">
     <!-- 게시판 리스트 반복문 : 박스형태 -->
     <script>
     var str="";
     </script>
     <c:forEach var="vo" items="${list}">              	
                           
          	<script>  
			//결과를 보여줄 영역 가져오기
			var uuid = '${vo.attach.uuid}';	
			var uploadPath = '${vo.attach.uploadPath}';			
			var fileName = '${vo.attach.fileName}';	
			
			path = encodeURIComponent(uploadPath+"\\s_"+uuid+"_"+fileName);		
			fileCallPath=path.replace(new RegExp(/\\/g),"/");
			
			//화면에 보여줄 태그 생성
			str+='<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">';
			str+='<figure class="effect-ming tm-video-item">';
			str+='<div class="scale">';
			str+='<a href="${vo.bno}" class="move">';
			str+="<img id='myImg' src='/photoBoardDisplay?fileName="+fileCallPath+"' alt='${vo.attach.fileName}' class='img-fluid'>";		
			str+='<figcaption class="d-flex align-items-center justify-content-center">';
			str+='<a href="${vo.bno}" class="move"><h2>${vo.title}</h2></a>';
			str+='</figcaption></div></figure><div class="d-flex justify-content-between tm-text-gray">';
			str+='<span class="tm-text-gray-light"><h4>${vo.writer}</h4></span>';	
			str+='</div></div>';			
		</script> 
	</c:forEach>
<script>
$(".wrap").html(str);
</script>
</div>

<!-- start Pagination -->
<div class="text-center" style="display: table; margin-left: auto; margin-right: auto; ">
	<ul class="pagination" >
		<c:if test="${pageVO.prev }">
			<li class="paginate_button previous" ><a href="${pageVO.startPage-1 }">Previous</a>
		</c:if>
		<c:forEach var="idx" begin="${pageVO.startPage}" end="${pageVO.endPage}">
			<li class="paginate_button ${pageVO.cri.pageNum==idx?'active':''}"><a style="border: 0 solid black; padding: 5px;" href="${idx}">${idx}</a>
		</c:forEach>
		<c:if test="${pageVO.next }">
			<li class="paginate_button next"><a	href="${pageVO.endPage+1 }">Next</a>
		</c:if>
	</ul>
</div><!-- end Pagination --> 
</div>
<%-- 페이지 링크 값을 넘기기 위한 폼 --%>
<form action="" id="actionForm">
	<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}" id="pageNum"/>
	<input type="hidden" name="amount" value="${pageVO.cri.amount}"  id="amount"/>
</form>
	
 
<script>
<!-- 스크립트 -->
$(function(){	
	//actionForm 가져오기 - 페이지 이동시 사용할 폼	
	var actionForm = $("#actionForm");	
	
	//페이지 번호 클릭시 동작
	$(".paginate_button a").on("click",function(e){
		//a 태그의 기능을 중지
		e.preventDefault();	
		
		//pageNum의 값을 사용자가 선택한 값으로 변경
		$("#pageNum").val($(this).attr("href"));	
		actionForm.attr("action","board_photo_list");	//	/board/read
		actionForm.submit();		
	});	
	
	//게시판 제목 클릭시 동작(현재글번호,pagaNum 정보)
	$(".move").click(function(e){
		e.preventDefault();
		var actionForm = $("#actionForm");	
		actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");		
		actionForm.attr("action","board_photo_read");	//	/board/read
		actionForm.submit();
	});	
})
</script>
<%@include file="../includes/footer.jsp" %>