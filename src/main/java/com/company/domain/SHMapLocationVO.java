package com.company.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SHMapLocationVO {
	private int lno;
	private String name;
	private String address;
	private String content;
	private String latitude;
	private String longitude;
}
