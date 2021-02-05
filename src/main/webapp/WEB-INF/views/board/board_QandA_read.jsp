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

	<form action="/qandaboard/register" method="post">
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
    <div class="bt_wrap">
      <input type="submit" value="등록">
      <a href="#">취소</a>
    </div>
	</form>
	
   <%@include file="../includes/footer.jsp" %>
</html>
