<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/header.jsp" %>

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcrumb-text">
              <span>Q&A 게시판</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Breadcrumb Section Begin -->
<link rel="stylesheet" href="resources/css/boardList.css" type="text/css" />
    <div class="board_wrap" style="margin-left: 5%; margin-right: 5%">
      <table class="board_list" style="text-align: center;">
        <caption>
          게시판 목록
        </caption>
        <thead >
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>작성일</th>
            <th>조회</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>5</td>
            <td class="tit">
              <a href="#">게시글 테스트</a>
            </td>
            <td>테스터</td>
            <td>2020-01-01</td>
            <td>111</td>
          </tr>
          <tr>
            <td>4</td>
            <td class="tit">
              <a href="#">게시글 테스트</a>
            </td>
            <td>테스터</td>
            <td>2020-01-01</td>
            <td>222</td>
          </tr>
          <tr>
            <td>3</td>
            <td class="tit">
              <a href="#">게시글 테스트</a>
            </td>
            <td>테스터</td>
            <td>2020-01-01</td>
            <td>333</td>
          </tr>
          <tr>
            <td>2</td>
            <td class="tit">
              <a href="#">게시글 테스트</a>
            </td>
            <td>테스터</td>
            <td>2020-01-01</td>
            <td>222</td>
          </tr>
          <tr>
            <td>1</td>
            <td class="tit">
              <a href="#">게시글 테스트</a>
            </td>
            <td>테스터</td>
            <td>2020-01-01</td>
            <td>111</td>
          </tr>
        </tbody>
      </table>
      
      
      <div class="bt_wrap">
       <button><a href="/gotoWriterQuestion" class="btn btn-primary float-right" id="singinbtn">글 작성</button>
      </div>
    </div>

    <%@include file="../includes/footer.jsp" %>