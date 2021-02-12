<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/admin_header.jsp" %>
<link rel="stylesheet" href="/resources/css/boardList.css" type="text/css" />
	
	
	<section class="recommand-product one-banner">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                   <div class="list-group" style="text-align: center; width: 200px; height: 500px; margin-left: 50%" >
					  <button type="button" class="list-group-item active" style="background: #e7ab3c; border-color: #e7ab3c;">회원 관리</button>
					  <button type="button" class="list-group-item list-group-item-action" onclick="location.href='admin_member'">관리자 리스트</button>
  					  <button type="button" class="list-group-item list-group-item-action" onclick="location.href='admin_teacher_list'">강사 리스트</button>
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
										         	<td><a  data-toggle="modal" href="#exampleModal" class="member-delete" style="color: red;">삭제</a>/
										         	<a data-toggle="modal" href="#exampleModal2" class="member-modify" style="color: darkblue;">수정</a></td>         		
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
     <!--modal : add the cart-->
   <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
       <div class="modal-dialog" role="document"> 
           <div class="modal-content"> 
               <div class="modal-header"> 
                   <h5 class="modal-title" id="exampleModalLabel">정말로 삭제하시겠습니까?</h5> 
                   <button type="button" class="close" data-dismiss="modal" aria-label="Close"> 
                       <span aria-hidden="true">&times;</span> 
                    </button> 
                </div> 
                <div class="modal-body">
                	한 번 삭제하면 다시 계정을 생성해야합니다!
                </div> 
                    <div class="modal-footer"> 
                        <a class="btn btn-secondary" href="/admin/delete" id="delete">삭제</a> 
                        <button type="button" class="btn btn-primary" data-dismiss="modal" >취소</button> 
                    </div> 
                </div> 
            </div> 
        </div>
    </div>
    
     <!--modal : add the cart-->
   <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
       <div class="modal-dialog" role="document"> 
           <div class="modal-content"> 
               <div class="modal-header"> 
                   <h5 class="modal-title" id="exampleModalLabel">회원 구분 수정</h5> 
                   <button type="button" class="close" data-dismiss="modal" aria-label="Close"> 
                       <span aria-hidden="true">&times;</span> 
                    </button> 
                </div> 
                <div class="modal-body">
                	<label for="">회원 구분(0/1/2)</label><br/>
                	<input type="text" value="" style="text-align:center; width:50px; height:30px;" readonly/> --> <input type="text" style="text-align:center; width:50px; height:30px;" />
                </div> 
                    <div class="modal-footer"> 
                        <a class="btn btn-secondary" href="#">수정</a> 
                        <button type="button" class="btn btn-primary" data-dismiss="modal" >취소</button> 
                    </div> 
                </div> 
            </div> 
        </div>
    </div>
    <form action="" id="actionForm">
	   <input type="hidden" name="pageNum" value="${pageVO.cri.pageNum }"/>
	</form>      
    <script>
 window.onload=function(){
	 
	 history.replaceState({}, null, null);
	 
	 console.log("${loginInfo}"+"123");
	 if("${loginInfo.userId}"!=""){
			 document.getElementById("singinbtn").removeAttribute("hidden");
	 }
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


})
 }
 
 $('.member-delete').modal(options);
 $('.member-modify').modal(options);
</script>

<%@include file="../includes/admin_footer.jsp" %>