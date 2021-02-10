<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../includes/header.jsp" %>
<<link rel="stylesheet" href="/resources/css/photoWrite.css" />
    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section" style="margin-bottom:10px">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcrumb-text">
              <a href="board_photo_list"><span>사진 게시판</span></a>
              <span>
              	<label for="files" class="btn btn-primary active" id="changeImgBtn">Select Image</label>
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 게시글 작성 -->
	<!-- 첨부파일 -->  
			
         <%-- 파일등록 --%>
    <div class="container">
    	<div style="text-align:center">
     		<img id="myImg" src=""/>
     	</div>
		<div class="row">
		  <div class="col align-self-start">					
			<input id="files" name="uploadFile" id="" type="file" accept='image/jpeg,image/gif,image/png' style="visibility:hidden;">
		  </div>  
		</div>
	</div>      
      </div>
     <%-- 파일등록 --%>
      </div>
    <!-- </div> -->
    
    
    <div class="board_write_wrap">
      <div class="board_write">
		<form action="" method="post" role="form">
	        <div class="title">
	          <dl>
	            <dt>제목</dt>
	            <dd><input type="text" name="title" placeholder="제목 입력" style="background-color: rgb(250, 253, 253);" /></dd>
	          </dl>
	        </div>
	         <div class="info">
	          <dl>
	            <dt>글쓴이</dt>
	            <c:if test="${empty loginInfo}">
	            <dd><input type="text" name="writer" placeholder="글쓴이 입력" style="background-color: rgb(250, 253, 253);" ></dd>
	            </c:if>
	            <c:if test="${!empty loginInfo}">
	            <dd><input type="text" name="writer" placeholder="글쓴이 입력" value="${loginInfo.userId }" readonly="readonly" style="background-color: azure;"/></dd>
	          	 </c:if>
	          </dl>   
    
	
		    <div class="bt_wrap">
		      <button type="submit" class="btn btn-success">등록</button>
		      <button type="reset" class="btn btn-danger">취소</button>
		      <button type="button" class="btn btn-info" onclick="location.href='/board/board_photo_list'">목록</button>		  
		    </div>
    
	</form>
	</div>
	</div>
<script>
$(function(){
	$("input[name='title']").focus()
							.select();
})
</script>
<script src="/resources/js/photoBoardWrite.js"></script>
<%@include file="../includes/footer.jsp" %>
</html>
