<%@page import="com.company.domain.KDLoginInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
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
	           <!--  <div class="d-flex justify-content-between tm-text-gray"> -->
	          <%--  <span class="tm-text-gray-light"><h4>${vo.writer }</h4></span> --%>
	           <%-- <span class="tm-text-gray-light"><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd HH:mm"/></span> --%><!-- 이건 나오는데 그냥 read쪽 개별 게시물 들어가서 나오게 하자 -->
	           <%-- <span><td><fmt:formatDate value="${vo.updatedate }" pattern="yyyy-MM-dd HH:mm"/></td></span> --%><!-- 이거 안나옴 vo에 없나? -->
	          </dl>
	       </div>
	          <!-- 
	          <dl>
	            <dt>비밀번호</dt>
	            <dd><input type="password" placeholder="비밀번호 입력" /></dd>
	          </dl>
	        </div> -->
	        <%-- <div class="cont">
	          <<t>		</t>extarea name="content" id="contenth" placeholder="내용 입력" readonly="readonly"> ${vo.content }</textarea>
	        </<di></di>v> --%>
	        	<img id="myImg" src="" alt="">      	
	        	<!-- 첨부 파일 보여주기 -->
				<div class="bigPictureWrapper">
					<div class="bigPicture"></div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading"><!-- <i class="fa fas fa-file"></i> Files --></div>
							<div class="panel-body">				
								<div class="uploadResult">
									<ul></ul>
								</div>
							</div>
						</div>
					</div>
				</div>
		        <!-- 첨부물 보여주기 -->
				<script>
					//현재 글 번호 가져오기->read->reply => 결과를 read
					var bnoVal = '${board.bno}';
				</script>
		        <div class="cont">
		          <%-- <textarea name="content" id="contenth" placeholder="내용 입력" readonly="readonly"> ${vo.content }</textarea> --%>
		        </div>
	     	 </div>
	       </div>
	    </div>
    <div class="bt_wrap" id="ttld">    
	   	<input type="submit" data-oper='modify' id="hob" value="수정" >
	    <input type="submit" data-oper='remove' id="hob2" value="삭제">   
	    <input type="reset" data-oper='list' onclick="location.href='/board/board_photo_list'" value="리스트">
    </div>
    
    
    </form>
<form action="board_photo_update" id="myform">
<!-- http://localhost:8080/board/read?type=&keyword=&pageNum=1&amount=10&bno=1219 -->
<!-- ocalhost:8080/board/modify?type=T&keyword=스프링&bno=1215&pageNum=1&amount=10 -->
	<input type="hidden" name="bno" value="${board.bno }" />
	<%-- <input type="hidden" name="type" value="${cri.type }" />
	<input type="hidden" name="keyword" value="${cri.keyword }" />
	<input type="hidden" name="pageNum" value="${cri.pageNum }" />
	<input type="hidden" name="amount" value="${cri.amount }" /> --%>
</form>	   
 <%--	 <div class="board_write_wrap">
     <div class="board_write">
        <div class="title">
         
       	운영자 답변란
        <div class="cont">
        <form method="post" action="/qandaboard/replyupdate">
          <textarea  readonly="readonly" name="reply" id="reply">${vo.reply } </textarea>
          <input type="hidden" name="bno" value="${vo.bno}">
          <button hidden="hidden" id="adminonlybtn"> 수정하기</button>
         </form>
        </div>
      </div>
	</div>
   </div> --%>
          <input type="hidden" name="bno" value="${vo.bno}">
<form id="updateForm" action="/qandaboard/update" method="post">
	<input type="hidden" name="title" id="titleHidden" value="${vo.title }">
	<input type="hidden" name="content" id="contentHidden" value="${vo.content }">
	<input type="hidden" name="bno" value="${vo.bno }">
</form>
<script>
  window.onload=function(){
	var content=document.getElementById("contenth");
	var title=document.getElementById("titleh");
	var contentHidden=document.getElementById("contentHidden")
	var titleHidden=document.getElementById("titleHidden")
  	var userid='${loginInfo.userId}'
  	var writer='${vo.writer_id }'
  	var hideUpdateBtn=document.getElementById("hob");
  	var hideDeleteBtn=document.getElementById("hob2");
  	var adminbtn=document.getElementById("adminonlybtn");
  	var reply=document.getElementById("reply");
  	hideUpdateBtn.onclick=function(){
  		alert("update 요청 ")
  	}
 /*  if(userid==writer || userid=="admin"){
  content.removeAttribute("readonly")
  title.removeAttribute("readonly")
  		
  hideUpdateBtn.removeAttribute("hidden");
  hideDeleteBtn.removeAttribute("hidden");
  }
  if(userid=="admin"){
   adminbtn.removeAttribute("hidden");
   reply.removeAttribute("readonly");
   
  }
  hideUpdateBtn.onclick=function(){
   contentHidden.value=content.value;
   titleHidden.value=title.value;
  		alert(contentHidden.value);
  		alert(titleHidden.value);
  		document.getElementById("updateForm").submit();
  }
   */
  
 }
  

$(function(){
	var form = $("#myform");

	$("input[type='submit']").click(function(e){
		e.preventDefault();	//submit 기능 막기
		
		var oper = $(this).data("oper");
		console.log(oper);
		
		if(oper == 'remove'){//삭제
			form.attr("action","remove")
				.attr("method","post");
		}else if(oper == 'modify'){//수정
			form.attr("action","board_photo_update");
		}
		form.submit();
	})

	
	
	
	
})


  

</script> 
	
	
<script src="/resources/js/photoBoardRead.js"></script>
   <%@include file="../includes/footer.jsp" %>
</html>
