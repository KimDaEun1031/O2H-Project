<%@page import="com.company.domain.KDLoginInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/admin_header.jsp" %>
<link rel="stylesheet" href="/resources/css/boardList.css" type="text/css" />
	
<style>
/* 리스트 링크 */
.paginate_button a{
	/* color: #009999; */
	font-weight: 600;
	font-size: 1.5rem;
	font-family: 'Open Sans', 'Helvetica Neue', Arial, sans-serif;	
}
.paginate_button a{
	display: flex;
    justify-content: center;
    align-items: center;
    width: 60px;
    height: 60px;
    font-size: 1.1rem;
    color: #999;
    background-color: #EEEEEE;
    margin: 10px;
    border-radius: 5px;
    text-decoration: none;
    transition: all 0.3s ease;
}
.paginate_button a:hover{
	background-color: #009999;
    color: #fff; 
}
/* 글작성 버튼 */
.testBtn {
	display: flex;
    justify-content: center;
    align-items: center;
    width: 800px;
    height: 40px;
    font-size: 1.1rem;
    color: #999;
    background-color: #EEEEEE;
    margin: 10px;
    border-radius: 5px;
    text-decoration: none;
    transition: all 0.3s ease;
    border-radius: 300px;
}
.primaryy{
	text-align: center;
}
.btn-primaryy {
    background-color: #009999;
    border: 0;
    border-radius: 5px;
    padding: 12px 50px 14px;
    font-size: 1.2rem;
    color: white;
}
.btn-primaryy:hover, .btn-primaryy:focus {
	color: #fff;
    background-color: #086969;
    font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS", sans-serif; 
}
</style>	
<!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="breadcrumb-text">
              <a class="nav-link nav-link-2" href="/admin/member_control">회원 관리</a>
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
								<div class="board_wrap" style="margin-left: 1%; margin-right: 3%;">
								     <table class="board_list" style="text-align: center;">
								       <caption>
								         회원 관리
								       </caption>
								       <thead >
								       	 <tr>
								       	 	<th colspan="6">회원 관리</th>
								       	 </tr>
								         <tr>
								           <th>아이디</th>
								           <th>이름</th>
								           <th>이메일</th>
								           <th>가입날짜</th>
								           <th>회원구분</th>
								           <th>관리</th>
								         </tr>
								       </thead>
								       <tbody>
								    		<c:forEach var="memlist" items="${memlist}">
									    		<tr>
									         		<td>${memlist.userId}</td>
										   			<td>${memlist.userName}</td>
										   			<td>${memlist.userEmail}</td>
										          	<td><fmt:formatDate value="${memlist.regDate }" pattern="yyyy-MM-dd HH:mm" /></td>
										         	<td id="userlevel" value="${memlist.user_level}">${memlist.user_level}</td>
										         	<td><a  href="${memlist.userId}" class="member-delete" style="color: red;">삭제</a>&nbsp;/
										         	<a href="${memlist.userId}" class="member-modify" style="color: darkblue;">수정</a></td>         		
									         	</tr>
									         </c:forEach>																	       
										</tbody>
								     </table>
								     <!-- start Pagination -->
									<div class="text-center" style="display: table; margin-left: auto; margin-right: auto;">
										<ul class="pagination" >
											<c:if test="${pageVO.prev}">
												<li class="paginate_button previous"><a href="${pageVO.startPage-1 }">Previous</a>
											</c:if>
											<c:forEach var="idx" begin="${pageVO.startPage}" end="${pageVO.endPage}">
												<li class="paginate_button ${pageVO.cri.pageNum==idx?'active':''}"><a href="${idx}">${idx}</a>
											</c:forEach>
											<c:if test="${pageVO.next}">
												<li class="paginate_button next"><a	href="${pageVO.endPage+1}">Next</a>
											</c:if>
										</ul>
									</div>
									<!-- end Pagination -->   								
								</div>
                            </div>                                       
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
   
    <form action="/admin/read" id="actionForm">
	   <input type="hidden" name="userId" />
	</form>    
	
    <script>
    window.onload=function(){

   	var actionForm=$("#actionForm")
   	
   	$(".paginate_button a").click(function(e){
   		//a 태그의 기능을 중지
   		e.preventDefault();
       	
   		//pagenum의 값을 사용자가 선택한 값으로 변경
   		//$("actionForm  [name='pageNum']").attr(value='$(this).text')
   		actionForm.find("input[name='pageNum']").val($(this).attr("href"))
   		console.log($(this).attr("href"));
   		console.log($(this));
   		actionForm.attr("action","member_control");
   		actionForm.submit();
   	})
   	
   	 
   	
   	$(".member-modify").click(function(e){
   		e.preventDefault();		
   		/* 
   		actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'> ");
   		 */
   		 actionForm.find("input[name='userId']").val($(this).attr("href"))
   			
   		actionForm.attr("action","read"); // /board/read
   		actionForm.submit();

   })
   
   $(".member-delete").click(function(e){
   		e.preventDefault();		
   		/* 
   		actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'> ");
   		 */
   		 actionForm.find("input[name='userId']").val($(this).attr("href"))
   			
   		actionForm.attr("action","delete"); // /board/read
   		actionForm.submit();

   })
    }

 
 
</script>

<%@include file="../includes/admin_footer.jsp" %>