<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>02H | 로그인</title>
    <link rel="shortcut icon" href="/resources/img/iconLogo.ico" />
    
    <meta name="description" content="Love Authority." />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />

    <link rel="stylesheet" href="/resources/css/register.css" />

	<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>

<body>
    <!--hero section-->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-8 mx-auto">
                    <div class="card border-none">
                        <div class="card-body">
                            <div class="mt-2">
                                <!--
                                    <img src="img/" alt="Logo" class="brand-logo"/> 
                                    -->
                            </div>
                            <p class="mt-4 text-white lead text-center">
                                로그인
                            </p>
                            <div class="mt-4">
                                <form method="POST" action="/register/loginSuccess">
                                    <div class="form-group">

                                        <input type="text" class="form-control" id="userId" name="userId" placeholder="Enter your ID" required autofocus>

                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
                                    </div>
                                    
                                    <label class="custom-control custom-checkbox mt-2">
                                      
                                    </label>
                                    
                                    <a class="btn btn-primary float-right" style="margin-left: 5px;" href="/register/signup" role="button">회원가입</a> 
                                    <button type="submit" class="btn btn-success float-right">로그인</button>                                  
                                </form>
                                <div class="clearfix"></div>
                                <p class="content-divider center mt-4">
                                    <span>or</span>
                                </p>
                            </div>
                            <p class="mt-4 social-login text-center">
                            	<img class="kakaoLoginBtn" src="https://developers.kakao.com/tool/resource/static/img/button/login/full/ko/kakao_login_medium_narrow.png" />                       
                            </p>
                            <p class="text-center">
                                아직 회원가입을 안하셨나요?
                                <a href="/register/signup" style="margin-left: 5px; color: #aa7c7c;">회원가입</a>
                            </p>
                            <p class="text-center">
								<a class="btn btn-primary" href="/" role="button">메인 화면</a>                            
                            </p>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-sm-12 mt-5 footer">
                    <p class="text-white small text-center">
                    </p>
                </div>
            </div>
        </div>
    </section>
	<!-- 로그인 실패시 -->
	<%
		String temp=(String)session.getAttribute("loginFail");
		System.out.println(temp);
		if(temp=="fail"){
			%>
			<script>
			
			</script>
			
			<% 
		}
	%>
		<script>
	window.onload = function() {
		function kakaoLogin() {
			var xhr = new XMLHttpRequest();
			
			var callback = function() {
				if (xhr.readyState == xhr.DONE) {
					if (xhr.status == 200) {
						location.href = xhr.responseText;
					}
				}
			}
			
			xhr.onreadystatechange = callback;
			
			xhr.open("GET", "/register/login_kakaopage", false);
	        
			xhr.send();
	    }
		
		document.getElementsByClassName("kakaoLoginBtn")[0].addEventListener("click", function(event) {
			event.preventDefault();
			
			kakaoLogin();
		});
	};
	</script>
</body>

</html>
