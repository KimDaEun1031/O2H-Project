<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <!-- 게시글 작성 -->
<!-- 첨부파일 -->
        <div id="imageForm" class="col-l-3 col-md-3 col-sm-3 col-xs-12 section-header wow fadeInDown">
             <span id="profile_pic">
                 <img id="myImg" src=""/><!--  class="img-circle" alt="Profile Image" style='object-fit:contain'  -->
             </span>
			<div class="uploadResult">
				<ul></ul>
			</div>
			<div class="bigPictureWrapper">
				<div class="bigPicture"></div>
			</div>
            <br>
            <%-- 파일등록 --%>
			<div>	
				<label for="files" class="btn btn-primary active" id="changeImgBtn">Select Image</label>		
				<input id="files" name="uploadFile" id="" type="file" accept='image/jpeg,image/gif,image/png' style="visibility:hidden;">
			</div>        
         </div>
        <%-- 파일등록 --%>
      </div>
    </div>
    
    
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
		      <input type="submit" value="등록">
		      <input type="reset" value="취소">
		      <input type="reset" data-oper='list' onclick="location.href='/board/board_photo_list'" value="리스트">
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
