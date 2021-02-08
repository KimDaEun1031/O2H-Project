<%@page import="com.company.domain.KDLoginInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcrumb-text">
              <a href="/qandaboard/gotoQandAList"><span>Q&A게시판</span></a>${vo.writer_id}님이 작성하신 게시판입니다.
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 게시글 보기 -->

	
    <div class="board_write_wrap">
      <div class="board_write">
        <div class="title">
          <dl>
            <dt>제목</dt>
            <dd><input type="text" name="title" id="titleh" value="${vo.title}" readonly="readonly"/></dd>
          </dl>
        </div>
         <div class="info">
          <dl>
            <dt>글쓴이</dt>
            <dd><input type="text" name="writer_id" placeholder="글쓴이 입력" value="${vo.writer_id }" readonly="readonly"/></dd>
          </dl>
          <!-- 
          <dl>
            <dt>비밀번호</dt>
            <dd><input type="password" placeholder="비밀번호 입력" /></dd>
          </dl>
        </div> -->
        <div class="cont">
          <textarea name="content" id="contenth" placeholder="내용 입력" style="resize: none;" readonly="readonly"> ${vo.content }</textarea>
        </div>
      </div>
    </div>
    </div>
    <div class="bt_wrap" id="ttld" style="margin-bottom: 10px;">
    <input type="button" id="hob"  class="btn btn-warning" value="수정" hidden="hidden">
    <input type="button" id="hob2"  class="btn btn-primary" value="삭제" hidden="hidden">
    </div>
	 <div class="board_write_wrap">
      <div class="board_write">
        <div class="title">
         
       	운영자 답변란
        <div class="cont">
        <form method="post" action="/qandaboard/replyupdate">
          <textarea  readonly="readonly" name="reply" id="reply" style="resize: none;">${vo.reply } </textarea>
          <input type="hidden" name="bno" value="${vo.bno}">
          <button hidden="hidden" id="adminonlybtn" class="btn btn-outline-warning"> 수정하기</button>
         </form>
        </div>
      </div>
    </div>
    <form id="updateForm" action="/qandaboard/update" method="post">
    	<input type="hidden" name="title" id="titleHidden" value="${vo.title }">
    	<input type="hidden" name="content" id="contentHidden" value="${vo.content }">
    	<input type="hidden" name="bno" value="${vo.bno }">
    </form>
    </div>
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
   if(userid==writer || userid=="admin"){
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
   
  }
   	</script> 
	
	
	
   <%@include file="../includes/footer.jsp" %>
</html>
