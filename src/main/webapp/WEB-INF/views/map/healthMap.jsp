<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<%
	request.setAttribute("apiKey", "b8dead9a56bb240f9a78bd371ec26f7f");
%>
<!-- Kakao Javascript API + Services와 Clusterer, Drawing 라이브러리 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${apiKey}&libraries=services,clusterer,drawing"></script>

<div id="map" style="width:500px;height:400px;"></div>

<div>
	<button class="resetMap">현재 위치</button>
</div>

<div>
	<div class="listLocation"></div>
	<div class="pageBtn"></div>
</div>

<div>
	<div class="nearListLocation"></div>
	<div class="nearPageBtn d-none">
		<ul class='pagination nearPagination'>
			<li class='page-item'><a class='page-link first-page' href=''>First</a></li>
			<li class='page-item'><a class='page-link prev-page' href=''>Prev</a></li>
			<li class='page-item'><a class='page-link active current-page' href=''></a></li>
			<li class='page-item'><a class='page-link next-page' href=''>Next</a></li>
			<li class='page-item'><a class='page-link last-page' href=''>Last</a></li>
		</ul>
		<input class='pageValue' type='text' />
		<button class='goPage'>Go</button>
	</div>
</div>

<div class="locationContent"></div>
<script>
var map = null;

var currentMarker = null;
var currentInfoWindow = null;

var latitude = 37.5693656626833; // 위도
var longitude = 126.986022414113; // 경도

var page = 1;
var pageCount = 5;
var listCount = 5;

var resetMap = document.getElementsByClassName("resetMap")[0];

var listLocation = document.getElementsByClassName("listLocation")[0];
var pageBtn = document.getElementsByClassName("pageBtn")[0];

var nearListLocation = document.getElementsByClassName("nearListLocation")[0];
var nearPageBtn = document.getElementsByClassName("nearPageBtn")[0];

var locationContent = document.getElementsByClassName("locationContent")[0];

var showList = null;
var countPage = null;
var pageBtnFunc = null;

var listFunc = null;
var resetFunc = null;

var initMap = null;

var getCoords = null;

var pagePrev = null;
var pageNext = null;
var pageFirst = null;
var pageLast = null;

var pageSelect = null;

