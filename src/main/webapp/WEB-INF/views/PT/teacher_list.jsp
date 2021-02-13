<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<style>
	p > a > img {
	  box-sizing: border-box;
	  border-radius: 50%;
	  margin: 30px 30px 30px 30px;
	  min-width: 200px;
	  height: 200px;
	}
	
	.recommendProfileList {
		
	}
	
	
	
</style>

<div>
	<h2>추천 강사 리스트</h2>
    <ul class="recommendProfileList"></ul>
    <div class="recommendPageBtn"></div>
</div>
<!--  
<div>
	<h2>프로필 리스트</h2>
    <ul class="profileList"></ul>
    <div class="pageBtn"></div>
</div>-->

<script>

var profileList = $(".profileList");
var pageBtn = $(".pageBtn");

var recommendProfileList = $(".recommendProfileList");
var recommendPageBtn = $(".recommendPageBtn");

var page = 1;
var pageCount = 10;
var listCount = 10;

var recommendPage = 1;
var recommendPageCount = 10;
var recommendListCount = 10;

var showList = null;
var countPage = null;
var pageBtnFunc = null;

var recommendShowList = null;
var recommendCountPage = null;
var recommendPageBtnFunc = null;

showList = function(page, pageCount, listCount) {
    $.getJSON("/PT/profile/" + page + "/" + pageCount)
    .done(function(collection) {
		var arr = collection.list;
		var cnt = collection.profileCnt;
		
		console.log(cnt);
		
		var listLi = "";
		
		arr.forEach(function(element, index) {
		    var str = "<li data-usrid='" + element.userId + "' data-chid='" + element.channelId + "'>";
		    str += "<div>";
		    //str += "<p>" + "<a href='/PT/teacher_detail?usrid=" + element.userId + "'>" + "<img src='/user/teacherProfileDisplay?fileName=s_" + element.userId + "' />" + "</a>" + "</p>";
		    str += `<p><a href='/PT/teacher_detail?usrid=${"${element.userId}"}'><img src='/user/teacherProfileDisplay?fileName=s_${"${element.userId}"}' onerror='this.src="/resources/img/profile/test.jpg"' /></a></p>`;
		    str += "<p>" + element.userName + "</p>";
		    str += "<p>" + element.teacherInfo + "</p>";
		    str += "</div>"
		    str += "</li>";
		    
		    listLi += str;
		});
		
		profileList.html(listLi);
		
		countPage(cnt, page, pageCount, listCount);
    })
    .fail(function(jqxhr, textStatus, error) {
        console.log(jqxhr, textStatus, error);
    });
}

countPage = function(totalRows, page, pageCount, listCount) {
    var startPage = 1;
    var endPage = 1;
    var prev = false;
    var next = false;
    
    var totalPage = 0;
    
    if (totalRows % pageCount == 0) {
        totalPage = parseInt(parseFloat(totalRows) / pageCount);
    } else {
        totalPage = parseInt(parseFloat(totalRows) / pageCount) + 1;
    }
    
    if (totalRows > 0) {
        if (page % listCount == 0) {
            startPage = page - listCount + 1;
        } else {
            startPage = parseInt(page / listCount) * listCount + 1;
        }
            
        if (startPage + listCount - 1 <= totalPage) {
            endPage = startPage + listCount - 1;
        } else {
            endPage = totalPage;
        }
        
        if (startPage != 1) {
            prev = true;
        }
        
        if (endPage != totalPage) {
            next = true;
        }
    }
    
    var str = "<ul class='pagination'>";
    
    if (prev) {
        str += "<li class='page-item'><a class='page-link' href='" + 1 + "/" + pageCount + "/" + listCount + "'>";
        str += "First</a></li>";
        str += "<li class='page-item'><a class='page-link' href='" + (startPage - 1) + "/" + pageCount + "/" + listCount + "'>";
        str += "Prev</a></li>";
    }
    
    for (var i = startPage; i <= endPage; ++ i) {
        var active = page == i ? "active" : "";
        str += "<li class='page-item " + active + "'>";
        str += "<a class='page-link' href='" + i + "/" + pageCount + "/" + listCount + "'>" + i + "</a></li>";
    }
    
    if (next) {
        str += "<li class='page-item'><a class='page-link' href='" + (endPage + 1) + "/" + pageCount + "/" + listCount + "'>";
        str += "Next</a></li>";
        str += "<li class='page-item'><a class='page-link' href='" + totalPage + "/" + pageCount + "/" + listCount + "'>";
        str += "Last</a></li>";
    }
    
    str += "</ul>";
    
    pageBtn.html(str);
};

