<%@page import="com.company.domain.YHAnnounceBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>

<style>
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
.primaryy{
	text-align: center;
}
.btn-primaryy {
    background-color: #009999;
    border: 0;
    border-radius: 5px;
    padding: 12px 50px 14px;
    font-size: 1.2rem;
    color: white;
}
.btn-primaryy:hover, .btn-primaryy:focus {
	color: #fff;
    background-color: #086969;
    font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif; 
}
/* 제목 a 태그 */
tr th{
color: #009999;
}
/* Q&A 게시판 */
.breadcrumb-text span {
    color: #009999;
    font-weight: 560;
    font-family: Verdana, Geneva, Tahoma, sans-serif;
    font-size: 18px;
}
</style>
   <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcrumb-text">
              <a class="nav-link nav-link-2" href="/announce/getList">공지게시판</a>
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
     <br />
     <!-- start Pagination -->
	<div class="text-center" style="display: table; margin-left: auto; margin-right: auto;">
		<ul class="pagination" >
			<c:if test="${pageVO.prev }">
				<li class="paginate_button previous"><a href="${pageVO.startPage-1 }">Previous</a>
			</c:if>
			<c:forEach var="idx" begin="${pageVO.startPage}" end="${pageVO.endPage}">
				<li class="paginate_button ${pageVO.cri.pageNum==idx?'active':''}"><a style="border: 0 solid black; padding: 5px" href="${idx}">${idx+1}</a>
			</c:forEach>
			<c:if test="${pageVO.next }">
				<li class="paginate_button next"><a	href="${pageVO.endPage+1 }">Next</a>
			</c:if>
		</ul>
	</div>
	<!-- end Pagination -->     
	<div class="bt_wrap">
	   <button class="btn btn-info" id="write" hidden="hidden">글 작성</button> 
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
	 if('${loginInfo.userId}'=='admin'){
		 writebtn.removeAttribute("hidden");
	 }
	 var pageNumDiv=document.getElementById("pageNum")
	 if("${pageNum}"!="1"){
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
		actionForm.attr("action","getList");
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