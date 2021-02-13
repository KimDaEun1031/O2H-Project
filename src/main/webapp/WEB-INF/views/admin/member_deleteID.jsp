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
                                회원 탈퇴
                            </p>
                            <div class="mt-4">
                                <form method="post" action="/admin/member_deleteID">
                                    <div class="form-group">

                                        <input type="text" class="form-control" id="userId" name="userId" value="${del.userId}">

                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="password" name="password" value="${del.password}">
                                    </div>
                                    <label class="custom-control custom-checkbox mt-2">
                                      
                                    </label>

                                    <button type="submit" class="btn btn-danger float-right" id="singinbtn" >탈퇴</button>                                  
                                </form>
                                <div class="clearfix"></div>
                                <p class="content-divider center mt-4">
                                  
                                </p>
                            </div>
                            <p class="mt-4 social-login text-center">
                             
                            </p>
                            <p class="text-center" style="margin: 10px;">                               
                               정말로 이 계정을 강제 탈퇴 시키시겠습니까? 
                               다시는 되돌릴 수 없습니다.
                            </p>
                            <p class="text-center">

                                <button type="submit" class="btn btn-primary" id="goBackbtn">돌아가기</button>
                                <script type="text/javascript">
                                    document.getElementById("goBackbtn").onclick = function () {
                                        location.href = "/admin/member_control";

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