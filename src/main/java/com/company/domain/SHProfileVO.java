package com.company.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SHProfileVO {
	private String userName;
	private String userId;
	private String password;
	private String confirm_password;
	private String address;
	private String phoneNumber;
	private String userEmail;
	private String userBirth;
	private List<String> favorite_activity;
	private Date regdate;
	private String user_level;
	private String userInfo;
	
	private String teacherInfo;
	private String mainSports;
	private String channelId;
	private char teacher_level;
}
