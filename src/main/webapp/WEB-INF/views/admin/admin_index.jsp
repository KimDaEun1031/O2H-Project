<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/admin_header.jsp" %>
<link rel="stylesheet" href="/resources/css/boardList.css" type="text/css" />
	                             
		<div class="board_wrap" style="margin: 50px 10%;">
		     <table class="board_list" style="text-align: center;">
		       <caption>
		         신규가입자목록
		       </caption>
		       <thead >
		       	 <tr>
		       	 	<th colspan="5">신규 가입자 목록</th>
		       	 </tr>
		         <tr>
		           <th>아이디</th>
		           <th>이름</th>
		           <th>이메일</th>
		           <th>가입날짜</th>
		           <th>회원구분</th>
		         </tr>
		       </thead>
		       <tbody>
		    		<c:forEach var="newlist" items="${newlist}">
			    		<tr>
			         		<td>${newlist.userId}</td>
				   			<td>${newlist.userName}</td>
				   			<td>${newlist.userEmail}</td>
				          	<td><fmt:formatDate value="${newlist.regDate }" pattern="yyyy-MM-dd HH:mm" /></td>
				         	<td id="userlevel" value="${newlist.user_level}">${newlist.user_level}</td>         		
			         	</tr>
			         </c:forEach>																	       
				</tbody>
		     </table>								
		</div>
    
<%@include file="../includes/admin_footer.jsp" %>

 