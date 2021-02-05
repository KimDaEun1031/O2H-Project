<%@page import="com.company.domain.KDAuthVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

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
				<dd>
					<input type="text" name="title" value="${vo.title}"
						readonly="readonly" />
				</dd>
			</dl>
		</div>
		<div class="info">
			<dl>
				<dt>글쓴이</dt>
				<dd>
					<input type="text" name="writer_id" placeholder="admin"
						value="${vo.writer_id }" readonly="readonly" />
				</dd>
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
	<div style="margin-left:10%; width: 80%">
		<table class="board_list" style="text-align: center;">
			<caption>게시판 목록</caption>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>내용</th>	
					<th>작성일</th>
				</tr>
			</thead>
		</table>
		<form>
			<input type="text">
		</form>
	</div>

<div class="board_write_wrap">
	<div class="board_write">
		<div class="title"></div>
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
   /* 	alert(writer);
   	alert(userid); */
   if( userid=="admin"){
	  
	  hob.removeAttribute("hidden");
 	  hob2.removeAttribute("hidden");
   }
   if(userid=="admin"){
	   adminbtn.removeAttribute("hidden");
	   reply.removeAttribute("readonly");
   }
  }
   	</script>



<%@include file="../includes/footer.jsp"%>
</html>
