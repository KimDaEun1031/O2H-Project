<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/photoWrite.css" />
<style>
/* 사진 게시판 */
.breadcrumb-text a {
    top: 0px;
    content: none;
    font-size: 21px;
    font-family: "Malgun Gothic", Gulim !import;
    color: #ff3e3e;
    color: #ff685c;
    font-weight: 560;
    font-family: Verdana, Geneva, Tahoma, sans-serif;
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
a:hover {
    color: #009999;
}
.nav-link-2.active,
.nav-link-2:hover {
  border-color: #ff6666;
}
/* 버튼 */
#hob{
	background: #50c594;
}
#hob2{
	background: RGB(234,76,137);
	margin: 0 5px;
}
#hob3{
	background: #ae75f7;
}
#hob, #hob2, #hob3{
	height: 40px;
	width: 60px;
	font-family:Verdana, Geneva, Tahoma, sans-serif;
	border-radius: 8px;
	letter-spacing: 2px;
	font-size: 16px;
	/* font-family:Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif; */
}
#hob:hover{
	background: #63f1ff;
}
#hob2:hover{
	background: #f35d8b;
}
#hob3:hover{
	background: #6387ff;
}
/* 첨부파일 */
#changeImgBtn{
	color: black;
	border: 2px solid black;
	background: white;
}
#changeImgBtn:hover{
	color: #7edd03;
	border: 2px solid #7edd03;
	background: white !important;
}
</style>
    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section" style="margin-bottom:10px">
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
   </div>
    <div class="board_write_wrap">
      <div class="board_write">
		<form action="" method="post" role="form" name="photoWrite">
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
	          <div class="cont">
          		<textarea name="content" placeholder="내용 입력" style="resize: none; height:150px;"></textarea>
        	  </div>	       
		     <!-- 게시글 작성 -->
			<!-- 첨부파일 -->  	
			<div>
				<ul style="visibility:hidden;">
					<li></li>
				</ul>
		    </div>				        
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
		  <span>
             <label for="files" class="btn btn-primary active" id="changeImgBtn">Select Image</label>
          </span>
              <%-- 파일등록 --%>      
  			 </div><!-- class="info" 영역 -->
			 <div class="board_write"><!-- strong line -->
		 	<div class="cont">
	      </div>
        </div>
         </div>
		    <div class="bt_wrap">
		      <button type="submit" class="btn btn-success write" id="hob">등록</button>
		      <button type="reset" class="btn btn-danger" id="hob2">취소</button>
		      <button type="button" class="btn btn-info" id="hob3" onclick="location.href='/board/board_photo_list'">목록</button>		  
		    </div>    
		 </form>
		</div>
	  </div>
<script>
$(function(){
	//제목에 포커스
	$("input[name='title']").focus()
							.select();	
})
</script>
<script src="/resources/js/photoBoardWrite.js"></script>
<%@include file="../includes/footer.jsp" %>
</html>
