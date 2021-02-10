<%-- <%@page import="com.company.domain.YHQandABoardVO"%>
<%@page import="java.util.List"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcrumb-text">
              <span>사진 게시판</span>
            </div>
          </div>
        </div>
      </div>
    </div>
   <br />
  	<!-- 큰 버튼 -->
    <input type="reset" data-oper='list' class="btn btn-primary btn-block active" onclick="location.href='/board/board_photo_write'" value="글작성">
    <!-- 작은 버튼 -->
    <!-- <input type="reset" data-oper='list' class="btn btn-primary tm-btn-next active" onclick="location.href='/board/board_photo_write'" value="글작성"> -->
    <!-- Breadcrumb Section Begin -->
<link rel="stylesheet" href="/resources/css/boardList.css" type="text/css" />

<div class="board_wrap" style="margin-left: 5%; margin-right: 5%">
   <br />
     <table class="board_list" style="text-align: center;">
       <caption>
         게시판 목록
       </caption>
       
       
       
     <!-- 게시판 리스트 반복문 : 박스형태 -->
     <c:forEach var="vo" items="${list }">
	    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
	       <figure class="effect-ming tm-video-item">
	           <%-- <a href="board_photo_read?bno=${vo.bno}" class="move"><img id="myImg" src="img/img-06.jpg" alt="Image" class="img-fluid"></a> --%>
	           <a href="${vo.bno}" class="move"><img id="myImg" src="img/img-06.jpg" alt="Image" class="img-fluid"></a>
	           <!-- <img id="myImg" src="/resources/img/profile/fiturjc_default_user.jpg" class="img-circle" alt="Profile Image" style='object-fit:contain' /> -->
	           <div class="uploadResult"><!-- 이거 나중에 디스플레이 none 해야함. style="display:none; -->
						<ul></ul>
				</div>
	           <figcaption class="d-flex align-items-center justify-content-center">
	               <%-- <a href="board_photo_read?bno=${vo.bno}" class="move"><h2>${vo.title }</h2></a> --%>
	               <a href="${vo.bno}" class="move"><h2>${vo.title }</h2></a>
	               <!-- <a href="photo-detail.html">View more</a> -->
	           </figcaption>                    
	       </figure>
	       <div class="d-flex justify-content-between tm-text-gray">
	           <span class="tm-text-gray-light"><h4>${vo.writer }</h4></span>
	           <%-- <span class="tm-text-gray-light"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd HH:mm"/></span> --%><!-- 이건 나오는데 그냥 read쪽 개별 게시물 들어가서 나오게 하자 -->
	           <%-- <span><td><fmt:formatDate value="${vo.updatedate }" pattern="yyyy-MM-dd HH:mm"/></td></span> --%><!-- 이거 안나옴 vo에 없나? -->
	       </div>
	   </div>
	   
	    <!-- 첨부물 보여주기 -->
		<script>
		/* $(function{ //변수 반복 돌리기??
			var bnoVal = '${vo.bno}';
			$(bnoVal).each(function(){
				
			}
		}) */
			//현재 글 번호 가져오기->read->reply => 결과를 read
			//var bnoVal = '${vo.bno}';
			var bnoVal = '28'; //개별로 넣은 건 서버에 자료가 있다면 잘 나옴. 그런데.. 
							//어떻게 반복 돌리지? ul은 모든 게시글에서 나오니까 못 써먹겠고
							//img가 좋은데 문제1 : 여러장이 저장된다. 앞에꺼 그대로 복붙했는데 왜때문에
							//				문제2 : 어떻게 반복을 도는 바뀌는 변수명을 가지고 나오지? 배열?
	</script> 
    </c:forEach>
     <!-- 여기가 원래 검색버튼 자리 -->
     
	     <!-- start Pagination -->
	       <div class="text-center">
	       	<ul class="pagination">
	       		<c:if test="${pageVO.prev }">
	       			<li class="paginate_button previous"><a href="${pageVO.startPage-1 }">Previous</a>
	       		</c:if>
	       		<c:forEach var="idx" begin="${pageVO.startPage }" end="${pageVO.endPage }">
	       			<li class="paginate_button ${pageVO.cri.pageNum==idx?'active':'' }"><a href="${idx }">${idx }</a>
	       		</c:forEach>
	       		<c:if test="${pageVO.next }">
	       			<li class="paginate_button next"><a href="${pageVO.endPage+1 }">Next</a>
	       		</c:if>
	       	</ul>
	       </div>
	       <!-- end Pagination -->     
</div>


<%-- 페이지 링크 값을 넘기기 위한 폼 --%>
<form action="" id="actionForm">
	<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum }" />
	<!-- 검색어랑 페이지수 관련 -->
	<%-- <input type="hidden" name="type" value="${pageVO.cri.type }"/> --%>
	<%-- <input type="hidden" name="keyword" value="${pageVO.cri.keyword }"/> --%>
	<%-- <input type="hidden" name="amount" value="${pageVO.cri.amount }"  /> --%>	
</form>
<script>
<!-- 스크립트 -->
$(function(){
	var a = '${pageVO.cri.pageNum }';
	console.log(a);

	//actionForm 가져오기 - 페이지 이동시 사용할 폼
	var actionForm = $("#actionForm");	
	
	//페이지 번호 클릭시 동작
	$(".paginate_button a").click(function(e){
		//a 태그의 기능을 중지
		e.preventDefault();
		//pageNum의 값을 사용자가 선택한 값으로 변경
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
		
	})	
	
	//게시판 제목 클릭시 동작(현재글번호,pagaNum 정보)
	$(".move").click(function(e){
		e.preventDefault();
		actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");		
		actionForm.attr("action","board_photo_read");	//	/board/read
		actionForm.submit();
	})
	

	
	
})


</script>
   
<script src="/resources/js/photoBoardList.js"></script>
<%@include file="../includes/footer.jsp" %>