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
	//여기는 SETTING 페이지에서 수정?
	private String userName;
	private String userEmail;
	private String new_password;
	private String confirm_password;
	//teacher_profile_setting 부분
	private String userInfo;
	
	//파일 첨부 목록
	private List<HYFileAttach> attachList;
	
	//이거 동작 안하네.
	public boolean newPasswordEqualsConfirmPassword() {
		return new_password.equals(confirm_password);
	}
}
