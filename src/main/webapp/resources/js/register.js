/**
 * 
 */
$(function(){
    $("#regist").validate({
        //규칙정의 - 이름
        rules:{
            userId:{ //영어대소문자,숫자,특수문자 허용,5~12자리 가능
                required:true,				
            },
            password:{
                required:true,
                validPwd:true
            },
            confirm_password:{
                required:true,
                validPwd:true,
                equalTo:"#password"
            },
			userName:{
				required:true,
				validName:true,
				rangelength:[2,4]
			},
            address:{
                required:true,
				validAddr:true
            },
            userEmail:{
                required:true,
                validEmail:true
            },
			phoneNumber : {
				required:true,
				validPhone:true
			},			
			userBirth : {
				required:true,
				validBirth:true				
			}			
        },
        //규칙에 대한 메세지 정의
        messages:{
            userId:{
                required : "아이디를 입력해주세요",
				remote:"이 아이디 사용이 불가능합니다."
            },
            password:{
                required : "비밀번호를 입력해주세요"
            },
            confirm_password:{
                required:"비밀번호를 한 번 더 입력해주세요.",                
                equalTo:"이전 비밀번호와 다릅니다."
            },
			userName:{
				required:"이름을 입력해주세요.",
				rangelength:"이름은 2~4자리 사이입니다."
			},
            address:{
                required:"주소를 입력해주세요."
            },
            userEmail:{
                required:"이메일을 입력해주세요"
            }, 
			phoneNumber:{
                required:"전화번호를 입력해주세요"
            },
			userBirth:{
                required:"생년월일을 입력해주세요"
            }           
        },
		errorPlacement:function(error,element){
			$(element).closest("form")
			          .find("small[id='"+element.attr('id')+"']")
                      .append(error);
			      
		},
		success: function(label) {
            var name = label.attr('for');
            label.text(name+ ' is ok!');
        }
    });
})
//사용자 검증 메소드 추가

$.validator.addMethod("validName", function(value) {
	var regName = /^[a-z|A-Z|0-9|가-힇|\*]{1,10}$/;
	return regName.test(value);
}, "이름을 확인해 주세요.  1~10자");
//사용자 검증 메소드 추가-주소
$.validator.addMethod("validAddr", function(value) {
	var regAddr = /^[가-힣A-Za-z\d\s]{1,100}$/;
	return regAddr.test(value);
}, "주소를 확인해 주세요.");
//사용자 검증 메소드 추가-전화번호
$.validator.addMethod("validPhone", function(value) {
	var regPhone = /^(?=.*[\d])[\d]{1,13}$/;
	return regPhone.test(value);
}, "전화번호를 확인해 주세요.");
//사용자 검증 메소드 추가-이메일
$.validator.addMethod("validEmail", function(value) {
	var regEmail = /^.+@.+\..+$/;
	return regEmail.test(value);
}, "email을 확인해 주세요.");
//사용자 검증 메소드 추가-생일
$.validator.addMethod("validBirth", function(value) {
	var regBirth = /\d{4}-\d{2}-\d{2}$/;
	return regBirth.test(value);
}, "생일을 확인해 주세요.");
$.validator.addMethod("validPwd", function(value) {
	var regPwd = /^(?=.*[\d])[A-Za-z\d!@#$%^&*]{5,15}$/;
	return regPwd.test(value);
}, "비밀번호를 5~15자리로 만들어 주세요");