pageBtnFunc = function(event) {
    event.preventDefault();
        
    var str = $(this).attr("href").split("/").map(Number);
        
    page = str[0];
    pageCount = str[1];
    listCount = str[2];
        
    showList(page, pageCount, listCount);
};

recommendShowList = function(page, pageCount, listCount) {
    $.getJSON("/PT/recommendProfile/" + page + "/" + pageCount)
    .done(function(collection) {
		var arr = collection.list;
		var cnt = collection.profileCnt;
		
		var listLi = "";
		
		arr.forEach(function(element, index) {
		    var str = "<li data-usrid='" + element.userId + "' data-chid='" + element.channelId + "'>";
		    str += "<div>";
		    //str += "<p>" + "<a href='/PT/teacher_detail?usrid=" + element.userId + "'>" + "<img src='/user/teacherProfileDisplay?fileName=s_" + element.userId + "' />" + "</a>" + "</p>";
		    str += `<p><a href='/PT/teacher_detail?usrid=${"${element.userId}"}'><img src='/user/teacherProfileDisplay?fileName=s_${"${element.userId}"}' onerror='this.src="/resources/img/profile/test.jpg"' /></a></p>`;
		    str += "<p>" + element.userName + "</p>";
		    str += "<p>" + element.teacherInfo + "</p>";
		    str += "</div>"
		    str += "</li>";
		    
		    listLi += str;
		});
		
		recommendProfileList.html(listLi);
		
		recommendCountPage(cnt, page, pageCount, listCount);
    })
    .fail(function(jqxhr, textStatus, error) {
        console.log(jqxhr, textStatus, error);
    });
}

recommendCountPage = function(totalRows, page, pageCount, listCount) {
    var startPage = 1;
    var endPage = 1;
    var prev = false;
    var next = false;
    
    var totalPage = 0;
    
    if (totalRows % pageCount == 0) {
        totalPage = parseInt(parseFloat(totalRows) / pageCount);
    } else {
        totalPage = parseInt(parseFloat(totalRows) / pageCount) + 1;
    }
    
    if (totalRows > 0) {
        if (page % listCount == 0) {
            startPage = page - listCount + 1;
        } else {
            startPage = parseInt(page / listCount) * listCount + 1;
        }
            
        if (startPage + listCount - 1 <= totalPage) {
            endPage = startPage + listCount - 1;
        } else {
            endPage = totalPage;
        }
        
        if (startPage != 1) {
            prev = true;
        }
        
        if (endPage != totalPage) {
            next = true;
        }
    }
    
    var str = "<ul class='pagination'>";
    
    if (prev) {
        str += "<li class='page-item'><a class='page-link' href='" + 1 + "/" + pageCount + "/" + listCount + "'>";
        str += "First</a></li>";
        str += "<li class='page-item'><a class='page-link' href='" + (startPage - 1) + "/" + pageCount + "/" + listCount + "'>";
        str += "Prev</a></li>";
    }
    
    for (var i = startPage; i <= endPage; ++ i) {
        var active = page == i ? "active" : "";
        str += "<li class='page-item " + active + "'>";
        str += "<a class='page-link' href='" + i + "/" + pageCount + "/" + listCount + "'>" + i + "</a></li>";
    }
    
    if (next) {
        str += "<li class='page-item'><a class='page-link' href='" + (endPage + 1) + "/" + pageCount + "/" + listCount + "'>";
        str += "Next</a></li>";
        str += "<li class='page-item'><a class='page-link' href='" + totalPage + "/" + pageCount + "/" + listCount + "'>";
        str += "Last</a></li>";
    }
    
    str += "</ul>";
    
    recommendPageBtn.html(str);
};

recommendPageBtnFunc = function(event) {
    event.preventDefault();
        
    var str = $(this).attr("href").split("/").map(Number);
        
    recommendPage = str[0];
    recommendPageCount = str[1];
    recommendListCount = str[2];
        
    recommendShowList(recommendPage, recommendPageCount, recommendListCount);
};
     
pageBtn.on("click", "ul li a", pageBtnFunc);
recommendPageBtn.on("click", "ul li a", recommendPageBtnFunc);

showList(page, pageCount, listCount);
recommendShowList(recommendPage, recommendPageCount, recommendListCount);

</script>

<%@include file="../includes/footer.jsp" %>