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

</head>

<body>
    <div class="card-body" id="card">
        <div class="container">
            <!-- Row for the background -->
            <div class="row" id="row_style">             
                <div id="profileForm" class="col-l-7 col-md-9 col-sm-7 col-xs-12 customized-text wow fadeInDown black-ed">
                    <div id="formCol" class="col-l-12 col-md-12 col-sm-7 col-xs-12">
                        <h1>회원 수정</h1>                                  
                        <form role="form" method="post" id="profile-form" action="/admin/update">
                        	<div class="form-group">
                                <label for="userId">아이디</label>
                                <input style="border-radius:0px!important;" name="userId" class="form-control" id="userId" value="${member.userId}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="user_level">회원 구분</label>
                                <input style="border-radius:0px!important" name="user_level" class="form-control" id="user_level" value="${member.user_level}" >
                            </div>             
	                        <div id="submit" class="col-l-10 col-md-12 col-sm-10 col-xs-12">	                           
	                            <button type="submit" class="btn btn-primary " id="update-btn" >수정</button>
	                            <button type="reset" class="btn btn-primary " id="cancel-btn" onclick="location.href='member_control'">취소</button>	                                                                 	                            
	                        </div>
                        </form>  
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>