package com.company.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
public class KDAuthVO {
	private String userName;
	private String userId;
	private String auth;
}
