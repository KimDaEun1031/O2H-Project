<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <a href="./shop.html">Shop</a>
                        <span>Food</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--서브 카테고리-->
    <div class="tygh-content clearfix">
        <div class="container-fluid content-grid product-list-grid">
        <div class="row-fluid ">			
          <div class="span16 top-product-category-grid" >
                  <div class=" sub-category-breadcrumbs">
            <div id="breadcrumbs_9"> 
            <div class="ty-breadcrumbs clearfix jq_ty-breadcrumbs">
        </div>
      </div><div class="sub-category-wrap" data-clone="N" data-categoryid="1054">  
        <div class="sub-category">
            <ul class="sub-category-items">
              <li class="sub-category-item">
                <a
                  href="#"
                  class="sub-category-item-link ko"
                >
                  <span class="sub-category-item-link-title">단백질</span>
                </a>
              </li>
              <li class="sub-category-item">
                <a
                  href="#"
                  class="sub-category-item-link ko"
                >
                  <span class="sub-category-item-link-title">다이어트</span>
                </a>
              </li>
              <li class="sub-category-item">
                <a
                  href="#"
                  class="sub-category-item-link ko"
                >
                  <span class="sub-category-item-link-title">보조영양제</span>
                </a>
              </li>
              <li class="sub-category-item">
                <a
                  href="#"
                  class="sub-category-item-link ko"
                >
                  <span class="sub-category-item-link-title">다이어트2</span>
                </a>
              </li>
              <!-- ul -->
            </ul>
    </div>
  
    <!-- recommand 보충제 Banner Section Begin -->
    <section class="recommand-product one-banner">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 offset-lg-1">
                    <div class="product-list">
                        <div class="row">
                            <div class="col-lg-4 col-sm-6">
                                <div class="product-item">
                                    <div class="pi-pic">
                                        <a href="product-detail.html"><img src="/resources/img/products/product-1.jpg" alt=""></a>
                                        <div class="icon" onclick="IconClick()">
                                            <i class="icon_heart_alt" id="heart"></i>
                                        </div>
                                        <ul>
                                            <li class="w-icon active"><a href="shopping-cart.html"><i class="icon_bag_alt"></i></a></li>
                                            <li class="quick-view"><a data-toggle="modal" href="#exampleModal">+ 바로가기</a></li>
                                        </ul>
                                    </div>
                                    <div class="pi-text">
                                        <div class="catagory-name">단백질</div>
                                        <a href="product-detail.html">
                                            <h5>Pure Pineapple</h5>
                                        </a>
                                        <div class="product-price">
                                            $14.00
                                        </div>
                                    </div>
                                </div>
                            </div>

                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- recommand 보충제 Banner Section End -->

    <!--Pagination 페이지 나누기 -->
    <div aria-label="Page navigation example">
        <ul class="pagination">
          <li class="page-item"><a class="page-link" href="#">Previous</a></li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>
    </div>
    
    <!--modal : add the cart-->
   <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
       <div class="modal-dialog" role="document"> 
           <div class="modal-content"> 
               <div class="modal-header"> 
                   <h5 class="modal-title" id="exampleModalLabel">제품이 장바구니에 추가되었습니다.</h5> 
                   <button type="button" class="close" data-dismiss="modal" aria-label="Close"> 
                       <span aria-hidden="true">&times;</span> 
                    </button> 
                </div> 
                <div class="modal-body">
                	장바구니에 제품이 1개 추가되었습니다.     
                </div> 
                    <div class="modal-footer"> 
                        <a class="btn btn-secondary" href="./shopping-cart.html">장바구니</a> 
                        <button type="button" class="btn btn-primary" data-dismiss="modal" >계속 쇼핑하기</button> 
                    </div> 
                </div> 
            </div> 
        </div>
    </div>
    <script>
	  //모달
		$('.pd-cart').modal(options)
    </script>
    <script>
	    //하트 아이콘 애니메이션 작업 완료
	    var iconclick = 0;
	    function IconClick() {
	        if(iconclick==0) {
	            $("#heart").attr('class','icon_heart');
	            iconclick=1;
	        }
	        else if(iconclick==1){
	            $("#heart").attr('class','icon_heart_alt');
	            iconclick=0;
	        }
	    }

	</script>
<%@include file="../includes/footer.jsp" %>