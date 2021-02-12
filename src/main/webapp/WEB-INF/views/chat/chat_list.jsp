<%@page import="com.company.domain.YHChatRoomVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>

<!-- Breadcrumb Section Begin -->
<div class="breacrumb-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="breadcrumb-text">
					<span>게시판</span>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Breadcrumb Section Begin -->

<div class="board_wrap" style="margin-left: 5%; margin-right: 5%">
	<table class="board_list">
		<caption>게시판 목록</caption>
		<thead>
			<tr>
				<td>방번호</td>
				<td>이용 가능 여부</td>
			</tr>
<%
	List<YHChatRoomVO> list=(List<YHChatRoomVO>)request.getAttribute("list");
	YHChatRoomVO vo1=list.get(0);
	String room1State=vo1.getUseable()==1?"사용가능":"대기실로 입장";
	YHChatRoomVO vo2=list.get(1);
	String room2State=vo2.getUseable()==1?"사용가능":"대기실로 입장";
	YHChatRoomVO vo3=list.get(2);
	String room3State=vo3.getUseable()==1?"사용가능":"대기실로 입장";
%>
			<tr>
				<td>이용 불편 문의</td>
				<td>
				<%if(room1State.equals("사용가능")){ %>
				<a href="/chat/gotoRoom1"><%=room1State %></a>
				<% }else{ %>
				<a href="/chat/gotoWaittingRoom1"><%=room1State %></a>
				<%} %>
				</td>

			</tr>
			<tr>
				<td>강사 관련 문의</td>
				<td><a href="/chat/gotoRoom2"><%=room2State %></a></td>

			</tr>
			<tr>
				<td>기타 문의</td>
				<td><a href="/chat/gotoRoom3"><%=room3State %></a></td>

			</tr>

		</thead>
		<tbody>

		</tbody>
	</table>

</div>

<%@include file="../includes/footer.jsp"%>