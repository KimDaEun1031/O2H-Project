package com.company.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
public class KDLoginInfoVO {
	private String userName;
	private String userId;
	private String user_level;
	private String userInfo;
}
