package com.company.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class HYChangeVO {
	private String userId;
	private String password;
	//profile_setting 페이지에서 수정
	private String userName;
	private String userEmail;
	private String new_password;
	private String confirm_password;
	private String address;
	private String phoneNumber;
	private String userBirth;	
	
	//teacher_profile_setting 부분
	private String userInfo;		
	
	//파일 첨부 목록
	private List<HYFileAttach> attachList;
	
	//비밀번호 동일성 검증
	public boolean newPasswordEqualsConfirmPassword() {
		return new_password.equals(confirm_password);
	}
	
}
