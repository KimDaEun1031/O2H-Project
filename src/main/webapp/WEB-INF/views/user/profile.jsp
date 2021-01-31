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
                            <img src="/resources/img/profile/fiturjc_default_user.jpg" class="img-circle" alt="Profile Image" style='object-fit:contain' />
                        </span>
                        <br>
                        <span id="user_name">
                            <h4>William Wallace</h4>
                        </span>
                        <span id="age">
                            <h5>19 years</h5>
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
                            <a href="user.html#actregist">Next activities in which I have registered</a><br>
                        </span>
                        <span>
                            <a href="profile_settings.html">I want to edit my profile</a>
                        </span>
                    </div>
            </div>
            <div class="clearfix"></div> 
            <div class="col-md-12 footer"></div>
        </div>
    </section>
    </body>
</html>