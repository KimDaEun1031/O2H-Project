<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<style>
	.status {
		display: none;
	}
</style>
	<div>
		<button id="addVideoBtn">New Video</button>
	</div>
	<div class="embededDiv">
		<ul></ul>
		<div class="pageBtn"></div>
	</div>
	
<!-- 비디오 등록 -->
<div class="addVideoForm">
	<div >
		<h5>등록</h5>
	</div>
	<div>
		<form class="addForm">
			<div>
				<label for="">비디오 ID</label>
				<input type="text" name="videoId" value="비디오 ID"/>
			</div>
			<div>
				<label for="">설명</label>
				<input type="text" name="videoInfo" value="설명"/>
			</div>
			<div>
				<button type="button" id="registerBtn">등록</button>
				<button type="button" id="resetBtn">리셋</button>
				<button type="button" id="closeBtn">닫기</button>
			</div>
		</form>
	</div>
</div>

<!-- 비디오 수정 -->
<div class="modifyVideoForm">
	<div >
		<h5>수정</h5>
	</div>
	<div>
		<form class="modifyForm">
			<input type="hidden" name="videoInfo" value=""/>
			<div>
				<label for="">비디오 ID</label>
				<input type="text" name="videoId" value="비디오 ID" readonly/>
			</div>
			<div>
				<label for="">설명</label>
				<input type="text" name="videoInfo" value="설명" />
			</div>
			<div>
				<label for="">작성일</label>
				<input type="text" name="regDate" value="작성일" readonly />
			</div>
			<div>
				<label for="">수정일</label>
				<input type="text" name="updateDate" value="수정일" readonly/>
			</div>
			<div>
				<button type="button" id="modifyBtn">수정</button>
				<button type="button" id="removeBtn">삭제</button>
				<button type="button" id="resetBtn">리셋</button>
				<button type="button" id="closeBtn">닫기</button>
			</div>
		</form>
	</div>
