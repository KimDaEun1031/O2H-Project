<%@page import="com.company.domain.YHAnnounceBoardVO"%>
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
              <span>공지 게시판</span>
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
           <th>작성일</th>
           <th>조회수</th>
           <th>댓글수</th>
         </tr>
       </thead>
       <tbody>
         <c:forEach var="vo" items="${list }">
    		<tr>
         		<td>${vo.bno }</td>
   			<td><a href="${vo.bno }" class="move">${vo.title}</a></td>
          	<td><fmt:formatDate value="${vo.regdate }"
          			pattern="yyyy-MM-dd HH:mm" /></td>
         	<td>${vo.written }
   			<td>${vo.replycnt }  </td>
         	   		
         	</tr>
         </c:forEach>
       </tbody>
     </table>
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
	   <button class="btn btn-primary" id="write" hidden="hidden">글 작성</button> 
	</div>
</div>


<form action="/announce/read" id="actionForm">
			
   <input type="hidden" name="pageNum" id="pageNum" value="1"/>
   
   <input type="hidden" name="bno" />
</form>      

<form action="/announce/write" id="actionForRead">
			
   <input type="hidden" name="pageNum" id="pageNum" value="1"/>
   
</form>      

<script>
 window.onload=function(){
	 var writebtn=document.getElementById("write");
	 if('${auth.userId}'=='admin'){
		 writebtn.removeAttribute("hidden");
	 }
	 var pageNumDiv=document.getElementById("pageNum")
	 if("${pageNum}"=="1"){
		 pageNumDiv.setAttribute("value",'${pageNum}')
	 }
	 var actionForm=$("#actionForm")
	write.onclick=function(e){
		 e.preventDefault();
		 
		 $("#actionForRead").submit();
		 
		 
	 } 
	$(".paginate_button a").click(function(e){
		//a 태그의 기능을 중지
		e.preventDefault();
    	
		//pagenum의 값을 사용자가 선택한 값으로 변경
		//$("actionForm  [name='pageNum']").attr(value='$(this).text')
		actionForm.find("input[name='pageNum']").val($(this).attr("href"))
		console.log($(this).attr("href"));
		console.log($(this));
		actionForm.attr("action","gotoAnnouceList");
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