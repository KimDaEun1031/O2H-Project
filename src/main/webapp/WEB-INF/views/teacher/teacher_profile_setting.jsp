<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>FitURJC Profile Settings</title>
    <link rel="shortcut icon" href="img/iconLogo.ico" />

    <meta name="description" content="Love Authority." />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js" type="text/javascript"></script>

    <!-- Custom css -->
    <link rel="stylesheet" href="/resources/css/register.css" />
    <!-- Custom scripts for this template -->
    <script type="text/javascript" src="/resources/js/uploadImg.js"></script>

</head>

<body>
    <div class="card-body" id="card">
        <div class="container">
            <!-- Row for the background -->
            <div class="row" id="row_style">
                <!-- Section Header -->
                <div id="imageForm" class="col-l-3 col-md-3 col-sm-3 col-xs-12 section-header wow fadeInDown">
                    <span id="profile_pic">
                        <img id="myImg" src="" class="img-circle" alt="Profile Image" style='object-fit:contain' />
                    </span>
					<div class="uploadResult" style="display:none;">
						<ul></ul>
					</div>
                    <br>
                    <div>
                        <!-- <label for="files" class="btn btn-primary" id="changeImgBtn">Select Image</label>
                        <input id="files" style="visibility:hidden;" type="file"> -->
                        <label for="files" class="btn btn-primary" id="changeImgBtn">Select Image</label>		
					    <input id="files" name="uploadFile" id="" type="file" accept='image/jpeg,image/gif,image/png' style="visibility:hidden;">
                    </div>

                </div>
                <!-- Section Header End. Col divide into columms-->
                <div id="profileForm" class="col-l-7 col-md-9 col-sm-7 col-xs-12 customized-text wow fadeInDown black-ed">
                    <div id="formCol" class="col-l-12 col-md-12 col-sm-7 col-xs-12">
                        <h1>FitURJC Account</h1>                                  
                        <form role="form" method="GET" id="profile-form" action="teacher_my_stream">
                        	<div class="form-group">
                                <label for="userId">아이디</label>
                                <input style="border-radius:0px!important" name="userName" class="form-control" id="userId" value="${loginInfo.userId}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="userInfo">강사소개</label>
                                <textarea style="border-radius:0px!important" class="form-control-comment" name="userInfo" id="userInfo">${loginInfo.userInfo}</textarea>
                            </div>             
	                        <div id="submit" class="col-l-10 col-md-12 col-sm-10 col-xs-12">	                           
	                            <button type="submit" class="btn btn-primary " id="update-btn" >수정 완료</button>
	                            <button type="reset" class="btn btn-primary " id="cancel-btn" onclick="location.href='teacher_my_stream'">수정 취소</button>	                                                                 	                            
	                        </div>
                        </form>  
                    </div>
                </div>
            </div>
        </div>
    </div>
<script src="/resources/js/teacher_profile_setting.js"></script>
</body>