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
              <span>Q&A게시판</span>
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
            <dd><input type="text" name="title" value="${vo.title}" readonly="readonly"/></dd>
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
          <textarea name="content" placeholder="내용 입력" readonly="readonly"> ${vo.content }</textarea>
        </div>
      </div>
    </div>
    </div>
    <div class="bt_wrap" id="ttld">
   
    <a href="/qandaboard/update?bno=${param.bno}" hidden="hidden" id="hob">수정</a>
   	<a href="/qandaboard/delete?bno=${param.bno}" hidden="hidden" id="hob2">삭제</a>
  
    </div>
	 <div class="board_write_wrap">
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
    </div>
	  <script>
   window.onload=function(){
   	var userid='${auth.userId}'
   	var writer='${vo.writer_id }'
   	var hideonbush=document.getElementById("hob");
   	var hideonbush2=document.getElementById("hob2");
   	var adminbtn=document.getElementById("adminonlybtn");
   	var reply=document.getElementById("reply");
   	alert(writer);
   	alert(userid);
   if(userid==writer || userid=="admin"){
	  
	  hob.removeAttribute("hidden");
 	  hob2.removeAttribute("hidden");
   }
   if(userid=="admin"){
	   adminbtn.removeAttribute("hidden");
	   reply.removeAttribute("readonly");
   }
  }
   	</script> 
	
	
	
   <%@include file="../includes/footer.jsp" %>
</html>
