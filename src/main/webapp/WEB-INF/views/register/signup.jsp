<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>02H | 회원가입</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
  <link rel="stylesheet" href="/resources/css/register.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.js"></script>
  <script type="text/javascript">  
	    $(function() {
			var error = '${error}';
			if(error!=''){
				alert(error);
			}
		})    
	    
  </script>
  <script src="/resources/js/register.js"></script> 
</head>
<body>
  <div class="card-body" id="card">
        <div class="container">
            <!-- Row for the background -->
            <div class="row" id="row_style">
      			<div id="profileForm" class="col-l-7 col-md-9 col-sm-7 col-xs-12 customized-text wow fadeInDown black-ed">
                    <div id="formCol" class="col-l-12 col-md-12 col-sm-7 col-xs-12">
						 <h1>회원가입</h1>
							<form  id="regist" class="form" method="post" action="/signup">
								<div class="form-group">
	                                <label for="name">UserId</label>
	                                <input style="border-radius:0px;background-color:black;!important" name="userId" type="text" class="form-control" id="userId" placeholder="아이디를 입력해주세요.">
	                                <small id="userId" class="text-info"></small>
	                            </div>
	                            <div class="form-group">
	                                <label for="pwd">PassWord</label>
	                                <input style="border-radius:0px!important" type="password" name="password" class="form-control" id="password" placeholder="비밀번호를 입력해주세요.">
	                                <small id="password" class="text-info"></small>
	                            </div>
	                            <div class="form-group">
	                                <label for="pwd">Confirm PassWord:</label>
	                                <input style="border-radius:0px!important" type="password" name="confirm_password" class="form-control" id="confirm_password" placeholder="비밀번호를 한 번 더 입력해주세요.">	                                 
						        	<small id="confirm_password" class="text-info"></small>
	                            </div>
	                            <div class="form-group">	                                
	                                <label for="name">UserName</label>
	                                <input style="border-radius:0px!important" type="text" name="userName" class="form-control" id="userName" placeholder="이름을 입력해주세요.">	                                 
							        <small id="userName" class="text-info"></small>
	                            </div>
	                            <div class="form-group">
	                                <label for="name">Address</label>
	                                <input style="border-radius:0px!important" type="text" name="address" class="form-control" id="address" placeholder="주소를 입력해주세요.">	                                
							        <small id="address" class="text-info"></small>
	                            </div>
	                            <div class="form-group">
	                                <label for="name">Phone Number</label>
	                                <input style="border-radius:0px!important" type="text" name="phoneNumber" class="form-control" id="phoneNumber" placeholder="전화번호를 입력해주세요.">
	                                <small id="phoneNumber" class="text-info"></small>
	                            </div>
	                            <div class="form-group">
	                                <label for="email">Email</label>
	                                <input style="border-radius:0px!important" type="email" class="form-control" name="userEmail" id="userEmail" placeholder="이메일을 입력해주세요.">
	                                <small id="userEmail" class="text-info"></small>
	                            </div>
	                            <div class="form-group">
	                                <label for="name">UserBirth</label>
	                                <input style="border-radius:0px!important" type="date" name="userBirth" class="form-control" id="userBirth">
	                                <small id="userBirth" class="text-info"></small>
	                            </div>
	                            
                            
						      <fieldset>  
							      <legend>관심분야를 고르세요(최대 3개)</legend>  
							      <input type="checkbox" name="favorite_activity" value="체지방 감량" onclick="return ValidateActivitySelection();">체지방 감량<br>  
							
							      <input type="checkbox" name="favorite_activity" value="근비대" onclick="return ValidateActivitySelection();">근비대<br>  
							
							      <input type="checkbox" name="favorite_activity" value="스트렝스" onclick="return ValidateActivitySelection();">스트렝스<br>  
							
							      <input type="checkbox" name="favorite_activity" value="재활" onclick="return ValidateActivitySelection();">재활<br>
							
							      <input type="checkbox" name="favorite_activity" value="유연성 강화" onclick="return ValidateActivitySelection();">유연성 강화<br>  
							
							      <input type="checkbox" name="favorite_activity" value="친목도모 감량" onclick="return ValidateActivitySelection();">친목도모<br>  
						      </fieldset>
						
								 <div id="submit" class="col-l-10 col-md-12 col-sm-10 col-xs-12" >
		                            <button type="submit" class="btn btn-success float-right" style="margin-left: 5px;" id="register-btn">완료</button>
		                            <button type="reset" class="btn btn-primary float-right" id="cancel-btn" onclick="location.href='/'">취소</button>
	                           	 </div>
															    
						   </form>
					    </div>
				    </div>
			    </div>
		    </div>
	    </div>
	    <script>
		    function ValidateActivitySelection()  
		    {  
		        var checkboxes = document.getElementsByName("favorite_activity");  
		        var numberOfCheckedItems = 0;  
		        for(var i = 0; i < checkboxes.length; i++)  
		        {  
		            if(checkboxes[i].checked)  
		                numberOfCheckedItems++;  
		        }  
		        if(numberOfCheckedItems > 3)  
		        {  
		            alert("관심분야는 최대 3개까지 고를 수 있습니다");  
		            return false;  
		        }  
		    }  		    
	    </script>
	</body>
</html> 