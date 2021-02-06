<%@page import="com.company.domain.KDLoginInfoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

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

<!-- 게시글 보기 -->


<div class="board_write_wrap">
	<div class="board_write">
		<div class="title">
			<dl>
				<dt>제목</dt>
				<dd>
					<input type="text" name="title" id="titleh" value="${vo.title}"
						readonly="readonly" />
				</dd>
			</dl>
		</div>
		<div class="info">
			<dl>
				<dt>글쓴이</dt>
				<dd>
					<input type="text" name="writer_id" id="writer_id" placeholder="admin"
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
				<textarea name="content" id="contenth" placeholder="내용 입력" readonly="readonly"> ${vo.content }</textarea>
			</div>
		</div>
	</div>
</div>
<div class="bt_wrap" id="ttld">
<form id="forUpdate" action="/announce/update" method="post">
	<input type="hidden" id="title" name="title">
	<input type="hidden" id="content" name="content">
	<input type="hidden" id="bno" name="bno" value="${vo.bno}">
 

	 <input type="button" id="hob" value="수정" hidden="hidden" onclick="hello()">
	<!-- <input type="button"  hidden="hidden" id="hob" value="수정"> -->
	<a href="/announce/delete?bno=${param.bno}" hidden="hidden" id="hob2"> <input type="button" value="삭제">   </a>
	</form>
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
   
	var content=document.getElementById("contenth");
   	var titlePlace=document.getElementById("titleh");
   	var userid='${loginInfo.userId}'
   	var writer='${vo.writer_id }'
   	var idPlace=document.getElementById("writer_id");
   	var hideUpdateBtn=document.getElementById("hob");
 		
		function hello(){
   		alert("hello");
   		var tempContent=content.value;
   		var tempTitle=titlePlace.value;
   		document.getElementById("title").value=tempTitle;
   		document.getElementById("content").value=tempContent;
   		console.log(tempContent+"이건가?");
   		console.log(tempTitle);
   		document.getElementById("forUpdate").submit();
   	}
   	var hideDeleteBtn=document.getElementById("hob2");
   	var adminbtn=document.getElementById("adminonlybtn");
   	var reply=document.getElementById("reply");
   
   if( userid=="admin"){
	  
	  hob.removeAttribute("hidden");
 	  hob2.removeAttribute("hidden");
 	 }
   if(userid=="admin"){
	  	
	 
	  
	   titlePlace.removeAttribute("readonly");
	   content.removeAttribute("readonly");
   }
  
   	</script>



<%@include file="../includes/footer.jsp"%>
</html>
