<%@page import="com.company.domain.YHQandABoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
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
/* placeholder webkit */
#title::-webkit-input-placeholder  {
  -webkit-transition: opacity 0.3s linear; 
  color: gray;
}
#title:focus::-webkit-input-placeholder  {
  opacity: 0;
}
#content::-webkit-input-placeholder  {
  -webkit-transition: opacity 0.3s linear; 
  color: gray;
}
#content:focus::-webkit-input-placeholder  {
  opacity: 0;
}
/* 버튼 */
#hob{
	background: #50c594;
}
#hob2{
	background: RGB(234,76,137);
	margin: 0 5px;
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
	background: #59d2c1;
}
#hob2:hover{
	background: #f35d8b;
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
    <!-- 게시글 작성 -->
	<form action="" method="post" role="form" name="photoUpdate">
    <div class="board_write_wrap">
      <div class="board_write">
        <div class="title">
            <input type="hidden" name="bno" value="${board.bno }" />        
            <input type="hidden" name="bno" value="${board.updatedate }" />        
          <dl>
            <dt>제목</dt>
            <dd><input type="text" name="title" id="title" value="${board.title }" placeholder="TITLE" style="background-color: rgb(250, 253, 253);" /></dd>
          </dl>
        </div>
         <div class="info">
          <dl>
            <dt>글쓴이</dt>          
            <dd><input type="text" name="writer" value="${board.writer}" readonly="readonly" style="background-color: azure;"/></dd>
          </dl>         
	         <div class="cont">
	           <textarea name="content" id="content" placeholder="게시물 내용을 입력해주세요" style="resize: none; height:150px;">${board.content}</textarea>
		     </div>    	      
	       <!-- 게시글 작성 -->
		   <!-- 첨부파일 -->	
			<div>
				<dt></dt>	
				<dt></dt>
			</div>	
	           <img id="myImg" src="" />			      		
	        <%-- 파일등록 --%>
	        <div>
				<ul style="visibility:hidden;">
					<li></li>
				</ul>
		    </div>
	         <dl>
	         <dt></dt>
			  <div>	
				<label for="files" class="btn btn-primary active" id="changeImgBtn">Select Image</label>						
				<input id="files" name="uploadFile" id="" type="file" accept='image/jpeg,image/gif,image/png' style="visibility:hidden;">
			  </div> 
			 </dl>       
			</div>        
         <!-- 첨부물 보여주기 -->
		<script>
			//현재 글 번호 가져오기
			var bnoVal = '${board.bno}';
		</script>
        <%-- 파일등록 --%>       
        </div>   
		    <div class="board_write">
		  <div class="cont">		         
       </div>
      </div>
    </div>
	    <div class="bt_wrap">
	      <input type="submit" class="btn btn-success" data-oper='modify' id="hob" value="등록">
	      <input type="submit" class="btn btn-danger" data-oper='list' id="hob2" value="취소">
	    </div>
	 </form>	
<%-- 페이지 나누기 위해 필요한 값 세팅 --%>
<form action="" id="myform" method="post">
	<input type="hidden" name="bno" value="${board.bno }" />
	<input type="hidden" name="amount" value="${cri.amount }" />
	<input type="hidden" name="pageNum" value="${cri.pageNum }" />
</form>  
<%-- 스크립트 --%>	
<script>
$(function(){
	//제목 커서 맨 뒤로
	var len = $("input[name='title']").val().length;
	$("input[name='title']").focus();
	$("input[name='title']")[0].setSelectionRange(len, len);
})
$(function(){
	$("input[type='submit']").click(function(e){
		e.preventDefault();	//submit 기능 막기
		
		var oper = $(this).data("oper");
		console.log(oper);
		
		if(oper == 'modify'){	
			
			//제목 입력 필수
			var titleVal = $("#title").val();
			if (titleVal == "") {
				alert("제목을 입력해주세요.");
			    $("#title").focus(); 
			    return false;
			}
			 
			//첨부파일 등록 필수
			var imgAttach = $("#myImg").attr("src");
			if(!imgAttach){
				alert("첨부파일 등록 후 수정해 주세요.");
				console.log(imgAttach);
				return false;
			}
			
			var form = $("form[role='form']");				
			var str = "";			
			var job = $("#myImg");						

			//수집된 정보를 hidden 태그로 작성
			str+="<input type='hidden' name='attach.uuid' value='"+job.data("uuid")+"'>";
			str+="<input type='hidden' name='attach.uploadPath' value='"+job.data("path")+"'>";
			str+="<input type='hidden' name='attach.fileName' value='"+job.data("filename")+"'>";
			str+="<input type='hidden' name='attach.fileType' value='"+job.data("type")+"'>";
			form.append(str);
			form.submit();
		}else if(oper == 'list'){ //리스트
		  var form = $("#myform");
			form.find("input[name='bno']").remove();
			form.attr("method","get");
			form.attr("action","board_photo_list");
			form.submit();
		}
	})	
})	
</script>
<script src="/resources/js/photoBoardUpdate.js"></script>
   <%@include file="../includes/footer.jsp" %>
</html>
