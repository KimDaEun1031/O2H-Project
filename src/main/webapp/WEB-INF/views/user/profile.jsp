<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>FitURJC Profile</title>
    <link rel="shortcut icon" href="img/iconLogo.ico" />
    
    <meta name="description" content="Love Authority." />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />

    <link rel="stylesheet" href="/resources/css/profile.css" />
<style>
ul li{
    list-style: none;
    padding: 10px;
}
</style>
</head>

<body>
    <section class="hero">
        <header>
            <h1>Your fitURJC profile</h1>
            <br>
        </header>
        <div class="container"> 
            <div class="row" id="card_body">
                    <div class="col-md-3" id="personal_information">
                        <span id="profile_pic">
                            <img id="myImg" src="/resources/img/profile/fiturjc_default_user.jpg" class="img-circle" alt="Profile Image" style='object-fit:contain' />
                           
                            <!-- 첨부 파일 보여주기 -->
							<div class="bigPictureWrapper">
								<div class="bigPicture"></div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="panel panel-default">
										<div class="panel-heading"><i class="fa fas fa-file"></i> </div>
										<div class="panel-body">				
											<div class="uploadResult">
												<ul></ul>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 첨부물 보여주기 -->
							<script>
								//현재 글 번호 가져오기->read->reply => 결과를 read
								var userIdVal = '${loginInfo.userId}';
							</script> 
                        </span>
                        <br>
                        <span id="user_name">
                            <h4>${loginInfo.userName}</h4>
                        </span>
                        <span id="age">
                            <h5>${loginInfo.userBirth}</h5>
                        </span>
                    </div>
                    <div class="col-md-8" id="performance_profile">
                        <div id="information_user">    
                            <h3>Who am I?<h3>            
                            <p>
                                Here you can describe you briefly. You can talk about your sports tastes, goals that you
                                plan to achieve in our gym, etc.
                            </p>
                            <br>
                            <h3>Who am I?<h3>            
                            <p>
                                Here you can describe you briefly. You can talk about your sports tastes, goals that you
                                plan to achieve in our gym, etc.
                            </p>
                            <br>
                        </div>
                        <span>
                            <a href="/">Next activities in which I have registered</a><br>
                        </span>
                        <span>
                            <a href="/user/profile_setting">I want to edit my profile</a>
                        </span>
                    </div>
            </div>
            <div class="clearfix"></div> 
            <div class="col-md-12 footer"></div>
        </div>
    </section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- <script src="/resources/js/user_my.js"></script> -->
<script src="/resources/js/profile.js"></script>
    </body>
</html>