package com.company.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
public class KDLoginInfoVO {
	private String userName;
	private String userId;
	private String password;
	private String address;
	private String phoneNumber;
	private String userEmail;
	private String userBirth;
	private String[] favorite_activity;
	private Date regDate;
	private String user_level;
	private String userInfo;
	
}