window.onload = function(event) {
	showList = function(page, pageCount, listCount) {
		var xhr = new XMLHttpRequest();
		
		var callback = function(event) {
			if (xhr.readyState == xhr.DONE) {
				if (xhr.status == 200) {
					var json = JSON.parse(xhr.response);
					
					var arr = json.list;
					var cnt = json.mapLocationCnt;
					
					var listLi = "";

					arr.forEach(function(element, index) {
						var name = element.name;
						var address = element.address;
						var content = element.content;
						var latitude = element.latitude;
						var longitude = element.longitude;
						
						var str = `<li data-name='${"${name}"}' data-address='${"${address}"}' data-content='${"${content}"}' data-latitude='${"${latitude}"}' data-longitude='${"${longitude}"}'>`;
						str += "<div>";
						str += `<p>${"${name}"}</p>`;
						str += `<p>${"${address}"}</p>`;
						str += "</div>"
						str += "</li>";
					    
					    listLi += str;
					});
					
					listLocation.innerHTML = listLi;
					
					countPage(cnt, page, pageCount, listCount);
				} else {
					console.log(xhr.status);
				}
			}			
		};
		
		xhr.onreadystatechange = callback;
		
		xhr.open("GET", "/map/list/" + page + "/" + pageCount);
		
		xhr.send();
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
	    
	    pageBtn.innerHTML = str;
	};
	
	pageBtnFunc = function(event) { 
	    if (event.target.tagName == "A") {
	    	event.preventDefault();
	    	
	    	var str = event.target.getAttribute("href").split("/").map(Number);
	    	
	    	page = str[0];
		    pageCount = str[1];
		    listCount = str[2];
		    
		    showList(page, pageCount, listCount);
	    }
	};
	
	initMap = function() {
		navigator.geolocation.getCurrentPosition(function(pos) {
			latitude = pos.coords.latitude;
			longitude = pos.coords.longitude;
			
			var container = document.getElementById('map'); //지도 DOM 객체

			var options = { //지도 생성 기본 옵션
				center: new kakao.maps.LatLng(latitude, longitude), //지도의 중심좌표 (위도, 경도)
				level: 4 //지도의 레벨 (확대, 축소)
			};

			map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
			var markerPosition  = new kakao.maps.LatLng(latitude, longitude); //마커 위치 (위도, 경도)

			var marker = new kakao.maps.Marker({ // 마커 생성
			    position: markerPosition,
			    clickable: true
			});
			
			//인포윈도우 표시 위치입니다
			var infoWindowPosition = new kakao.maps.LatLng(latitude, longitude);
			//인포윈도우에 표출될 내용 (HTML 문자열이나 DOM 객체)
			var infoWindowContent = `<div style="padding:5px;">현재 위치</div>`;
			
			var infowindow = new kakao.maps.InfoWindow({
			    position : infoWindowPosition, 
			    content : infoWindowContent
			});
			
			marker.setMap(map);
			
			// 마커 위에 인포윈도우를 표시
			infowindow.open(map, marker); 
			
			currentMarker = marker;
		    currentInfoWindow = infowindow;
		}, function(code) {
			document.getElementsByClassName("resetMap")[0].textContent = "기본 위치";
			
			var container = document.getElementById('map'); //지도 DOM 객체

			var options = { //지도 생성 기본 옵션
				center: new kakao.maps.LatLng(latitude, longitude), //지도의 중심좌표 (위도, 경도)
				level: 4 //지도의 레벨 (확대, 축소)
			};

			map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
			var markerPosition  = new kakao.maps.LatLng(latitude, longitude); //마커 위치 (위도, 경도)

			var marker = new kakao.maps.Marker({ // 마커 생성
			    position: markerPosition,
			    clickable: true
			});
			
			//인포윈도우 표시 위치입니다
			var infoWindowPosition = new kakao.maps.LatLng(latitude, longitude);
			//인포윈도우에 표출될 내용 (HTML 문자열이나 DOM 객체)
			var infoWindowContent = `<div style="padding:5px;">기본 위치</div>`;
			
			var infowindow = new kakao.maps.InfoWindow({
			    position : infoWindowPosition, 
			    content : infoWindowContent
			});
			
			marker.setMap(map);
			
			// 마커 위에 인포윈도우를 표시
			infowindow.open(map, marker); 
			
			currentMarker = marker;
		    currentInfoWindow = infowindow;
		});
	};
	
	listFunc = function(event) {
		if (event.target.tagName == "LI" || event.target.tagName == "P") {
			
			if (currentMarker != null) {
				currentMarker.setMap(null);
			}
			
			if (currentInfoWindow != null) {
				currentInfoWindow.close();
			}
			
			var name = null;
			var address = null;
			var content = null;
			var latitude = null;
			var longitude = null;
			
			if (event.target.tagName == "LI") {
				name = event.target.dataset.name;
				address = event.target.dataset.address;
				content = event.target.dataset.content;
				latitude = event.target.dataset.latitude;
				longitude = event.target.dataset.longitude;
			}
			
			if (event.target.tagName == "P") {
				name = event.target.parentNode.parentNode.dataset.name;
				address = event.target.parentNode.parentNode.dataset.address;
				content = event.target.parentNode.parentNode.dataset.content;
				latitude = event.target.parentNode.parentNode.dataset.latitude;
				longitude = event.target.parentNode.parentNode.dataset.longitude;
			}
			
			var markerPosition  = new kakao.maps.LatLng(latitude, longitude); //마커 위치 (위도, 경도)

			var marker = new kakao.maps.Marker({ // 마커 생성
			    position: markerPosition,
			    clickable: true
			});
			
			//인포윈도우 표시 위치입니다
			var infoWindowPosition = new kakao.maps.LatLng(latitude, longitude);
			//인포윈도우에 표출될 내용 (HTML 문자열이나 DOM 객체)
			var infoWindowContent = `<div style="padding:5px;">${"${name}"}${"${address}"}</div>`;
			
			var infowindow = new kakao.maps.InfoWindow({
			    position : infoWindowPosition, 
			    content : infoWindowContent
			});
			
			marker.setMap(map);
			
			kakao.maps.event.addListener(marker, 'click', function() {
				locationContent.textContent = name + address + content;
			});
			
			// 마커 위에 인포윈도우를 표시
			infowindow.open(map, marker); 
			
		    // 이동할 위도 경도 위치
		    var moveLatLon = new kakao.maps.LatLng(latitude, longitude);
		    
		    // 지도 중심을 이동
		    map.panTo(moveLatLon);     
			
		    currentMarker = marker;
		    currentInfoWindow = infowindow;
		}		
	};
	
	resetFunc = function(event) {
		if (currentMarker != null) {
			currentMarker.setMap(null);
		}
		
		if (currentInfoWindow != null) {
			currentInfoWindow.close();
		}
		
		var markerPosition  = new kakao.maps.LatLng(latitude, longitude); //마커 위치 (위도, 경도)

		var marker = new kakao.maps.Marker({ // 마커 생성
		    position: markerPosition,
		    clickable: true
		});
		
		//인포윈도우 표시 위치입니다
		var infoWindowPosition = new kakao.maps.LatLng(latitude, longitude);
		//인포윈도우에 표출될 내용 (HTML 문자열이나 DOM 객체)
		var infoWindowContent = `<div style="padding:5px;">현재 위치</div>`;
		
		var infowindow = new kakao.maps.InfoWindow({
		    position : infoWindowPosition, 
		    content : infoWindowContent
		});
		
		marker.setMap(map);
		
		// 마커 위에 인포윈도우를 표시
		infowindow.open(map, marker); 
		
		// 이동할 위도 경도 위치
	    var moveLatLon = new kakao.maps.LatLng(latitude, longitude);
	    
	    // 지도 중심을 이동
	    map.panTo(moveLatLon);
	    
	    currentMarker = marker;
	    currentInfoWindow = infowindow;
	};
	
	getCoords = function(address) {
		var geoCoder = new kakao.maps.services.Geocoder();

		var coords = {};
		
		// 주소로 좌표를 검색
		geoCoder.addressSearch(address, function(result, status) {
		  
			// 검색 성공
			if (status == kakao.maps.services.Status.OK) {
				coords.latitude = result[0].y;
				coords.longitude = result[0].x;
				
				locationContent.textContent = "latitude : " + coords.latitude + "longitude : " + coords.longitude;
			} else {
				locationContent.textContent = "invalid address";
			}
		});
	}
	
	pageBtn.addEventListener("click", pageBtnFunc);
	
	listLocation.addEventListener("click", listFunc);
	
	resetMap.addEventListener("click", resetFunc);
	
	(function nearLocation() {
		var places = new kakao.maps.services.Places(); 
		
		var callback = function(result, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
		    	var listLi = "";

		    	listLi += "검색 결과 수 : " + pagination.totalCount;
		    	listLi += "페이지 수 : " + pagination.last;
		    	
		    	result.forEach(function(element, index) {
		    		var name = element.place_name;
		    		var address = element.address_name;
		    		var latitude = element.y;
					var longitude = element.x;
					var place_url = element.place_url;

					var str = `<li data-name='${"${name}"}' data-address='${"${address}"}' data-latitude='${"${latitude}"}' data-longitude='${"${longitude}"}' data-place_url='${"${place_url}"}'>`;
					str += "<div>";
					str += `<p>${"${name}"}</p>`;
					str += `<p>${"${address}"}</p>`;
					str += "</div>"
					str += "</li>";

				    listLi += str;
				});
				
		    	nearListLocation.innerHTML = listLi;
		    	
		    	(function nearLocationCountPage(pagination) {
		    		console.log(pagination);

		    		document.getElementsByClassName("nearPageBtn")[0].classList.remove("d-none");

		    	    if (pagination.hasPrevPage) {
		    	    	document.getElementsByClassName("first-page")[0].style.display = "block";
		    	    	
		    	    	document.getElementsByClassName("first-page")[0].removeEventListener("click", pageFirst);
		    	    	
		    	    	pageFirst = function(event) {
		    	    		event.preventDefault();
		    	    		
		    	    		pagination.gotoFirst();
		    	    	};
		    	    	
		    	    	document.getElementsByClassName("first-page")[0].addEventListener("click", pageFirst);
		    	    	
		    	    	document.getElementsByClassName("prev-page")[0].style.display = "block";
		    	    	
		    	    	document.getElementsByClassName("prev-page")[0].removeEventListener("click", pagePrev);
		    	    	
		    	    	pagePrev = function(event) {
		    	    		event.preventDefault();
		    	    		
		    	    		pagination.prevPage();
		    	    	};
		    	    	
		    	    	document.getElementsByClassName("prev-page")[0].addEventListener("click", pagePrev);
		    	    } else {
		    	    	document.getElementsByClassName("first-page")[0].style.display = "none";
		    	    	document.getElementsByClassName("prev-page")[0].style.display = "none";
		    	    }

		    	    document.getElementsByClassName("current-page")[0].textContent = pagination.current;
		    	    
		    	    if (pagination.hasNextPage) {
		    	    	document.getElementsByClassName("next-page")[0].style.display = "block";
		    	    	
		    	    	document.getElementsByClassName("next-page")[0].removeEventListener("click", pageNext);
		    	    	
		    	    	pageNext = function(event) {
		    	    		event.preventDefault();
		    	    		
		    	    		pagination.nextPage();
		    	    	};
		    	    	
		    	    	document.getElementsByClassName("next-page")[0].addEventListener("click", pageNext);
		    	    	
		    	    	document.getElementsByClassName("last-page")[0].style.display = "block";
		    	    	
		    	    	document.getElementsByClassName("last-page")[0].removeEventListener("click", pageLast);
		    	    	
		    	    	pageLast = function(event) {
		    	    		event.preventDefault();
		    	    		
		    	    		pagination.gotoLast();
		    	    	};
		    	    	
		    	    	document.getElementsByClassName("last-page")[0].addEventListener("click", pageLast);
		    	    } else {
		    	    	document.getElementsByClassName("next-page")[0].style.display = "none";
		    	    	document.getElementsByClassName("last-page")[0].style.display = "none";
		    	    }
		    	    
		    	    document.getElementsByClassName("goPage")[0].removeEventListener("click", pageSelect);
		    	    
		    	    pageSelect = function(event) {
		    	    	var pageValue = document.getElementsByClassName("pageValue")[0].value;
		    	    	
		    	    	if (pageValue > 0 && pageValue < pagination.last + 1) {
		    	    		event.preventDefault();
			    	    	
			    	    	pagination.gotoPage(document.getElementsByClassName("pageValue")[0].value);
		    	    	} else {
		    	    		return;
		    	    	}
		    	    };
		    	    
		    	    document.getElementsByClassName("goPage")[0].addEventListener("click", pageSelect);
		    	})(pagination);
		    } else {
		    	if (status === kakao.maps.services.Status.ZERO_RESULT) {
		    		nearListLocation.textContent = "ZERO_RESULT";
		    		document.getElementsByClassName("nearPageBtn")[0].classList.add("d-none");
		    	}
		    	if (status === kakao.maps.services.Status.ERROR) {
		    		nearListLocation.textContent = "ERROR";
		    		document.getElementsByClassName("nearPageBtn")[0].classList.add("d-none");
		    	}
		    }
		};
		
		var options = {
				location: new kakao.maps.LatLng(latitude, longitude),
				radius: 10000,
				size: 10,
				page: 1,
				sort: kakao.maps.services.SortBy.DISTANCE
		};
		
		places.keywordSearch('헬스클럽', callback, options);
	})();
	
	document.getElementsByClassName("nearListLocation")[0].addEventListener("click", function(event) {
		if (event.target.tagName == "LI" || event.target.tagName == "P") {
			
			if (currentMarker != null) {
				currentMarker.setMap(null);
			}
			
			if (currentInfoWindow != null) {
				currentInfoWindow.close();
			}

			var name = null;
			var address = null;
			var latitude = null;
			var longitude = null;
			var place_url = null;
			
			if (event.target.tagName == "LI") {
				name = event.target.dataset.name;
				address = event.target.dataset.address;
				latitude = event.target.dataset.latitude;
				longitude = event.target.dataset.longitude;
				place_url = event.target.dataset.place_url;
			}
			
			if (event.target.tagName == "P") {
				name = event.target.parentNode.parentNode.dataset.name;
				address = event.target.parentNode.parentNode.dataset.address;
				latitude = event.target.parentNode.parentNode.dataset.latitude;
				longitude = event.target.parentNode.parentNode.dataset.longitude;
				place_url = event.target.parentNode.parentNode.dataset.place_url;
			}
			
			var markerPosition  = new kakao.maps.LatLng(latitude, longitude); //마커 위치 (위도, 경도)

			var marker = new kakao.maps.Marker({ // 마커 생성
			    position: markerPosition,
			    clickable: true
			});
			
			//인포윈도우 표시 위치입니다
			var infoWindowPosition = new kakao.maps.LatLng(latitude, longitude);
			//인포윈도우에 표출될 내용 (HTML 문자열이나 DOM 객체)
			var infoWindowContent = `<div style="padding:5px;">${"${name}"}${"${address}"}</div>`;
			
			var infowindow = new kakao.maps.InfoWindow({
			    position : infoWindowPosition, 
			    content : infoWindowContent
			});
			
			marker.setMap(map);
			
			kakao.maps.event.addListener(marker, 'click', function() {
				locationContent.textContent = name + address + place_url;
			});
			
			// 마커 위에 인포윈도우를 표시
			infowindow.open(map, marker); 
			
		    // 이동할 위도 경도 위치
		    var moveLatLon = new kakao.maps.LatLng(latitude, longitude);
		    
		    // 지도 중심을 이동
		    map.panTo(moveLatLon);     
			
		    currentMarker = marker;
		    currentInfoWindow = infowindow;
		}		
	});
	
	showList(page, pageCount, listCount);
	
	initMap();
};

</script>
<%@include file="../includes/footer.jsp" %>