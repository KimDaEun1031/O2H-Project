package com.company.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HYChangeVO {
	//아이디-비번은 세션에서 받아오고
	private String userId;
	private String password;
	//profile_setting 페이지에서 수정
	private String userName;
	private String userEmail;
	private String new_password;
	private String confirm_password;
	//수정 필드 추가
	private String address;
	private String phoneNumber;
	private String userBirth;	
	
	//teacher_profile_setting 부분
	private String userInfo;	
	
	
	//파일 첨부 목록
	private List<HYFileAttach> attachList;
	
	//이거 동작 안하네-하는지 안하는지, 유효성 검증거니까 상관 없어진듯.
	public boolean newPasswordEqualsConfirmPassword() {
		return new_password.equals(confirm_password);
	}
	
}
