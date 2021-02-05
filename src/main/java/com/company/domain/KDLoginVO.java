package com.company.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class KDLoginVO {
	private String userName;
	private String userId;
	private String password;
	private String confirm_password;
	private String address;
	private String phoneNumber;
	private String userEmail;
	private String userBirth;
	private String[] favorite_activity;
	private Date regdate;
	
	private char auth;
	private String userInfo;
}
