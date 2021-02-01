package com.company.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class LoginVO {
	String userid;
	String name;
	String password;
	String phoneNumber;
	String email;
	String[] purpose;
	
}
