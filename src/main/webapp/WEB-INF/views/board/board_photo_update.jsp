<%@page import="com.company.domain.YHQandABoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcrumb-text">
              <a href="board_photo_list"><span>사진 게시판</span></a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 게시글 작성 -->

	<form action="" method="post" role="form">
    <div class="board_write_wrap">
      <div class="board_write">
        <div class="title">
          <dl>
            <dt>제목</dt>
            <input type="hidden" name="bno" value="${board.bno }" />        
            <input type="hidden" name="bno" value="${board.updatedate }" />        
            <dd><input type="text" name="title" value="${board.title }" style="background-color: rgb(250, 253, 253);" /></dd>
          </dl>
        </div>
         <div class="info">
          <dl>
            <dt>글쓴이</dt>          
            <dd><input type="text" name="writer" value="${board.writer}" readonly="readonly" style="background-color: azure;"/></dd>
          </dl>
          <!-- 
          <dl>
            <dt>비밀번호</dt>
            <dd><input type="password" placeholder="비밀번호 입력" /></dd>
          </dl>
        </div> -->
        <!-- <div class="cont">
          <textarea name="content" placeholder="내용 입력"></textarea>
        </div> -->
        
        <!-- 게시글 작성 -->
		<!-- 첨부파일 -->
        <!-- <div id="imageForm" class="col-l-3 col-md-3 col-sm-3 col-xs-12 section-header wow fadeInDown">
             <span id="profile_pic"> -->
                 <img id="myImg" src="" /><!--  class="img-circle" alt="Profile Image" style='object-fit:contain' 이미지 작게 나와서 div로 감은거 풀었음. -->
             <!-- </span> -->
			
            <br>
            <%-- 파일등록 --%>
			<div>	
				<label for="files" class="btn btn-primary" id="changeImgBtn">Select Image</label>		
				<input id="files" name="uploadFile" id="" type="file" accept='image/jpeg,image/gif,image/png' style="visibility:hidden;">
			</div>        
		</div>        
         <!-- </div> -->
         <!-- 첨부물 보여주기 -->
		<script>
			//현재 글 번호 가져오기->read->reply => 결과를 read
			var bnoVal = '${board.bno}';
		</script>
        <%-- 파일등록 --%>       
      </div>
    </div>    
	
    <div class="bt_wrap">
      <input type="submit" data-oper='modify' value="등록">
      <input type="reset" value="취소"></button>
      <!-- <input type="reset" data-oper='list' onclick="location.href='/board/board_photo_list'" value="리스트"> --><!-- 리스트 스크립트 걸면서 막음 -->
      <input type="submit" data-oper='list' value="리스트">
    </div>
    <input type="hidden" name="bno" value="${vo.bno }">
	</form>
	
<%-- remove와 list를 위한 폼--%>
<%-- 페이지 나누기 위해 필요한 값 세팅 --%>
<form action="" id="myform" method="post">
	<input type="hidden" name="bno" value="${board.bno }" />
	<input type="hidden" name="amount" value="${cri.amount }" />
	<input type="hidden" name="pageNum" value="${cri.pageNum }" />
	<%-- <input type="hidden" name="type" value="${cri.type }" />
	<input type="hidden" name="keyword" value="${cri.keyword }" />--%>
<%-- 시큐리티 때문에 추가 --%>
	<%-- <input type="hidden" name="writer" value="${board.writer }" />
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/><!-- post 방식으로 가는거에는 무조건 넣어- 없으면 에러뜨니까 --> --%>
</form>  
<%-- 스크립트 --%>	
<script>
$(function(){
	//커서 맨 뒤로
	var len = $("input[name='title']").val().length;
	$("input[name='title']").focus();
	$("input[name='title']")[0].setSelectionRange(len, len);
})
$(function(){
	//var form = $("#myform");

	$("input[type='submit']").click(function(e){
		e.preventDefault();	//submit 기능 막기
		
		var oper = $(this).data("oper");
		console.log(oper);
		
		if(oper == 'modify'){//수정-$("#myform") 이 폼을 보내서 에러 뜬거구나 값이 bno 뿐이 없으니까.
			var form = $("form[role='form']");
			//form.attr("action","board_photo_update");
			
			var str = "";
			//첨부파일 영역에 정보 수집  -- 이게 있어야 첨부파일을 읽어와서 새롭게 보내는 거구나
			//$(".uploadResult ul li").each(function(idx,obj){//인덱스랑 행이라고 했는데 행을 영역 잡은건가
			/* $(".uploadResult ul li").each(function(idx,obj){//인덱스랑 행이라고 했는데 행을 영역 잡은건가
				//var job = $(obj);
				var job = $("#myImg"); 																//이거구나2
				//수집된 정보를 hidden 태그로 작성
				str+="<input type='hidden' name='attachList["+idx+"].uuid' value='"+job.data("uuid")+"'>";
				str+="<input type='hidden' name='attachList["+idx+"].uploadPath' value='"+job.data("path")+"'>";
				str+="<input type='hidden' name='attachList["+idx+"].fileName' value='"+job.data("filename")+"'>";
				str+="<input type='hidden' name='attachList["+idx+"].fileType' value='"+job.data("type")+"'>";
			}) */
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
