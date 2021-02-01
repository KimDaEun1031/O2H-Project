<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>FitURJC Login</title>
    <link rel="shortcut icon" href="/resources/img/iconLogo.ico" />
    
    <meta name="description" content="Love Authority." />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />

    <link rel="stylesheet" href="/resources/css/register.css" />


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
                                Sign in to access your Authority account
                            </p>
                            <div class="mt-4">
                                <form method="post">
                                    <div class="form-group">
<<<<<<< HEAD
                                        <input type="email" class="form-control" id="userId" value="" placeholder="Enter your ID">
=======
                                        <input type="email" class="form-control" id="email" value="" placeholder="Enter email address">
>>>>>>> b4858c39c7e4d169d16d929dca7b25c7092530a6
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="password" value="" placeholder="Enter password">
                                    </div>
                                    <label class="custom-control custom-checkbox mt-2">
                                        <input type="checkbox" class="custom-control-input">
                                        <span class="custom-control-indicator"></span>
                                        <span class="custom-control-description text-white">Keep me logged in</span>
                                    </label>
                                    <button type="submit" class="btn btn-primary float-right" id="singinbtn">Sign in</button>
                                    <script type="text/javascript">
                                        document.getElementById("singinbtn").onclick = function () {
                                            location.href = "user.html";
                                        };
                                    </script>
                                    <!-- Este ultimo script no va y no sé porqué -->
                                </form>
                                <div class="clearfix"></div>
                                <p class="content-divider center mt-4">
                                    <span>or</span>
                                </p>
                            </div>
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
                            <p class="text-center">
                                Don't have an account yet?
                                <a href="SignUp.html">Sign Up Now</a>
                            </p>
                            <p class="text-center">
<<<<<<< HEAD
                                <button type="submit" class="btn btn-primary" id="goBackbtn">go Mainpage</button>
                                <script type="text/javascript">
                                    document.getElementById("goBackbtn").onclick = function () {
                                        location.href = "/";
=======
                                <button type="submit" class="btn btn-primary" id="goBackbtn">Go Back</button>
                                <script type="text/javascript">
                                    document.getElementById("goBackbtn").onclick = function () {
                                        location.href = "index.html";
>>>>>>> b4858c39c7e4d169d16d929dca7b25c7092530a6
                                    };
                                </script>
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

</body>

</html>