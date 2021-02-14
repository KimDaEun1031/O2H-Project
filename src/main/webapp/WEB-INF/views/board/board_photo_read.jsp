<%@page import="com.company.domain.KDLoginInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@include file="../includes/header.jsp" %>
<style>
/* 사진 게시판 */
.breadcrumb-text a {
    top: 0px;
    content: none;
    font-size: 18px;
}
.breadcrumb-text a::after {
    position: absolute;
    right: -18px;
    top: 0px;
    content: none;
    font-size: 18px;
    color: #009999;
}
.nav-link {
  color: #666666;
  border-bottom: 4px solid transparent;
  font-size: 1.2rem;
  display: block;
  padding: .5rem 1rem;
  font-family: 'Merriweather', 'Helvetica Neue', Arial, sans-serif;
}
.nav-link-2.active,
.nav-link-2:hover {
  border-color: #ff6666;
}
/* 버튼 */
</style>
    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcrumb-text">
              <a class="nav-link nav-link-2" href="board_photo_list">사진 게시판</a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 게시글 보기 -->
	<form action="" role="form">
	    <div></div> <class></class>
	      <div class="board_write">
	        <div class="title">
	          <dl>
	            <dt>제목</dt>
	            <input type="hidden" name="bno" value="${board.bno }" />
	            <dd><input type="text" name="title" id="titleh" value="${board.title }" readonly="readonly" style="background-color: azure;"/></dd>
	          </dl>
	        </div>
	         <div class="info">
	          <dl>
	            <dt>글쓴이</dt>
	            <dd><input type="text" name="writer" placeholder="글쓴이 입력" value="${board.writer }" readonly="readonly" style="background-color: azure;"/></dd>
	          </dl>
	          <dl>
	            <dt>작성일</dt>
	            <dd><fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd HH:mm"/></dd>
	          </dl>
	       	 </div>
	          <div class="cont">
	           	<textarea name="content" placeholder="내용 입력" readonly="readonly" style="resize: none; height:150px; background-color: #faffff;">${board.content}</textarea>
		      </div> 
		     <div>
				<ul style="visibility:hidden;">
					<li></li>
				</ul>
			  </div>	
        		<img id="myImg" src="" alt="">      	        	
			<div>
				<ul style="visibility:hidden;">
					<li></li>
				</ul>
		    </div>
		        <!-- 첨부물 보여주기 -->
				<script>
					//현재 글 번호 가져오기->read->reply => 결과를 read
					var bnoVal = '${board.bno}';
				</script>
		       <div class="cont">		          
	        </div>
     	 </div>
       </div>
    </div>
	   <div class="bt_wrap" id="ttld">        
		   	<input type="submit" class="btn btn-success" data-oper='modify' id="hob" value="수정" >
		    <input type="submit" class="btn btn-danger" data-oper='remove' id="hob2" value="삭제">   
		    <input type="submit" class="btn btn-info" data-oper='list' value="목록">
	    </div>
	 </form>
<form action="board_photo_update" id="myform">
	<input type="hidden" name="bno" value="${board.bno }" />
	<input type="hidden" name="pageNum" value="${cri.pageNum }" />
	<input type="hidden" name="amount" value="${cri.amount }" />
</form>	   
<script>
var a = '${cri.pageNum }';
console.log(a);
  window.onload=function(){
  	var hideUpdateBtn=document.getElementById("hob");
  	var hideDeleteBtn=document.getElementById("hob2");
  	hideUpdateBtn.onclick=function(){
  		alert(bnoVal+"번 게시물을 수정합니다.");
  	}
  	hideDeleteBtn.onclick=function(){
  		alert(bnoVal+"번 게시물을 삭제합니다.");
  	}
 } 
$(function(){
	var form = $("#myform");

	$("input[type='submit']").click(function(e){
		e.preventDefault();	//submit 기능 막기
		
		var oper = $(this).data("oper");
		console.log(oper);
		
		if(oper == 'remove'){ //삭제
			form.attr("action","remove")
				.attr("method","post");
		}else if(oper == 'modify'){ //수정
			form.attr("action","board_photo_update");
		}else if(oper == 'list'){ //리스크
			form.find("input[name='bno']").remove();
			form.attr("action","board_photo_list");
		}
		form.submit();
	})		
})
</script> 
<script src="/resources/js/photoBoardRead.js"></script>
   <%@include file="../includes/footer.jsp" %>
</html>