<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/admin_header.jsp" %>
<link rel="stylesheet" href="/resources/css/boardList.css" type="text/css" />
	<!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcrumb-text">
              <a class="nav-link nav-link-2" href="/admin/admin_teacher_list">강사 목록</a>
            </div>
          </div>
        </div>
      </div>
    </div>
	<section class="recommand-product one-banner">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                   <div class="list-group" style="text-align: center; width: 200px; height: 500px; margin-left: 50%" >
					  <button type="button" class="list-group-item active" style="background: #e7ab3c; border-color: #e7ab3c;">회원 관리</button>
					  <button type="button" class="list-group-item list-group-item-action" onclick="location.href='admin_member'">관리자 목록</button>
  					  <button type="button" class="list-group-item list-group-item-action" onclick="location.href='admin_teacher_list'">강사 목록</button>
  					  <button type="button" class="list-group-item list-group-item-action" onclick="location.href='member_control'">회원 관리</button>
					</div>
                </div>
                <div class="col-lg-8 offset-lg-1">                
                    <div class="product-list">
                        <div class="row">
                            <div class="col-lg-4 col-lg-10">                             
								<div class="board_wrap" style="margin-left: 1%; margin-right: 5%;">
								     <table class="board_list" style="text-align: center;">
								       <caption>
								         회원관리
								       </caption>
								       <thead >
								       	 <tr>
								       	 	<th colspan="5">강사 리스트</th>
								       	 </tr>
								         <tr>
								           <th>아이디</th>
								           <th>이름</th>
								           <th>이메일</th>
								           <th>가입날짜</th>
								         </tr>
								       </thead>
								       <tbody>
								    		<c:forEach var="teacherlist" items="${teacherlist}">
									    		<tr>
									         		<td>${teacherlist.userId}</td>
										   			<td>${teacherlist.userName}</td>
										   			<td>${teacherlist.userEmail}</td>
										          	<td><fmt:formatDate value="${teacherlist.regDate }" pattern="yyyy-MM-dd HH:mm" /></td>         		
									         	</tr>
									         </c:forEach>																	       
										</tbody>
								     </table>								
								</div>
                            </div>                                       
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

<%@include file="../includes/admin_footer.jsp" %>