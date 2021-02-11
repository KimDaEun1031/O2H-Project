<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<style>
	.status {
		display: none;
	}
</style>
	<div class="liveDiv">
		<iframe class="videoFrame" width="560" height="315" src="" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		<p class="status">no live streaming</p>
		<button class="showLive">Live</button>
	</div>
	<div class="embededDiv">
		<ul></ul>
		<div class="pageBtn"></div>
	</div>
	<button onclick="location.href='/PT/teacher_list'">강사 목록</button>
	<script>
		var apiKey = "AIzaSyAOQSvt0FKgLocbNvkVO-KwrmdG8-sHs9E";
		
		var userId = "${profile.userId}";
		var channelId = "${profile.channelId}";
		var page = 1;
		var pageCount = 10;
		var listCount = 10;
		
		var getLive = null;
		var getList = null;
		var getInfo = null;
		
		var countPage = null;
		
		var movePage = null;
		
		var showVideo = null;
		
		getLive = function(channelId) {
            var url = "https://www.googleapis.com/youtube/v3/search?part=snippet&channelId=" + channelId + "&eventType=live&type=video&key=" + apiKey;
            
            $.ajax({
                url: url,
                success:function(data) {
                    if(data.items.length != 0) {
                    	$(".videoFrame").prop("src", 'https://www.youtube.com/embed/' + data.items[0].id.videoId);

                    } else {
                    	$(".videoFrame").prop("src", "");
                    	$(".videoFrame").css("display", "none");

                        $(".liveDiv p").css("display", "block");
                    }
                },
	            error: function(jqxhr, textStatus, error) {
					console.log(jqxhr, textStatus, error);
					
					$(".videoFrame").prop("src", "");
                	$(".videoFrame").css("display", "none");

                    $(".liveDiv p").css("display", "block");
				}
            });
        };
		
		getList = function(userId, page, pageCount, listCount) {
		    $.getJSON("/video/list/" + userId + "/" + page + "/" + pageCount)
		    .done(function(collection) {
				var arr = collection.list;
				var cnt = collection.videoCnt;

				console.log(collection);
				
				var listLi = "";
				
				arr.forEach(function(element, index) {
				    var str = "<li data-usrid='" + element.userId + "' data-vidid='" + element.videoId + " 'data-vidinf='" + element.videoInfo + "'>";
				    str += "<div>";
				    str += "<p>" + "<img src='https://img.youtube.com/vi/" + element.videoId + "/default.jpg' />" + element.videoInfo + "</p>";
				    str += "<p>" + element.regDate + "</p>";
				    str += "<p>" + element.updateDate + "</p>";
				    str += "</div>"
				    str += "</li>";
				    
				    listLi += str;
				});
				
				$(".embededDiv ul").html(listLi);
				
				countPage(cnt, page, pageCount, listCount);
		    })
		    .fail(function(jqxhr, textStatus, error) {
		        console.log(jqxhr, textStatus, error);
		    });
		};

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

            if (page > totalPage) {
                page = totalPage;
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
                str += "<li class='page-item'><a class='page-link' data-page='1'>";
                str += "First</a></li>";
                str += "<li class='page-item'><a class='page-link' data-page='" + (startPage - 1) + "'>";
                str += "Prev</a></li>";
            }
            
            for (var i = startPage; i <= endPage; ++ i) {
                var active = page == i ? "active" : "";
                str += "<li class='page-item " + active + "'>";
                str += "<a class='page-link' data-page='" + i + "'>" + i + "</a></li>";
            }
            
            if (next) {
            	str += "<li class='page-item'><a class='page-link' data-page='" + (endPage + 1) + "'>";
                str += "Next</a></li>";
                str += "<li class='page-item'><a class='page-link' data-page='" + (totalPage) + "'>";
                str += "Last</a></li>";
            }
            
            str += "</ul>";
            
            $(".pageBtn").html(str);
        };
        
        movePage = function(event) {
        	var page = $(this).data("page");

        	getList(userId, page, pageCount, listCount);
        }
        
        showVideo = function(event) {
        	var videoId = $(this).data("vidid");
        	
        	$.ajax({
                url: "https://www.youtube.com/oembed?url=https://www.youtube.com/watch?v=" + videoId + "&format=json",
                success:function(data) {
                	$(".videoFrame").css("display", "block");
                	
                	$(".liveDiv p").css("display", "none");
                	
                	$(".videoFrame").prop("src", "https://www.youtube.com/embed/" + videoId);
                },
	            error: function(jqxhr, textStatus, error) {
					console.log(jqxhr, textStatus, error);
					
					$(".videoFrame").css("display", "none");
		        	
		        	$(".liveDiv p").css("display", "block");
		        	
		        	$(".videoFrame").prop("src", "");
				}
            });
        };
		
        $(".embededDiv ul").on("click", "li", showVideo);
        $(".pageBtn").on("click", ".pagination .page-item .page-link", movePage);
        
        $(".showLive").click(function(event) {
        	getLive(channelId);
        });
        
		getLive(channelId);
		getList(userId, page, pageCount, listCount);
	</script>
<%@include file="../includes/footer.jsp" %>