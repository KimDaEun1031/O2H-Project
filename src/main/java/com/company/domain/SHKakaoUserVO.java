package com.company.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

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
public class SHKakaoUserVO {
	private String id;
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private Date connected_at;
	private SHKakaoAccountVO kakao_account;
	private SHKakaoPropertyVO properties;
}
