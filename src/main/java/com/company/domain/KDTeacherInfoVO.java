package com.company.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class KDTeacherInfoVO {
	private String userId;
	private String userName;
	private char user_level;
	private String main_sports;
	private char teacher_level;
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
}