</div>
	
	<button class="contentBtn" type="submit" data-oper='list'>목록</button> 
	
	<script>
		var userId = "${profile.userId}";
		
		var videoDiv = $(".embededDiv ul");
		
		var contentBtn = $(".contentBtn");
		
		var addVideoForm = $(".addVideoForm");
		var modifyVideoForm = $(".modifyVideoForm");
		
		var addVideoBtn = $("#addVideoBtn");
		
		var registerBtn = $("button#registerBtn");
		
		var modifyBtn = $("button#modifyBtn");
		var removeBtn = $("button#removeBtn");
		
		var resetBtn = $("button#resetBtn");
		var closeBtn = $("button#closeBtn");
		
		var page = 1;
		var pageCount = 1;
		var listCount = 1;
		
		var totalCnt = 0;

		var videoService = null;
		
		var getList = null;
		var getInfo = null;
		
		var countPage = null;
		
		var movePage = null;
		
		var showVideo = null;
		
		var updateInit = null;
		
		var videoUIFunc = null;
		
		var addVideoBtnFunc = null;
		
		var registerBtnFunc = null;
		
		var modifyBtnFunc = null;
		var removeBtnFunc = null;
		
		var resetBtnFunc = null;
		var closeBtnFunc = null;
		
		videoService = (function() {
			return {
				insert : function (vo, callback) {
					console.log("insert");

					$.ajax({
						url: "/video/movie",
						type: "post",
						contentType: "application/json;charset=utf-8",
						data: JSON.stringify(vo),
						success: function(result) {
							callback(result);
						},
						
						error: function(jqxhr, textStatus, error) {
							console.log(jqxhr, textStatus, error);
						}
					});
				},
				
				update : function(vo, callback) {
					console.log("update");
					
					$.ajax({
						url: "/video/movie" + "/" + vo.userId + "/" + vo.videoId,
						type: "patch",
						contentType: "application/json;charset=utf-8",
						data: JSON.stringify(vo),
						success: function(result) {
							callback(result);
						},
						
						error: function(jqxhr, textStatus, error) {
							console.log(jqxhr, textStatus, error);
						}
					});
				},
				
				delete : function(vo, callback) {
					console.log("delete");
					
					$.ajax({
						url: "/video/movie" + "/" + vo.userId + "/" + vo.videoId,
						type: "delete",
						success: function(result) {
							callback(result);
						},
						
						error: function(jqxhr, textStatus, error) {
							console.log(jqxhr, textStatus, error);
						}
					});
				},
				
				list : function(vo, callback) {
					console.log("list");
					
					$.getJSON("/video/list/" + vo.userId + "/" + vo.page + "/" + vo.pageCount)
					.done(function(json) {
						callback(json);
					})
					.fail(function(jqxhr, textStatus, error) {
						console.log(jqxhr, textStatus, error);
					});
				},
				
				row : function(vo, callback) {
					console.log("row");
					
					$.getJSON("/video/movie/" + vo.userId + "/" + vo.videoId)
					.done(function(json) {
						callback(json);
					})
					.fail(function(jqxhr, textStatus, error) {
						console.log(jqxhr, textStatus, error);
					});
				}
			}
		})();
		
		getList = function(userId, page, pageCount, listCount) {
			var callback = function(json) {
				var arr = json.list;
				var cnt = json.videoCnt;
				
				var listLi = "";
				
				arr.forEach(function(element, index) {
				    var str = "<li data-usrid='" + element.userId + "' data-vidid='" + element.videoId + " 'data-vidinf='" + element.videoInfo + "'>";
				    str += "<div>";
				    str += "<p>" + "<img src='https://img.youtube.com/vi/" + element.videoId + "/default.jpg" + "' />" + element.videoInfo + "</p>";
				    str += "<p>" + element.regDate + "</p>";
				    str += "<p>" + element.updateDate + "</p>";
				    str += "</div>"
				    str += "</li>";
				    
				    listLi += str;
				});
				
				videoDiv.html(listLi);
				
				totalCnt = cnt;
				
				countPage(cnt, page, pageCount, listCount);
			}
			
			videoService.list({
					userId: userId,
					page: page,
					pageCount: pageCount
				}, callback);
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

        $(".pageBtn").on("click", ".pagination .page-item .page-link", movePage);

        updateInit = function() {
    		getList(userId, page, pageCount, listCount);
    		
    		addVideoForm.css("display", "none");
    		modifyVideoForm.css("display", "none");
    	}
        
    	videoUIFunc = function(event) {
    		var videoId = $(this).data("vidid");
    		
    		var callback = function(data) {
    			modifyVideoForm.find("input[type='hidden']").val(data.videoInfo);
    			
				var videoId = modifyVideoForm.find("[name='videoId']");
        		var videoInfo = modifyVideoForm.find("[name='videoInfo']");
        		var regDate = modifyVideoForm.find("[name='regDate']");
        		var updateDate = modifyVideoForm.find("[name='updateDate']");

        		videoId.val(data.videoId);
        		videoInfo.val(data.videoInfo);
        		regDate.val(data.regDate);
        		updateDate.val(data.updateDate);

        		addVideoForm.css("display", "none");
        		
    			modifyVideoForm.css("display", "block");
    		}
    		
    		videoService.row({
    			userId: userId,
    			videoId : videoId
    		}, callback);
    	}
    	
    	addVideoBtnFunc = function(event) {
    		var videoId = addVideoForm.find("[name='videoId']");
    		var videoInfo = addVideoForm.find("[name='videoInfo']");
    		
    		videoId.val("");
    		videoInfo.val("");
    		
    		modifyVideoForm.css("display", "none");
    		
    		addVideoForm.css("display", "block");
    	};
        
    	registerBtnFunc = function(event) {
    		var videoId = addVideoForm.find("[name='videoId']");
    		var videoInfo = addVideoForm.find("[name='videoInfo']");
    		
    		var callback = function(data) {
    			addVideoForm.css("display", "none");
    			
    			totalCnt = totalCnt + 1;
    			
    			if ((totalCnt) % pageCount == 0) {
    				page = parseInt(parseFloat(totalCnt) / pageCount);
    			} else {
    				page = parseInt(parseFloat(totalCnt) / pageCount) + 1;
    			}
    			
    			getList(userId, page, pageCount, listCount);
    		}
    		
    		videoService.insert({
    			userId: userId,
    			videoId: videoId.val(),
    			videoInfo: videoInfo.val()
    		}, callback);		
    	};
    	
    	modifyBtnFunc = function(event) {
    		var videoId = modifyVideoForm.find("[type='text'][name='videoId']").val();
			var videoInfo = modifyVideoForm.find("[type='text'][name='videoInfo']").val();
			
    		var callback = function(result) {
				modifyVideoForm.css("display", "none");
				
				getList(userId, page, pageCount, listCount);
    		};
    		
    		videoService.update({
    			userId: userId,
    			videoId: videoId,
    			videoInfo: videoInfo
    		}, callback);		
    	};
    	
    	removeBtnFunc = function(event) {
    		var videoId = modifyVideoForm.find("[name='videoId']").val();
    		
    		var callback = function(event) {
    			modifyVideoForm.css("display", "none");
	
				totalCnt = totalCnt - 1;

				if ((totalCnt) % pageCount == 0) {
					page = parseInt(parseFloat(totalCnt) / pageCount);
				} else {
					page = parseInt(parseFloat(totalCnt) / pageCount) + 1;
				}
			
				getList(userId, page, pageCount, listCount);
    		};
    		
    		videoService.delete({
    			userId: userId,
    			videoId: videoId
    		}, callback);
    	}		
    	
    	resetBtnFunc = function(event) {
    		if ($(this).closest("form").prop("class") == "addForm") {
    			event.preventDefault();
    			
    			var videoId = addVideoForm.find("[name='videoId']");
        		var videoInfo = addVideoForm.find("[name='videoInfo']");

        		videoId.val("");
        		videoInfo.val("");
    		} else {
    			event.preventDefault();

    			var videoInfo = modifyVideoForm.find("[name='videoInfo']");
    			
    			videoInfo.val(modifyVideoForm.find("input[type='hidden']").val());
    		}
    	};
    	
    	closeBtnFunc = function(event) {
    		if ($(this).closest("form").prop("class") == "addForm") {
    			event.preventDefault();
    			
    			var videoId = addVideoForm.find("[name='videoId']");
        		var videoInfo = addVideoForm.find("[name='videoInfo']");
        		
        		videoId.val("");
        		videoInfo.val("");
    			
    			addVideoForm.css("display", "none");
    		} else {
    			event.preventDefault();
    			
    			var videoId = modifyVideoForm.find("[name='videoId']");
        		var videoInfo = modifyVideoForm.find("[name='videoInfo']");
        		var regDate = modifyVideoForm.find("[name='regDate']");
        		var updateDate = modifyVideoForm.find("[name='updateDate']");
        		
        		videoId.val("");
        		videoInfo.val("");
        		regDate.val("");
        		updateDate.val("");
    			
    			modifyVideoForm.css("display", "none");
    		}
    	};
    	
        addVideoBtn.click(addVideoBtnFunc);
        
        registerBtn.click(registerBtnFunc);
        
        videoDiv.on("click", "li", videoUIFunc);
        
        modifyBtn.click(modifyBtnFunc);
    	removeBtn.click(removeBtnFunc)
    	
        resetBtn.click(resetBtnFunc);
        closeBtn.click(closeBtnFunc);
        
        contentBtn.click(function(e) {
			var oper = $(this).data("oper");
			
			if (oper == "list") {
				e.preventDefault();

				location.href = "/user/teacher_page";
			} else {
				return;	
			}
		});

    	updateInit();
	</script>
<%@include file="../includes/footer.jsp" %>