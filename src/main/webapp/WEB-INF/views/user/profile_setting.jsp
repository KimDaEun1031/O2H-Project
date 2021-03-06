<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>FitURJC Profile Settings</title>
    <link rel="shortcut icon" href="/resources/img/iconLogo.ico" />

    <meta name="description" content="Love Authority." />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <link rel="stylesheet" href="/resources/css/register.css" />
    <!-- <script type="text/javascript" src="/resources/js/uploadImg.js"></script> -->
	<!-- CSS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
	
    <!-- Custom css -->
    <!-- Custom scripts for this template -->
    <!-- 비밀번호 확인 메시지 -->
    <script>
    $(function() {
		var error = '${error}';
		if(error!=''){
			alert(error);
		}
	})   
    </script>
</head>

<body>
    <div class="card-body" id="card">
        <div class="container">
            <!-- Row for the background -->
            <div class="row" id="row_style">
                <!-- Section Header -->
                <div id="imageForm" class="col-l-3 col-md-3 col-sm-3 col-xs-12 section-header wow fadeInDown">
                    	<h3>Profile_Image</h3>
                    <span id="profile_pic">
                        <img id="myImg" src="" class="img-circle" alt="" style='object-fit:contain' />
                    </span>
					<div class="uploadResult" style="display:none;">
						<ul></ul>
					</div>
                    <br>
                    <%-- 파일등록 --%>
				<div>	
					<label for="files" class="btn btn-primary" id="changeImgBtn">Select Image</label>		
					 <input id="files" name="uploadFile" id="" type="file" accept='image/jpeg,image/gif,image/png' style="visibility:hidden;">
				</div>

                </div>
                <!-- Section Header End. Col divide into columms-->
                <div id="profileForm" class="col-l-7 col-md-9 col-sm-7 col-xs-12 customized-text wow fadeInDown black-ed">
                    <div id="formCol" class="col-l-12 col-md-12 col-sm-7 col-xs-12">
                        <h1>FitURJC Account</h1>
                        <!-- 정보 수정 폼 -->
                        <form role="form" method="post" class="infoUpdateForm" action="infoUpdateForm">
                            <div class="form-group">                            	
                                <label for="name">UserId:</label>
                                <input style="border-radius:0px;background-color:black;!important" name="userId" type="name" class="form-control" id="name" placeholder="William Wallace" readonly value="${loginInfo.userId}" >
                            </div>
                            <div class="form-group">
                                <label for="name">User Name:</label>
                                <input style="border-radius:0px!important" type="text" name="userName" class="form-control" id="userName" value="${loginInfo.userName}">
                                <small id="userName" class="text-info"></small>
                            </div>
                            <div class="form-group">
                                <label for="name">Address:</label>
                                <input style="border-radius:0px!important" type="text" name="address" class="form-control" id="address" value="${loginInfo.address}">
                                <small id="address" class="text-info"></small>
                            </div>
                            <div class="form-group">
                                <label for="name">Phone Number:</label>
                                <input style="border-radius:0px!important" type="text" name="phoneNumber" class="form-control" id="phoneNumber" value="${loginInfo.phoneNumber}">
                                <small id="phoneNumber" class="text-info"></small>
                            </div>
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input style="border-radius:0px!important" type="email" class="form-control" name="userEmail" id="userEmail" placeholder="william99@fiturjc.com" value="${loginInfo.userEmail}">
                                <small id="userEmail" class="text-info"></small>
                            </div>
                            <div class="form-group">
                                <label for="name">User Birth:</label>
                                <input style="border-radius:0px!important" type="date" name="userBirth" class="form-control" id="userBirth" value="${loginInfo.userBirth}">
                                <small id="userBirth" class="text-info"></small>
                            </div>
                            <div id="submit" class="col-l-10 col-md-12 col-sm-10 col-xs-12">
	                            <button type="submit" class="btn btn-primary " id="update-btn"> 개인정보 수정 </button>
	                            <button type="reset" class="btn btn-primary " id="cancel-btn" onclick="location.href='user_my'"> Cancel </button>
                            </div>
                        </form>
                        <br />
                        <hr />
                        <!-- 비밀번호 수정 폼 -->
                        <h2>Change Password</h2>
                        <form role="form" class="passwordForm" method="post" action="passwordForm">
                            <div class="form-group">
                                <label for="pwd">password:</label>
                                <input style="border-radius:0px!important" type="password" name="password" class="form-control" id="password" placeholder="Enter password">
                                <small id="password" class="text-info"></small>
                            </div>
                            <div class="form-group">
                                <label for="pwd">New password:</label>
                                <input style="border-radius:0px!important" type="password" name="new_password" class="form-control" id="new_password" placeholder="Enter new password">
                                <small id="new_password" class="text-info"></small>
                            </div>
                            <div class="form-group">
                                <label for="pwd">Confirm new password:</label>
                                <input style="border-radius:0px!important" type="password" name="confirm_password" class="form-control" id="confirm_password" placeholder="Repeat new password">
                                <small id="confirm_password" class="text-info"></small>
                            </div>
                        <div id="submit" class="col-l-10 col-md-12 col-sm-10 col-xs-12">
                            <button type="submit" class="btn btn-primary passwordBtn" id="pwd-btn"> 비밀번호 수정 </button>
                            <button type="reset" class="btn btn-primary " id="cancel-btn" onclick="location.href='user_my'"> Cancel </button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <div class="container">
                <div class="row">
                    <div class="footer-containertent">
                        <p class="mt-4 social-login text-center">
                            <a href="#" class="btn btn-twitter">
                                <em class="ion-social-twitter"></em>
                            </a>
                            <a href="#" class="btn btn-facebook">
                                <em class="ion-social-facebook"></em>
                            </a>
                            <a href="#" class="btn btn-linkedin">
                                <em class="ion-social-linkedin"></em>
                            </a>
                            <a href="#" class="btn btn-google">
                                <em class="ion-social-googleplus"></em>
                            </a>
                            <a href="#" class="btn btn-github">
                                <em class="ion-social-github"></em>
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </footer>
    </div>  
<script>
var projectPath = '${pageContext.request.contextPath}';
</script>
<script src="/resources/js/profileSetting.js"></script>
</body>