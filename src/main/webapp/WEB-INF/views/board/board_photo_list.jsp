<%@page import="com.company.domain.YHQandABoardVO"%>
<%@page import="java.util.List"%>
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
              <span>Q&A 게시판</span>
            </div>
          </div>
        </div>
      </div>
    </div>
   
    <!-- Breadcrumb Section Begin -->
<link rel="stylesheet" href="/resources/css/boardList.css" type="text/css" />

<div class="board_wrap" style="margin-left: 5%; margin-right: 5%">
     <table class="board_list" style="text-align: center;">
       <caption>
         게시판 목록
       </caption>
       <thead >
         <tr>
           <th>번호</th>
           <th>제목</th>
           <th>글쓴이</th>
           <th>작성일</th>
           <th>조회수</th>
         </tr>
       </thead>
       <tbody>
       <!-- 게시판 리스트 반복문 -->
         <c:forEach var="vo" items="${list }">
    		<tr>
         		<td>${vo.bno }</td>
   			<td><a href="${vo.bno }" class="move">${vo.title}</a></td>
   			<td>${vo.writer_id }  </td>
          	<td><fmt:formatDate value="${vo.regdate }"
          			pattern="yyyy-MM-dd HH:mm" /></td>
         		<td>
         		<fmt:formatDate value="${vo.replyDate }"
          			pattern="yyyy-MM-dd HH:mm" /></td>         		
         	</tr>
         </c:forEach>
       </tbody>
     </table>
     <!--  -->
     
     <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
                <figure class="effect-ming tm-video-item">
                    <img src="img/img-03.jpg" alt="Image" class="img-fluid">
                    <figcaption class="d-flex align-items-center justify-content-center">
                        <h2>Clocks</h2>
                        <a href="photo-detail.html">View more</a>
                    </figcaption>                    
                </figure>
                <div class="d-flex justify-content-between tm-text-gray">
                    <span class="tm-text-gray-light">18 Oct 2020</span>
                    <span>9,906 views</span>
                </div>
            </div>
     
     
     
     <!-- start Pagination -->
	<div class="text-center" style="display: table; margin-left: auto; margin-right: auto;">
		<ul class="pagination" >
			<c:if test="${pageVO.prev }">
				<li class="paginate_button previous"><a
					href="${pageVO.startPage-1 }">Previous</a>
			</c:if>
			<c:forEach var="idx" begin="${pageVO.startPage}"
				end="${pageVO.endPage}">
				<li class="paginate_button ${pageVO.cri.pageNum==idx?'active':''}"><a
					href="${idx}">${idx}</a>
			</c:forEach>
			<c:if test="${pageVO.next }">
				<li class="paginate_button next"><a	href="${pageVO.endPage+1 }">Next</a>
			</c:if>
		</ul>
	</div>
	<!-- end Pagination -->     
	<div class="bt_wrap">
	   <a href="/qandaboard/gotoWriterQuestion" ><button class="btn btn-primary" hidden="hidden" id="singinbtn">글 작성</button></a> 
	</div>
</div>


<form action="/qandaboard/read" id="actionForm">
   <input type="hidden" name="pageNum" value="${pageVO.cri.pageNum }"/>
   <input type="hidden" name="bno" />
</form>      


<script>
 window.onload=function(){
	 
	 console.log("${loginInfo}"+"123");
	 if("${loginInfo.userId}"!=""){
			 document.getElementById("singinbtn").removeAttribute("hidden");
	 }
	var actionForm=$("#actionForm")
	
	$(".paginate_button a").click(function(e){
		//a 태그의 기능을 중지
		e.preventDefault();
    	
		//pagenum의 값을 사용자가 선택한 값으로 변경
		//$("actionForm  [name='pageNum']").attr(value='$(this).text')
		actionForm.find("input[name='pageNum']").val($(this).attr("href"))
		console.log($(this).attr("href"));
		console.log($(this));
		actionForm.attr("action","gotoQandAList");
		actionForm.submit();
	})
	
	 
	
	$(".move").click(function(e){
		e.preventDefault();		
		/* 
		actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'> ");
		 */
		 actionForm.find("input[name='bno']").val($(this).attr("href"))
			
		actionForm.attr("action","read"); // /board/read
		actionForm.submit();

})
 }
</script>
   
  
<%@include file="../includes/footer.jsp" %>